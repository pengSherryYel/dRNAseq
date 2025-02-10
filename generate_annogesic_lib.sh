less antibiotic_cond_rep_finall_4annogetic.txt |cut -d " " -f 2,6,7,8,9|sed 's/^/\$WIG_FOLDER\//'|sed 's/ /:/g'|sed 's/$/ \\/'
echo -e "\n\n\n"
 less timepoint_cond_rep_finall_4annogetic.txt|cut -d " " -f 2,5,6,7,8|sed 's/^/\$WIG_FOLDER\//'|sed 's/ /:/g'|sed 's/$/ \\/'
