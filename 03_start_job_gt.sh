ssh -i $2 ubuntu@$1 "cd /volumes/volume001; mkdir imputed; ./batch_impute.sh >result.log 2>result.err;"
