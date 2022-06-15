scp -i $3 $1:/volumes/volume001/result.log .
mv result.log result_$1.log
scp -i $3 $1:/volumes/volume001/result.err .
mv result.err result_$1.err
