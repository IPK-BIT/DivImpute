ssh -i $3 ubuntu@$1 "cd /volumes/volume001; mkdir imputedOnReferencePanel; ./imputeOnReferencePanel.sh >result.log 2>result.err;"
