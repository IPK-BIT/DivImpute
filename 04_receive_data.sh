ssh -i $2 ubuntu@$1 "cd /volumes/volume001; tar -cf imputed.tar imputed/"
scp -i $2 $1:/volumes/volume001/imputed.tar .
tar -xf imputed.tar
