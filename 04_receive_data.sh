ssh -i $3 ubuntu@$1 "cd /volumes/volume001; tar -cf imputed.tar imputed/"
scp -i $3 $1:/volumes/volume001/imputed.tar .
tar -xf imputed.tar
