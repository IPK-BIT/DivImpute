for CHR in $(<chr_names.txt); do
        echo ${CHR}
	java -Xmx11g -jar /tools/beagle.27Jan18.7e1.jar gt=target.split/target_split.${CHR}.vcf.gz out=imputed_target/imputed_target.${CHR} > /dev/null &
done;

