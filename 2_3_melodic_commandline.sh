melodic -i list_melodic.txt -o commandLine_3ds_10  -v --nobet --bgthreshold=10 --mmthresh=0.5 --tr=1 --report -d 10 --Ostats -a concat
melodic -i list_melodic.txt -o commandLine_3ds_20  -v --nobet --bgthreshold=10 --mmthresh=0.5 --tr=1 --report -d 20 --Ostats -a concat


melodic -i list_header_edit_melodic.txt -o commandLine_3ds_hdEdit_10  -v --nobet --bgthreshold=10 --mmthresh=0.5  --tr=3.50 --report -d 10 --Ostats -a concat
melodic -i list_header_edit_melodic.txt -o commandLine_3ds_hdEdit_20  -v --nobet --bgthreshold=10 --mmthresh=0.5  --tr=3.50 --report -d 20 --Ostats -a concat
