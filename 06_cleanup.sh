ssh -i $3 ubuntu@$1 "cd /volumes/volume001; sudo rm -rf imputed/; sudo rm imputed.tar; sudo rm -rf imputation_set.split/; sudo rm result.*"
rm imputed.tar
