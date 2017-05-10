flirt -in masks/atlasHO_bilateral_thalamus.nii.gz -ref masks/atlasHO_bilateral_thalamus.nii.gz -out masks/3ds_atlasHO_bilateral_thalamus.nii.gz -applyisoxfm 3 -interp nearestneighbour

flirt -in masks/atlasHO_bilateral_thalamus.nii.gz -ref masks/atlasHO_bilateral_thalamus.nii.gz -out masks/4ds_atlasHO_bilateral_thalamus.nii.gz -applyisoxfm 4 -interp nearestneighbour

flirt -in masks/atlasHO_bilateral_thalamus.nii.gz -ref masks/atlasHO_bilateral_thalamus.nii.gz -out masks/5ds_atlasHO_bilateral_thalamus.nii.gz -applyisoxfm 5 -interp nearestneighbour





for i in [CFN]*
do

	fslmeants -i ${i}/downsampled/3ds_filtered_func_data.nii.gz -m masks/3ds_atlasHO_bilateral_thalamus.nii.gz --showall >> ${i}/timeSeries/3ds_B_thalamus_masked_showall.txt
	fslmeants -i ${i}/downsampled/3ds_filtered_func_data.nii.gz --showall >> ${i}/timeSeries/3ds_filtered_func_showall.txt

	fslmeants -i ${i}/downsampled/4ds_filtered_func_data.nii.gz -m masks/4ds_atlasHO_bilateral_thalamus.nii.gz --showall >> ${i}/timeSeries/4ds_B_thalamus_masked_showall.txt
	fslmeants -i ${i}/downsampled/4ds_filtered_func_data.nii.gz --showall >> ${i}/timeSeries/4ds_filtered_func_showall.txt

	fslmeants -i ${i}/downsampled/5ds_filtered_func_data.nii.gz -m masks/5ds_atlasHO_bilateral_thalamus.nii.gz --showall >> ${i}/timeSeries/5ds_B_thalamus_masked_showall.txt
	fslmeants -i ${i}/downsampled/5ds_filtered_func_data.nii.gz --showall >> ${i}/timeSeries/5ds_filtered_func_showall.txt

done
