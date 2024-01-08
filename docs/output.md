# Output

## Workflow Output
The workflow will generate several output files, in the `results` directory:

- `imputed/`: This directory contains all imputation results
    - `windows/`: 
        - `imputed_${chr}:${windowStart}-${windowEnd}_${input}.vcf.gz`: imputed VCF file for each window
    - `merged_imputed.vcf.gz`: final imputed VCF output file
- `raw/`: This directory contains the input VCF as well as the index
    - `input.vcf.gz`: input VCF
    - `input.vcf.gz.csi`: index file for the input VCF
- `windows/`: This directory contains all split window VCFs 
    - `${chr}:${windowStart}-${windowEnd}_${input}.vcf.gz`: unimputed VCF file for each window
- `window.txt`: CSV listing all window ranges

## Citations

To cite this worfklow, please cite this publication:

Feser, Manuel, König, Patrick, Fiebig, Anne, Arend, Daniel, Lange, Matthias and Scholz, Uwe. "On the way to plant data commons – a genotyping use case" Journal of Integrative Bioinformatics, vol. 19, no. 4, 2022, pp. 20220033. https://doi.org/10.1515/jib-2022-0033

A list of publications of standards and tools used with this workflow can be found here: 

[1] B L Browning, Y Zhou, and S R Browning (2018). A one-penny imputed genome from next generation reference panels. Am J Hum Genet 103(3):338-348. doi:10.1016/j.ajhg.2018.07.015

[2] Li H. A statistical framework for SNP calling, mutation discovery, association mapping and population genetical parameter estimation from sequencing data. Bioinformatics. 2011 Nov 1;27(21):2987-93. doi: 10.1093/bioinformatics/btr509. Epub 2011 Sep 8. PMID: 21903627; PMCID: PMC3198575.

[3] Felipe da Veiga Leprevost, Björn A Grüning, Saulo Alves Aflitos, Hannes L Röst, Julian Uszkoreit, Harald Barsnes, Marc Vaudel, Pablo Moreno, Laurent Gatto, Jonas Weber, Mingze Bai, Rafael C Jimenez, Timo Sachsenberg, Julianus Pfeuffer, Roberto Vera Alvarez, Johannes Griss, Alexey I Nesvizhskii, Yasset Perez-Riverol, BioContainers: an open-source and community-driven framework for software standardization, Bioinformatics, Volume 33, Issue 16, August 2017, Pages 2580–2582, https://doi.org/10.1093/bioinformatics/btx192