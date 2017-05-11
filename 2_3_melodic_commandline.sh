# need comment on list_melodic.txt
for dLevel in 10 20
do
    melodic -i list_melodic.txt -o commandLine_3ds_${dLevel} -v --nobet --bgthreshold=10 --mmthresh=0.5 --tr=1 --report -d ${dLevel} --Ostats -a concat

    melodic -i list_header_edit_melodic.txt -o commandLine_3ds_hdEdit_${dLevel}  -v --nobet --bgthreshold=10 --mmthresh=0.5  --tr=3.50 --report -d ${dLevel} --Ostats -a concat
done
