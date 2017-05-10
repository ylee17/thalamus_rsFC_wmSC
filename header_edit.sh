for i in [CFN]*
do

#    cp -r ${i}/downsampled/fisherZ_3ds.nii.gz ${i}/downsampled/hdEdit_fisherZ_3ds.nii.gz
#    fslhd -x ${i}/downsampled/hdEdit_fisherZ_3ds.nii.gz > ${i}/downsampled/hdEdit_fisherZ_3ds.txt
##### edit dt 1 -> 3.50
    fslcreatehd ${i}/downsampled/hdEdit_fisherZ_3ds.txt ${i}/downsampled/hdEdit_fisherZ_3ds.nii.gz

done
    
