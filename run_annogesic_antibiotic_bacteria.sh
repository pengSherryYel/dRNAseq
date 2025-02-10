#!/usr/bin/bash

optdir="ANNOgesic_antibiotic_bacteria"
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic create --project_path $optdir
WIG_FOLDER="READemption_antibiotic_bacteria/output/acinetobacter_coverage-raw/"
##T0:1; T5:2; T15:3; T30:4
## A1,A2 are treat as replicate, same for others; PE treat as SE
TEX_LIBS="
$WIG_FOLDER/23L003033_S9_L001_R1_001_forward.wig:tex:1:a:+ \
$WIG_FOLDER/23L003033_S9_L001_R1_001_reverse.wig:tex:1:a:- \
$WIG_FOLDER/23L003033_S9_L001_R2_001_forward.wig:tex:1:b:+ \
$WIG_FOLDER/23L003033_S9_L001_R2_001_reverse.wig:tex:1:b:- \
$WIG_FOLDER/23L003034_S10_L001_R1_001_forward.wig:notex:1:a:+ \
$WIG_FOLDER/23L003034_S10_L001_R1_001_reverse.wig:notex:1:a:- \
$WIG_FOLDER/23L003034_S10_L001_R2_001_forward.wig:notex:1:b:+ \
$WIG_FOLDER/23L003034_S10_L001_R2_001_reverse.wig:notex:1:b:- \
$WIG_FOLDER/23L003035_S11_L001_R1_001_forward.wig:tex:2:a:+ \
$WIG_FOLDER/23L003035_S11_L001_R1_001_reverse.wig:tex:2:a:- \
$WIG_FOLDER/23L003035_S11_L001_R2_001_forward.wig:tex:2:b:+ \
$WIG_FOLDER/23L003035_S11_L001_R2_001_reverse.wig:tex:2:b:- \
$WIG_FOLDER/23L003036_S12_L001_R1_001_forward.wig:notex:2:a:+ \
$WIG_FOLDER/23L003036_S12_L001_R1_001_reverse.wig:notex:2:a:- \
$WIG_FOLDER/23L003036_S12_L001_R2_001_forward.wig:notex:2:b:+ \
$WIG_FOLDER/23L003036_S12_L001_R2_001_reverse.wig:notex:2:b:- \
$WIG_FOLDER/23L003037_S13_L001_R1_001_forward.wig:tex:1:c:+ \
$WIG_FOLDER/23L003037_S13_L001_R1_001_reverse.wig:tex:1:c:- \
$WIG_FOLDER/23L003037_S13_L001_R2_001_forward.wig:tex:1:d:+ \
$WIG_FOLDER/23L003037_S13_L001_R2_001_reverse.wig:tex:1:d:- \
$WIG_FOLDER/23L003038_S14_L001_R1_001_forward.wig:notex:1:c:+ \
$WIG_FOLDER/23L003038_S14_L001_R1_001_reverse.wig:notex:1:c:- \
$WIG_FOLDER/23L003038_S14_L001_R2_001_forward.wig:notex:1:d:+ \
$WIG_FOLDER/23L003038_S14_L001_R2_001_reverse.wig:notex:1:d:- \
$WIG_FOLDER/23L003039_S15_L001_R1_001_forward.wig:tex:2:c:+ \
$WIG_FOLDER/23L003039_S15_L001_R1_001_reverse.wig:tex:2:c:- \
$WIG_FOLDER/23L003039_S15_L001_R2_001_forward.wig:tex:2:d:+ \
$WIG_FOLDER/23L003039_S15_L001_R2_001_reverse.wig:tex:2:d:- \
$WIG_FOLDER/23L003040_S16_L001_R1_001_forward.wig:notex:2:c:+ \
$WIG_FOLDER/23L003040_S16_L001_R1_001_reverse.wig:notex:2:c:- \
$WIG_FOLDER/23L003040_S16_L001_R2_001_forward.wig:notex:2:d:+ \
$WIG_FOLDER/23L003040_S16_L001_R2_001_reverse.wig:notex:2:d:- \
$WIG_FOLDER/23L003041_S17_L001_R1_001_forward.wig:tex:1:e:+ \
$WIG_FOLDER/23L003041_S17_L001_R1_001_reverse.wig:tex:1:e:- \
$WIG_FOLDER/23L003041_S17_L001_R2_001_forward.wig:tex:1:f:+ \
$WIG_FOLDER/23L003041_S17_L001_R2_001_reverse.wig:tex:1:f:- \
$WIG_FOLDER/23L003042_S18_L001_R1_001_forward.wig:notex:1:e:+ \
$WIG_FOLDER/23L003042_S18_L001_R1_001_reverse.wig:notex:1:e:- \
$WIG_FOLDER/23L003042_S18_L001_R2_001_forward.wig:notex:1:f:+ \
$WIG_FOLDER/23L003042_S18_L001_R2_001_reverse.wig:notex:1:f:- \
$WIG_FOLDER/23L003043_S19_L001_R1_001_forward.wig:tex:2:e:+ \
$WIG_FOLDER/23L003043_S19_L001_R1_001_reverse.wig:tex:2:e:- \
$WIG_FOLDER/23L003043_S19_L001_R2_001_forward.wig:tex:2:f:+ \
$WIG_FOLDER/23L003043_S19_L001_R2_001_reverse.wig:tex:2:f:- \
$WIG_FOLDER/23L003044_S20_L001_R1_001_forward.wig:notex:2:e:+ \
$WIG_FOLDER/23L003044_S20_L001_R1_001_reverse.wig:notex:2:e:- \
$WIG_FOLDER/23L003044_S20_L001_R2_001_forward.wig:notex:2:f:+ \
$WIG_FOLDER/23L003044_S20_L001_R2_001_reverse.wig:notex:2:f:- \
$WIG_FOLDER/23L003045_S21_L001_R1_001_forward.wig:tex:3:a:+ \
$WIG_FOLDER/23L003045_S21_L001_R1_001_reverse.wig:tex:3:a:- \
$WIG_FOLDER/23L003045_S21_L001_R2_001_forward.wig:tex:3:b:+ \
$WIG_FOLDER/23L003045_S21_L001_R2_001_reverse.wig:tex:3:b:- \
$WIG_FOLDER/23L003046_S22_L001_R1_001_forward.wig:notex:3:a:+ \
$WIG_FOLDER/23L003046_S22_L001_R1_001_reverse.wig:notex:3:a:- \
$WIG_FOLDER/23L003046_S22_L001_R2_001_forward.wig:notex:3:b:+ \
$WIG_FOLDER/23L003046_S22_L001_R2_001_reverse.wig:notex:3:b:- \
$WIG_FOLDER/23L003047_S23_L001_R1_001_forward.wig:tex:4:a:+ \
$WIG_FOLDER/23L003047_S23_L001_R1_001_reverse.wig:tex:4:a:- \
$WIG_FOLDER/23L003047_S23_L001_R2_001_forward.wig:tex:4:b:+ \
$WIG_FOLDER/23L003047_S23_L001_R2_001_reverse.wig:tex:4:b:- \
$WIG_FOLDER/23L003048_S24_L001_R1_001_forward.wig:notex:4:a:+ \
$WIG_FOLDER/23L003048_S24_L001_R1_001_reverse.wig:notex:4:a:- \
$WIG_FOLDER/23L003048_S24_L001_R2_001_forward.wig:notex:4:b:+ \
$WIG_FOLDER/23L003048_S24_L001_R2_001_reverse.wig:notex:4:b:- \
$WIG_FOLDER/23L003049_S25_L001_R1_001_forward.wig:tex:3:c:+ \
$WIG_FOLDER/23L003049_S25_L001_R1_001_reverse.wig:tex:3:c:- \
$WIG_FOLDER/23L003049_S25_L001_R2_001_forward.wig:tex:3:d:+ \
$WIG_FOLDER/23L003049_S25_L001_R2_001_reverse.wig:tex:3:d:- \
$WIG_FOLDER/23L003050_S26_L001_R1_001_forward.wig:notex:3:c:+ \
$WIG_FOLDER/23L003050_S26_L001_R1_001_reverse.wig:notex:3:c:- \
$WIG_FOLDER/23L003050_S26_L001_R2_001_forward.wig:notex:3:d:+ \
$WIG_FOLDER/23L003050_S26_L001_R2_001_reverse.wig:notex:3:d:- \
$WIG_FOLDER/23L003051_S27_L001_R1_001_forward.wig:tex:4:c:+ \
$WIG_FOLDER/23L003051_S27_L001_R1_001_reverse.wig:tex:4:c:- \
$WIG_FOLDER/23L003051_S27_L001_R2_001_forward.wig:tex:4:d:+ \
$WIG_FOLDER/23L003051_S27_L001_R2_001_reverse.wig:tex:4:d:- \
$WIG_FOLDER/23L003052_S28_L001_R1_001_forward.wig:notex:4:c:+ \
$WIG_FOLDER/23L003052_S28_L001_R1_001_reverse.wig:notex:4:c:- \
$WIG_FOLDER/23L003052_S28_L001_R2_001_forward.wig:notex:4:d:+ \
$WIG_FOLDER/23L003052_S28_L001_R2_001_reverse.wig:notex:4:d:- \
$WIG_FOLDER/23L003053_S29_L001_R1_001_forward.wig:tex:3:e:+ \
$WIG_FOLDER/23L003053_S29_L001_R1_001_reverse.wig:tex:3:e:- \
$WIG_FOLDER/23L003053_S29_L001_R2_001_forward.wig:tex:3:f:+ \
$WIG_FOLDER/23L003053_S29_L001_R2_001_reverse.wig:tex:3:f:- \
$WIG_FOLDER/23L003054_S30_L001_R1_001_forward.wig:notex:3:e:+ \
$WIG_FOLDER/23L003054_S30_L001_R1_001_reverse.wig:notex:3:e:- \
$WIG_FOLDER/23L003054_S30_L001_R2_001_forward.wig:notex:3:f:+ \
$WIG_FOLDER/23L003054_S30_L001_R2_001_reverse.wig:notex:3:f:- \
$WIG_FOLDER/23L003055_S31_L001_R1_001_forward.wig:tex:4:e:+ \
$WIG_FOLDER/23L003055_S31_L001_R1_001_reverse.wig:tex:4:e:- \
$WIG_FOLDER/23L003055_S31_L001_R2_001_forward.wig:tex:4:f:+ \
$WIG_FOLDER/23L003055_S31_L001_R2_001_reverse.wig:tex:4:f:- \
$WIG_FOLDER/23L003056_S32_L001_R1_001_forward.wig:notex:4:e:+ \
$WIG_FOLDER/23L003056_S32_L001_R1_001_reverse.wig:notex:4:e:- \
$WIG_FOLDER/23L003056_S32_L001_R2_001_forward.wig:notex:4:f:+ \
$WIG_FOLDER/23L003056_S32_L001_R2_001_reverse.wig:notex:4:f:- \
"
fasta_file="$optdir/input/references/fasta_files/CP000521.1.fasta"
annotation_file="$optdir/input/references/annotations/CP000521.1.gff3"

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
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic tss_ps \
#    --fasta_files ANNOgesic_antibiotic_bacteria/input/references/fasta_files/CP000521.1.fasta \
#    --annotation_files ANNOgesic_antibiotic_bacteria/input/references/annotations/CP000521.1.gff3 \
#    --tex_notex_libs $TEX_LIBS \
#    --condition_names Rif HMGU1_Rif Tig HMGU1_Tig \
#    --validate_gene \
#    --program TSS \
#    --replicate_tex all_1 \
#    --project_path $optdir

tss_file="$optdir/output/TSSs/gffs/CP000521.1_TSS.gff"


## run transcript detection
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic transcript \
#    --annotation_files $annotation_file \
#    --tex_notex_libs $TEX_LIBS \
#    --replicate_tex all_1 \
#    --compare_feature_genome gene CDS \
#    --tss_files $tss_file \
#    --project_path $optdir

transcript_file="$optdir/output/transcripts/gffs/CP000521.1_transcript.gff"

## run terminator
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic terminator \
#    --fasta_files $fasta_file \
#    --annotation_files $annotation_file \
#    --transcript_files $transcript_file \
#    --tex_notex_libs $TEX_LIBS \
#    --replicate_tex all_1 \
#    --project_path $optdir

terminator_file="$optdir/output/terminators/gffs/best_candidates/CP000521.1_term.gff"

### run utr
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic utr \
#    --annotation_files $annotation_file \
#    --tss_files $tss_file \
#    --transcript_files $transcript_file \
#    --terminator_files $terminator_file\
#    --project_path $optdir
#
### run operon and suboperon
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic operon \
#    --annotation_files $annotation_file \
#    --tss_files $tss_file \
#    --transcript_files $transcript_file \
#    --terminator_files $terminator_file\
#    --project_path $optdir
#
### Promoter motif detection
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic promoter \
#    --tss_files $tss_file \
#    --fasta_files $fasta_file \
#    --motif_width 45 2-10 \
#    --project_path $optdir

promoter_file="$optdir/output/promoters/CP000521.1/MEME/promoter_motifs_CP000521.1_allgenome_all_types_45_nt/meme.csv"

## sRNA and sORF
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic srna \
#    --filter_info tss blast_srna sec_str blast_nr \
#    --annotation_files $annotation_file \
#    --tss_files $tss_file \
#    --transcript_files $transcript_file \
#    --fasta_files $fasta_file \
#    --terminator_files $terminator_file \
#    --promoter_tables $promoter_file \
#    --promoter_names MOTIF_1 \
#    --mountain_plot \
#    --utr_derived_srna \
#    --compute_sec_structures \
#    --nr_database_path ANNOgesic_databases/nr \
#    --srna_database_path ANNOgesic_databases/sRNA_database_BSRD \
#    --tex_notex_libs $TEX_LIBS \
#    --replicate_tex all_1 \
#    --project_path $optdir
#    #--nr_format \
#    #--srna_format \

srna_file="$optdir/output/sRNAs/gffs/best_candidates/CP000521.1_sRNA.gff"

singularity exec -B `pwd`:`pwd` annogesic.sif annogesic sorf \
    --annotation_files $annotation_file \
    --tss_files $tss_file \
    --transcript_files $transcript_file \
    --fasta_files $fasta_file \
    --srna_files $srna_file \
    --tex_notex_libs $TEX_LIBS \
    --replicate_tex all_1 -u \
    --project_path $optdir
