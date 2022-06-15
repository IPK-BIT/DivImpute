SECONDS=0
#Send File
scp -i $3 ./target.vcf.gz $1:/volumes/volume001
#Start imputation
ssh -i $3 ubuntu@$1 "cd /volumes/volume001; ./singleFileImpute.sh > singleFileImpute.log 2> singleFileImpute.err;";

duration=$SECONDS
echo "$(($duration/60)) minutes and $(($duration%60)) seconds elapsed"

