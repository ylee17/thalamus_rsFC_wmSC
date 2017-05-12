import os
import numpy as np
import nibabel as nb
import nilearn
import scipy
import sys

# for every C/F/N* subject in current directory
def fisherZ_corr(subjloc):
    for subject in [x for x in os.listdir(subjloc[1]) if x.startswith(('C','F','N'))]:
        img_directory = '{subject}/downsampled'.format(subject=subject)
        ds_rates = '5ds', '4ds', '3ds'
        for ds in ds_rates:
            # file location settings
            wb_img = os.path.join(subjloc[1], 
                                  img_directory, 
                                  '{ds}_filtered_func_data.nii.gz'.format(ds=ds))
            thal_img= os.path.join(subjloc[1], 
                                   img_directory, 
                                   '{ds}_B_thal_on_filtered_func_data.nii.gz'.format(ds=ds))
    
            # load raw images
            wb = nb.load(wb_img)
            thal = nb.load(thal_img)
        
            wbd = wb.get_data()
            thald = thal.get_data()
            print(wbd.shape)
            print(thald.shape)
        
            volume_shape = wbd.shape[:-1]
            coords = list(np.ndindex(volume_shape))
    
            thal_x, thal_y, thal_z = np.where(thald[:,:,:,0] != 0)
            thal_coords = np.array((thal_x, thal_y, thal_z)).T
    
            thald_nonzero = thald[np.where(thald[:,:,:,0] != 0)]
    
            wbd_reshape = wbd.reshape(len(coords), wbd.shape[3])
            thald_reshape = thald_nonzero.reshape(len(thal_coords), wbd.shape[3])
    
            m_wb_ts = wbd_reshape - wbd_reshape.mean(1)[:,None] 
            m_thal_ts = thald_nonzero - thald_nonzero.mean(1)[:,None]
    
            ss_wb_ts = (m_wb_ts**2).sum(1)
            ss_thal_ts = (m_thal_ts**2).sum(1)
    
            corrMap = np.dot(m_wb_ts,m_thal_ts.T)/np.sqrt(np.dot(ss_wb_ts[:,None],ss_thal_ts[None]))
    
            corrMap_reshape = corrMap.reshape(volume_shape[0], 
                                              volume_shape[1], 
                                              volume_shape[2], 
                                              len(thal_coords))        
    
            # write images
            img = nb.Nifti1Image(corrMap_reshape, affine=thal.affine)
            img.to_filename(os.path.join(subjloc[1],
                                         img_directory, 
                                         'not_fisherZ_{ds}.nii.gz').format(ds=ds))
        
        
            # fisher Z transformation
            # is this it??
            fisherZ = np.arctanh(corrMap)
            fisherZ_reshape = fisherZ.reshape(volume_shape[0], 
                                              volume_shape[1], 
                                              volume_shape[2], 
                                              len(thal_coords))
            # Save transformed image
            img = nb.Nifti1Image(fisherZ_reshape, affine=thal.affine)
            img.to_filename(os.path.join(subjloc[1],
                                         img_directory, 
                                         'fisherZ_{ds}.nii.gz').format(ds=ds))
    
       
if __name__ == '__main__':
    fisherZ_corr(sys.argv)


######################## check fisherZ_3ds.nii.gz results for nan


########## rendered (seems only CHR04 was problematic..?)
#(60, 72, 60, 114)
#(60, 72, 60, 114)
#fisherZ_vtwb_corr.py:40: RuntimeWarning: invalid value encountered in divide
#  corrMap = np.dot(m_wb_ts,m_thal_ts.T)/np.sqrt(np.dot(ss_wb_ts[:,None],ss_thal_ts[None]))
#fisherZ_vtwb_corr.py:48: RuntimeWarning: divide by zero encountered in arctanh
#    fisherZ = np.arctanh(corrMap)
#fisherZ_vtwb_corr.py:48: RuntimeWarning: invalid value encountered in arctanh
#    fisherZ = np.arctanh(corrMap)
#(60, 72, 60, 114)
#(60, 72, 60, 114)
#(60, 72, 60, 114)
#(60, 72, 60, 114)

##### ran CHR08 separately -> rendered same Warning as above
#(60, 72, 60, 114)
#(60, 72, 60, 114)
#forCHR08.py:40: RuntimeWarning: invalid value encountered in divide
#  corrMap = np.dot(m_wb_ts,m_thal_ts.T)/np.sqrt(np.dot(ss_wb_ts[:,None],ss_thal_ts[None]))
#forCHR08.py:48: RuntimeWarning: divide by zero encountered in arctanh
#    fisherZ = np.arctanh(corrMap)
#forCHR08.py:48: RuntimeWarning: invalid value encountered in arctanh
#    fisherZ = np.arctanh(corrMap)

