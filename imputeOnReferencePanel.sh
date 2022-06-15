for CHR in $(<chr_names.txt); do
        echo ${CHR}
	java -Xmx11g -jar /tools/beagle.05May22.33a.jar gt=imputation_set.split/imputation_set.split.${CHR}.vcf.gz ref=phased_ref_panel.split/phased_quality_controlled_reference_panel_${CHR}.vcf.gz out=imputedOnReferencePanel/imputed_${CHR} &
done;

