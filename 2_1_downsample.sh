for i in C*
do

fslmaths  ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -mas masks/atlasHO_bilateral_thalamus.nii.gz ${i}/feat_postSmoothing/B_thal_on_filtered_func_data.nii.gz

	mkdir ${i}/downsampled


	flirt -in ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -out ${i}/downsampled/3ds_filtered_func_data.nii.gz -applyisoxfm 3 -interp nearestneighbour -omat ${i}/downsampled/filtered_funct_TO_3mm.mat
	flirt -in ${i}/feat_postSmoothing/B_thal_on_filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/B_thal_on_filtered_func_data.nii.gz -out ${i}/downsampled/3ds_B_thal_on_filtered_func_data.nii.gz -applyisoxfm 3 -interp nearestneighbour -omat ${i}/downsampled/B_thal_on_filtered_func_TO_3mm.mat

    convert_xfm -omat ${i}/downsampled/3mm_TO_filtered_func.mat -inverse ${i}/downsampled/filtered_funct_TO_3mm.mat
    convert_xfm -omat ${i}/downsampled/3mmB_thal_TO_B_thal_on_filtered_func.mat -inverse ${i}/downsampled/B_thal_on_filtered_func_TO_3mm.mat

    flirt -in ${i}/downsampled/3ds_filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -applyxfm -init ${i}/downsampled/3mm_TO_filtered_func.mat -out ${i}/downsampled/3ds_backTo_filtered_func.nii.gz 




	flirt -in ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -out ${i}/downsampled/4ds_filtered_func_data.nii.gz -applyisoxfm 4 -interp nearestneighbour -omat ${i}/downsampled/filtered_funct_TO_4mm.mat
	flirt -in ${i}/feat_postSmoothing/B_thal_on_filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/B_thal_on_filtered_func_data.nii.gz -out ${i}/downsampled/4ds_B_thal_on_filtered_func_data.nii.gz -applyisoxfm 4 -interp nearestneighbour -omat ${i}/downsampled/B_thal_on_filtered_func_TO_4mm.mat

    convert_xfm -omat ${i}/downsampled/4mm_TO_filtered_func.mat -inverse ${i}/downsampled/filtered_funct_TO_4mm.mat
    convert_xfm -omat ${i}/downsampled/4mmB_thal_TO_B_thal_on_filtered_func.mat -inverse ${i}/downsampled/B_thal_on_filtered_func_TO_4mm.mat

    flirt -in ${i}/downsampled/4ds_filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -applyxfm -init ${i}/downsampled/4mm_TO_filtered_func.mat -out ${i}/downsampled/4ds_backTo_filtered_func.nii.gz 




	flirt -in ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -out ${i}/downsampled/5ds_filtered_func_data.nii.gz -applyisoxfm 5 -interp nearestneighbour -omat ${i}/downsampled/filtered_funct_TO_5mm.mat
	flirt -in ${i}/feat_postSmoothing/B_thal_on_filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/B_thal_on_filtered_func_data.nii.gz -out ${i}/downsampled/5ds_B_thal_on_filtered_func_data.nii.gz -applyisoxfm 5 -interp nearestneighbour -omat ${i}/downsampled/B_thal_on_filtered_func_TO_5mm.mat

    convert_xfm -omat ${i}/downsampled/5mm_TO_filtered_func.mat -inverse ${i}/downsampled/filtered_funct_TO_5mm.mat
    convert_xfm -omat ${i}/downsampled/5mmB_thal_TO_B_thal_on_filtered_func.mat -inverse ${i}/downsampled/B_thal_on_filtered_func_TO_5mm.mat

    flirt -in ${i}/downsampled/5ds_filtered_func_data.nii.gz -ref ${i}/feat_postSmoothing/regfilt_motion_regressed_CSF_WM_regressed.feat/filtered_func_data.nii.gz -applyxfm -init ${i}/downsampled/5mm_TO_filtered_func.mat -out ${i}/downsampled/5ds_backTo_filtered_func.nii.gz 

done




