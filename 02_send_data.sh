for CHR in $(<$1); do
	i=$i' imputation_set.split/imputation_set.split.'${CHR}'.vcf.gz'
done
tar cf imputation_set_partition.tar $i
scp -i $3 imputation_set_partition.tar $2:~
scp -i $3 $1 $2:~
ssh -i $3 ubuntu@$2 "sudo mv imputation_set_partition.tar /volumes/volume001; sudo mv '$1' chr_names.txt; cd /volumes/volume001; sudo tar -xf imputation_set_partition.tar; sudo rm imputation_set_partition.tar"
