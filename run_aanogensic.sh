#!/usr/bin/bash
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic create --project_path ANNOgesic
WIG_FOLDER="ANNOgesic/input/wigs/tex_notex"
##T0:1; T5:2; T15:3; T30:4
## A1,A2 are treat as replicate, same for others; PE treat as SE
TEX_LIBS="ANNOgesic/input/wigs/tex_notex/Sample_22L004117.1_div_by_7120.0_multi_by_6230.0_forward.wig:notex:1:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004117.1_div_by_7120.0_multi_by_6230.0_reverse.wig:notex:1:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004117.2_div_by_21821.0_multi_by_6230.0_forward.wig:notex:1:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004117.2_div_by_21821.0_multi_by_6230.0_reverse.wig:notex:1:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004118.1_div_by_9617.0_multi_by_6230.0_forward.wig:tex:1:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004118.1_div_by_9617.0_multi_by_6230.0_reverse.wig:tex:1:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004118.2_div_by_22500.0_multi_by_6230.0_forward.wig:tex:1:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004118.2_div_by_22500.0_multi_by_6230.0_reverse.wig:tex:1:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004125.1_div_by_6230.0_multi_by_6230.0_forward.wig:notex:1:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004125.1_div_by_6230.0_multi_by_6230.0_reverse.wig:notex:1:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004125.2_div_by_18672.0_multi_by_6230.0_forward.wig:notex:1:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004125.2_div_by_18672.0_multi_by_6230.0_reverse.wig:notex:1:d:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004126.1_div_by_9590.0_multi_by_6230.0_forward.wig:tex:1:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004126.1_div_by_9590.0_multi_by_6230.0_reverse.wig:tex:1:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004126.2_div_by_10400.0_multi_by_6230.0_forward.wig:tex:1:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004126.2_div_by_10400.0_multi_by_6230.0_reverse.wig:tex:1:d:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004119.1_div_by_433425.0_multi_by_6230.0_forward.wig:notex:2:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004119.1_div_by_433425.0_multi_by_6230.0_reverse.wig:notex:2:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004119.2_div_by_456419.0_multi_by_6230.0_forward.wig:notex:2:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004119.2_div_by_456419.0_multi_by_6230.0_reverse.wig:notex:2:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004120.1_div_by_303246.0_multi_by_6230.0_forward.wig:tex:2:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004120.1_div_by_303246.0_multi_by_6230.0_reverse.wig:tex:2:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004120.2_div_by_307671.0_multi_by_6230.0_forward.wig:tex:2:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004120.2_div_by_307671.0_multi_by_6230.0_reverse.wig:tex:2:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004127.1_div_by_874456.0_multi_by_6230.0_forward.wig:notex:2:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004127.1_div_by_874456.0_multi_by_6230.0_reverse.wig:notex:2:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004127.2_div_by_894440.0_multi_by_6230.0_forward.wig:notex:2:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004127.2_div_by_894440.0_multi_by_6230.0_reverse.wig:notex:2:d:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004128.1_div_by_861593.0_multi_by_6230.0_forward.wig:tex:2:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004128.1_div_by_861593.0_multi_by_6230.0_reverse.wig:tex:2:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004128.2_div_by_877452.0_multi_by_6230.0_forward.wig:tex:2:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004128.2_div_by_877452.0_multi_by_6230.0_reverse.wig:tex:2:d:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004121.1_div_by_557774.0_multi_by_6230.0_forward.wig:notex:3:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004121.1_div_by_557774.0_multi_by_6230.0_reverse.wig:notex:3:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004121.2_div_by_570659.0_multi_by_6230.0_forward.wig:notex:3:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004121.2_div_by_570659.0_multi_by_6230.0_reverse.wig:notex:3:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004122.1_div_by_660151.0_multi_by_6230.0_forward.wig:tex:3:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004122.1_div_by_660151.0_multi_by_6230.0_reverse.wig:tex:3:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004122.2_div_by_672760.0_multi_by_6230.0_forward.wig:tex:3:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004122.2_div_by_672760.0_multi_by_6230.0_reverse.wig:tex:3:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004129.1_div_by_727301.0_multi_by_6230.0_forward.wig:notex:3:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004129.1_div_by_727301.0_multi_by_6230.0_reverse.wig:notex:3:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004129.2_div_by_736239.0_multi_by_6230.0_forward.wig:notex:3:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004129.2_div_by_736239.0_multi_by_6230.0_reverse.wig:notex:3:d:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004130.1_div_by_845213.0_multi_by_6230.0_forward.wig:tex:3:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004130.1_div_by_845213.0_multi_by_6230.0_reverse.wig:tex:3:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004130.2_div_by_857171.0_multi_by_6230.0_forward.wig:tex:3:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004130.2_div_by_857171.0_multi_by_6230.0_reverse.wig:tex:3:d:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004123.1_div_by_767860.0_multi_by_6230.0_forward.wig:notex:4:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004123.1_div_by_767860.0_multi_by_6230.0_reverse.wig:notex:4:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004123.2_div_by_789411.0_multi_by_6230.0_forward.wig:notex:4:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004123.2_div_by_789411.0_multi_by_6230.0_reverse.wig:notex:4:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004124.1_div_by_901525.0_multi_by_6230.0_forward.wig:tex:4:a:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004124.1_div_by_901525.0_multi_by_6230.0_reverse.wig:tex:4:a:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004124.2_div_by_925295.0_multi_by_6230.0_forward.wig:tex:4:b:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004124.2_div_by_925295.0_multi_by_6230.0_reverse.wig:tex:4:b:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004131.1_div_by_973351.0_multi_by_6230.0_forward.wig:notex:4:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004131.1_div_by_973351.0_multi_by_6230.0_reverse.wig:notex:4:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004131.2_div_by_980690.0_multi_by_6230.0_forward.wig:notex:4:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004131.2_div_by_980690.0_multi_by_6230.0_reverse.wig:notex:4:d:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004132.1_div_by_972972.0_multi_by_6230.0_forward.wig:tex:4:c:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004132.1_div_by_972972.0_multi_by_6230.0_reverse.wig:tex:4:c:- \
ANNOgesic/input/wigs/tex_notex/Sample_22L004132.2_div_by_976666.0_multi_by_6230.0_forward.wig:tex:4:d:+ \
ANNOgesic/input/wigs/tex_notex/Sample_22L004132.2_div_by_976666.0_multi_by_6230.0_reverse.wig:tex:4:d:- \
"

#TEX_LIBS="ANNOgesic/input/wigs/tex_notex/Sample_22L004132.1_div_by_972972.0_multi_by_6230.0_forward.wig:notex:1:a:+ \
#        ANNOgesic/input/wigs/tex_notex/Sample_22L004132.1_div_by_972972.0_multi_by_6230.0_reverse.wig:notex:1:a:- \
#        ANNOgesic/input/wigs/tex_notex/Sample_22L004132.2_div_by_976666.0_multi_by_6230.0_forward.wig:tex:1:a:+ \
#        ANNOgesic/input/wigs/tex_notex/Sample_22L004132.2_div_by_976666.0_multi_by_6230.0_reverse.wig:tex:1:a:-"


##run optimal need manual checked tss
#annogesic optimize_tss_ps \
#    --fasta_files ANNOgesic/input/references/fasta_files/vB_AB_HMGU1.fa \
#    --annotation_files ANNOgesic/input/references/annotations/vB_AB_HMGU1.gff \
#    --tex_notex_libs $TEX_LIBS \
#    --condition_names TSS --steps 25 \
#    --manual_files ANNOgesic/input/manual_TSSs/NC_009839_manual_TSS.gff \
#    --curated_sequence_length vB_AB_HMGU1: \
#    --replicate_tex all_1 \
#    --project_path ANNOgesic

## run tss
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic tss_ps \
    --fasta_files ANNOgesic/input/references/fasta_files/vB_AB_HMGU1.fa \
    --annotation_files ANNOgesic/input/references/annotations/vB_AB_HMGU1.gff \
    --tex_notex_libs $TEX_LIBS \
    --condition_names T0 T5 T15 T30 \
    --validate_gene \
    --program TSS \
    --replicate_tex all_1 \
    --project_path ANNOgesic

## run trans
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic transcript \
    --annotation_files ANNOgesic/input/references/annotations/vB_AB_HMGU1.gff \
    --tex_notex_libs $TEX_LIBS \
    --replicate_tex all_1 \
    --compare_feature_genome gene CDS \
    --tss_files ANNOgesic/output/TSSs/gffs/vB_AB_HMGU1_TSS.gff \
    --project_path ANNOgesic
