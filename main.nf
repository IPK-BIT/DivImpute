process indexVCF {
	container 'quay.io/biocontainers/bcftools:1.18--h8b25389_0'
	publishDir params.outdir+'/raw', mode: 'copy'

	input:
		path(vcfFile)

	output:
		path("${vcfFile}"), emit: vcf
		path("${vcfFile}.csi"), emit: index

	script:
	"""
	bcftools index ${vcfFile}
	"""
}

process listVariants {
	container 'quay.io/biocontainers/bcftools:1.18--h8b25389_0'

	input:
		path(vcfFile) 
		path(vcfFileIndex)
	output:
		path("variants.txt")
	script:
	"""
	bcftools query -f '%CHROM\t%POS\n' ${vcfFile} > variants.txt
	"""
}

process writeWindows {
	container 'quay.io/biocontainers/pandas:1.5.2'
	publishDir params.outdir, mode: 'copy'

	input:
		path(variantFile)
		val(windowSize)
		val(overlap)
	
	output:
		path("windows.txt")
	
	script:
	"""
	#!/usr/bin/env python3
	import pandas as pd
	from math import ceil
	windowSize=$windowSize
	overlap=$overlap

	df=pd.read_csv('${variantFile}', header=None, sep='\t')
	grouped_df = df.groupby(df[0])
	with open('windows.txt', 'w') as f:
		for group_name, group_data in grouped_df:
			tmp = group_data.reset_index(drop=True) 
			end = 0
			for i in range(0, ceil(len(tmp)/windowSize)+1):
				start = max(end-overlap, 0)
				end = min(start+windowSize, len(tmp))
				f.write(str(group_name)+':'+str(tmp[1][start])+'-'+str(tmp[1][end-1])+'\\n')
	"""
}

process splitVCFByWindow {
  container 'quay.io/biocontainers/bcftools:1.18--h8b25389_0'
	publishDir params.outdir+'/windows', mode: 'copy'

	input:
		val(window)
		path(vcfFile)
		path(vcfFileIndex)
	output:
		path("${window}_${vcfFile}")
	script:
	"""
	bcftools view -r ${window} ${vcfFile} -Oz -o ${window}_${vcfFile}
	"""
}

process imputeWindows {
	container 'quay.io/biocontainers/beagle:5.4_22Jul22.46e--hdfd78af_0'
	publishDir params.outdir+'/imputed/windows', mode: 'copy'

	input:
		path(vcfFile)
	output:
		path("imputed_${vcfFile}")
	script:
	"""
	beagle gt=${vcfFile} out=imputed_${vcfFile.name.replaceAll('.vcf.gz', '')}
	"""
}

process indexImputedWindow {
	container 'quay.io/biocontainers/bcftools:1.18--h8b25389_0'

	input:
		path(vcfFile)
	output:
		path("${vcfFile}.csi"), emit: index
	script:
	"""
	bcftools index ${vcfFile}
	"""
}

process mergeImputedWindows {
	container 'quay.io/biocontainers/bcftools:1.18--h8b25389_0'
	publishDir params.outdir+'/imputed/', mode: 'copy'

	input:
		path(vcfFiles)
		path(vcfIndices)
	output:
		path("merged_imputed.vcf.gz")
	script:
	"""
	bcftools concat imputed*.vcf.gz -Oz -o merged_imputed.vcf.gz
	"""
}

workflow {
	indexVCF(params.vcf)
		| listVariants
	
	writeWindows(listVariants.out, params.windowSize, params.overlap)
		| splitText
		| map { it.trim()}
		| set { ch_windows}
	
	splitVCFByWindow(ch_windows, indexVCF.out.vcf, indexVCF.out.index)
		| imputeWindows
		| collect
		| set { ch_imputedWindows}
	
	indexImputedWindow(imputeWindows.out)
		| collect
		| set { ch_windowIndices}

	mergeImputedWindows(ch_imputedWindows, ch_windowIndices)
}
