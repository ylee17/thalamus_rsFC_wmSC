# for every C/F/N* subject in current directory
for i in [CNF]*
do

# merge demeaned_CSF_noise and demeaned_WM_noise into a textfile with two columns
paste ${i}/nuisance/demeaned_CSF_noise.txt ${i}/nuisance/demeaned_WM_noise.txt > ${i}/nuisance/design.txt

# convert textfiles into the format used by FSL tools
Text2Vest ${i}/nuisance/design.txt ${i}/nuisance/design.mat

Text2Vest ${i}/nuisance/contrast.txt ${i}/nuisance/design.con


Text2Vest ${i}/motion/demeaned_mn.txt ${i}/motion/design.mat
Text2Vest ${i}/motion/contrast.txt ${i}/motion/design.con


done




