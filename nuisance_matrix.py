#!usr/bin/python

import os
import numpy as np

#for every C/F/N* subject in current directory
for subject in os.listdir(os.getcwd()):
    if subject.startswith(('C','F','N')):
        matrices = 'CSF_noise.txt', 'WM_noise.txt', 'mn.txt'
        for matrix in matrices:
            # file location settings - 'noise' files under 'nuisance' folder
            if matrix.startswith(('C', 'W')):
                nuisance_path = '{subject}/nuisance'.format(subject=subject)
                pre = np.loadtxt('{subject}/nuisance/{matrix}'.format(subject=subject, matrix=matrix))
                # demean = remove the mean of each column of a matrix
                demean = pre - pre.mean()
                np.savetxt(os.path.join(nuisance_path, 'demeaned_{matrix}').format(matrix=matrix), demean)
                # create contrast matrix
                nuisance_contrast = np.asmatrix('1 0')
                np.savetxt(os.path.join(nuisance_path, 'contrast.txt'), nuisance_contrast)

            # file location settings - 'mn' file under 'motion' folder
            if matrix.startswith('m'):
                mn_path = '{subject}/motion'.format(subject=subject)
                mn = np.loadtxt('{subject}/motion/{matrix}'.format(subject=subject, matrix=matrix))
                # delete row 114,115 and demean
                mn_delete = np.delete(mn, (114,115), 0)
                mn_demean = mn_delete - mn_delete.mean()
                np.savetxt(os.path.join(mn_path, 'demeaned_{matrix}').format(matrix=matrix), mn_demean)
                # create contrast matrix
                mn_contrast = np.asmatrix('1')
                np.savetxt(os.path.join(mn_path, 'contrast.txt'), mn_contrast)


