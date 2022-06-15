SECONDS=0
for CHR in $(<chr_names.txt); do
	bcftools view $1 --regions ${CHR} -Oz -o $2.${CHR}.vcf.gz
done
duration=$SECONDS
echo "$(($duration/60)) minutes and $(($duration%60)) seconds elapsed"
