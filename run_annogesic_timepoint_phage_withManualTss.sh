#!/usr/bin/bash

optdir="ANNOgesic_timepoint_phage_withManualTss"
#singularity exec -B `pwd`:`pwd` annogesic.sif annogesic create --project_path $optdir
WIG_FOLDER="$optdir/input/wigs/tex_notex"
##T0:1; T5:2; T15:3; T30:4
## A1,A2 are treat as replicate, same for others; PE treat as SE
TEX_LIBS="
$WIG_FOLDER/23L003025_S1_L001_R1_001_forward.wig:tex:1:a:+ \
$WIG_FOLDER/23L003025_S1_L001_R1_001_reverse.wig:tex:1:a:- \
$WIG_FOLDER/23L003025_S1_L001_R2_001_forward.wig:tex:1:b:+ \
$WIG_FOLDER/23L003025_S1_L001_R2_001_reverse.wig:tex:1:b:- \
$WIG_FOLDER/23L003026_S2_L001_R1_001_forward.wig:notex:1:a:+ \
$WIG_FOLDER/23L003026_S2_L001_R1_001_reverse.wig:notex:1:a:- \
$WIG_FOLDER/23L003026_S2_L001_R2_001_forward.wig:notex:1:b:+ \
$WIG_FOLDER/23L003026_S2_L001_R2_001_reverse.wig:notex:1:b:- \
$WIG_FOLDER/23L003027_S3_L001_R1_001_forward.wig:tex:2:a:+ \
$WIG_FOLDER/23L003027_S3_L001_R1_001_reverse.wig:tex:2:a:- \
$WIG_FOLDER/23L003027_S3_L001_R2_001_forward.wig:tex:2:b:+ \
$WIG_FOLDER/23L003027_S3_L001_R2_001_reverse.wig:tex:2:b:- \
$WIG_FOLDER/23L003028_S4_L001_R1_001_forward.wig:notex:2:a:+ \
$WIG_FOLDER/23L003028_S4_L001_R1_001_reverse.wig:notex:2:a:- \
$WIG_FOLDER/23L003028_S4_L001_R2_001_forward.wig:notex:2:b:+ \
$WIG_FOLDER/23L003028_S4_L001_R2_001_reverse.wig:notex:2:b:- \
$WIG_FOLDER/23L003029_S5_L001_R1_001_forward.wig:tex:3:a:+ \
$WIG_FOLDER/23L003029_S5_L001_R1_001_reverse.wig:tex:3:a:- \
$WIG_FOLDER/23L003029_S5_L001_R2_001_forward.wig:tex:3:b:+ \
$WIG_FOLDER/23L003029_S5_L001_R2_001_reverse.wig:tex:3:b:- \
$WIG_FOLDER/23L003030_S6_L001_R1_001_forward.wig:notex:3:a:+ \
$WIG_FOLDER/23L003030_S6_L001_R1_001_reverse.wig:notex:3:a:- \
$WIG_FOLDER/23L003030_S6_L001_R2_001_forward.wig:notex:3:b:+ \
$WIG_FOLDER/23L003030_S6_L001_R2_001_reverse.wig:notex:3:b:- \
$WIG_FOLDER/23L003031_S7_L001_R1_001_forward.wig:tex:4:a:+ \
$WIG_FOLDER/23L003031_S7_L001_R1_001_reverse.wig:tex:4:a:- \
$WIG_FOLDER/23L003031_S7_L001_R2_001_forward.wig:tex:4:b:+ \
$WIG_FOLDER/23L003031_S7_L001_R2_001_reverse.wig:tex:4:b:- \
$WIG_FOLDER/23L003032_S8_L001_R1_001_forward.wig:notex:4:a:+ \
$WIG_FOLDER/23L003032_S8_L001_R1_001_reverse.wig:notex:4:a:- \
$WIG_FOLDER/23L003032_S8_L001_R2_001_forward.wig:notex:4:b:+ \
$WIG_FOLDER/23L003032_S8_L001_R2_001_reverse.wig:notex:4:b:- \
$WIG_FOLDER/Sample_22L004117.1_forward.wig:notex:1:c:+ \
$WIG_FOLDER/Sample_22L004117.1_reverse.wig:notex:1:c:- \
$WIG_FOLDER/Sample_22L004117.2_forward.wig:notex:1:d:+ \
$WIG_FOLDER/Sample_22L004117.2_reverse.wig:notex:1:d:- \
$WIG_FOLDER/Sample_22L004118.1_forward.wig:tex:1:c:+ \
$WIG_FOLDER/Sample_22L004118.1_reverse.wig:tex:1:c:- \
$WIG_FOLDER/Sample_22L004118.2_forward.wig:tex:1:d:+ \
$WIG_FOLDER/Sample_22L004118.2_reverse.wig:tex:1:d:- \
$WIG_FOLDER/Sample_22L004119.1_forward.wig:notex:2:c:+ \
$WIG_FOLDER/Sample_22L004119.1_reverse.wig:notex:2:c:- \
$WIG_FOLDER/Sample_22L004119.2_forward.wig:notex:2:d:+ \
$WIG_FOLDER/Sample_22L004119.2_reverse.wig:notex:2:d:- \
$WIG_FOLDER/Sample_22L004120.1_forward.wig:tex:2:c:+ \
$WIG_FOLDER/Sample_22L004120.1_reverse.wig:tex:2:c:- \
$WIG_FOLDER/Sample_22L004120.2_forward.wig:tex:2:d:+ \
$WIG_FOLDER/Sample_22L004120.2_reverse.wig:tex:2:d:- \
$WIG_FOLDER/Sample_22L004121.1_forward.wig:notex:3:c:+ \
$WIG_FOLDER/Sample_22L004121.1_reverse.wig:notex:3:c:- \
$WIG_FOLDER/Sample_22L004121.2_forward.wig:notex:3:d:+ \
$WIG_FOLDER/Sample_22L004121.2_reverse.wig:notex:3:d:- \
$WIG_FOLDER/Sample_22L004122.1_forward.wig:tex:3:c:+ \
$WIG_FOLDER/Sample_22L004122.1_reverse.wig:tex:3:c:- \
$WIG_FOLDER/Sample_22L004122.2_forward.wig:tex:3:d:+ \
$WIG_FOLDER/Sample_22L004122.2_reverse.wig:tex:3:d:- \
$WIG_FOLDER/Sample_22L004123.1_forward.wig:notex:4:c:+ \
$WIG_FOLDER/Sample_22L004123.1_reverse.wig:notex:4:c:- \
$WIG_FOLDER/Sample_22L004123.2_forward.wig:notex:4:d:+ \
$WIG_FOLDER/Sample_22L004123.2_reverse.wig:notex:4:d:- \
$WIG_FOLDER/Sample_22L004124.1_forward.wig:tex:4:c:+ \
$WIG_FOLDER/Sample_22L004124.1_reverse.wig:tex:4:c:- \
$WIG_FOLDER/Sample_22L004124.2_forward.wig:tex:4:d:+ \
$WIG_FOLDER/Sample_22L004124.2_reverse.wig:tex:4:d:- \
$WIG_FOLDER/Sample_22L004125.1_forward.wig:notex:1:e:+ \
$WIG_FOLDER/Sample_22L004125.1_reverse.wig:notex:1:e:- \
$WIG_FOLDER/Sample_22L004125.2_forward.wig:notex:1:f:+ \
$WIG_FOLDER/Sample_22L004125.2_reverse.wig:notex:1:f:- \
$WIG_FOLDER/Sample_22L004126.1_forward.wig:tex:1:e:+ \
$WIG_FOLDER/Sample_22L004126.1_reverse.wig:tex:1:e:- \
$WIG_FOLDER/Sample_22L004126.2_forward.wig:tex:1:f:+ \
$WIG_FOLDER/Sample_22L004126.2_reverse.wig:tex:1:f:- \
$WIG_FOLDER/Sample_22L004127.1_forward.wig:notex:2:e:+ \
$WIG_FOLDER/Sample_22L004127.1_reverse.wig:notex:2:e:- \
$WIG_FOLDER/Sample_22L004127.2_forward.wig:notex:2:f:+ \
$WIG_FOLDER/Sample_22L004127.2_reverse.wig:notex:2:f:- \
$WIG_FOLDER/Sample_22L004128.1_forward.wig:tex:2:e:+ \
$WIG_FOLDER/Sample_22L004128.1_reverse.wig:tex:2:e:- \
$WIG_FOLDER/Sample_22L004128.2_forward.wig:tex:2:f:+ \
$WIG_FOLDER/Sample_22L004128.2_reverse.wig:tex:2:f:- \
$WIG_FOLDER/Sample_22L004129.1_forward.wig:notex:3:e:+ \
$WIG_FOLDER/Sample_22L004129.1_reverse.wig:notex:3:e:- \
$WIG_FOLDER/Sample_22L004129.2_forward.wig:notex:3:f:+ \
$WIG_FOLDER/Sample_22L004129.2_reverse.wig:notex:3:f:- \
$WIG_FOLDER/Sample_22L004130.1_forward.wig:tex:3:e:+ \
$WIG_FOLDER/Sample_22L004130.1_reverse.wig:tex:3:e:- \
$WIG_FOLDER/Sample_22L004130.2_forward.wig:tex:3:f:+ \
$WIG_FOLDER/Sample_22L004130.2_reverse.wig:tex:3:f:- \
$WIG_FOLDER/Sample_22L004131.1_forward.wig:notex:4:e:+ \
$WIG_FOLDER/Sample_22L004131.1_reverse.wig:notex:4:e:- \
$WIG_FOLDER/Sample_22L004131.2_forward.wig:notex:4:f:+ \
$WIG_FOLDER/Sample_22L004131.2_reverse.wig:notex:4:f:- \
$WIG_FOLDER/Sample_22L004132.1_forward.wig:tex:4:e:+ \
$WIG_FOLDER/Sample_22L004132.1_reverse.wig:tex:4:e:- \
$WIG_FOLDER/Sample_22L004132.2_forward.wig:tex:4:f:+ \
$WIG_FOLDER/Sample_22L004132.2_reverse.wig:tex:4:f:- \
"
#TEX_LIBS="ANNOgesic/input/wigs/tex_notex/Sample_22L004132.1_div_by_972972.0_multi_by_6230.0_forward.wig:notex:1:a:+ \
#        ANNOgesic/input/wigs/tex_notex/Sample_22L004132.1_div_by_972972.0_multi_by_6230.0_reverse.wig:notex:1:a:- \
#        ANNOgesic/input/wigs/tex_notex/Sample_22L004132.2_div_by_976666.0_multi_by_6230.0_forward.wig:tex:1:a:+ \
#        ANNOgesic/input/wigs/tex_notex/Sample_22L004132.2_div_by_976666.0_multi_by_6230.0_reverse.wig:tex:1:a:-"


##run optimal need manual checked tss
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic optimize_tss_ps \
    --fasta_files $optdir/input/references/fasta_files/vB_AB_HMGU1.fa \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --tex_notex_libs $TEX_LIBS \
    --condition_names T0 T5 T15 T30 --steps 25 \
    --manual_files $optdir/input/manual_TSSs/vB_AB_HMGU1_manual_TSS.gff \
    --replicate_tex all_1 \
    --project_path $optdir

## run tss
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic tss_ps \
    --fasta_files $optdir/input/references/fasta_files/vB_AB_HMGU1.fa \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --tex_notex_libs $TEX_LIBS \
    --auto_load_optimized_parameters $optdir/output/TSSs/optimized_TSSpredator \
    --manual_files $optdir/input/manual_TSSs/vB_AB_HMGU1_manual_TSS.gff \
    --condition_names T0 T5 T15 T30\
    --program TSS \
    --validate_gene \
    --replicate_tex all_1 \
    --project_path $optdir


## run transcript detection
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic transcript \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --tex_notex_libs $TEX_LIBS \
    --replicate_tex all_1 \
    --compare_feature_genome gene CDS \
    --tss_files $optdir/output/TSSs/gffs/vB_AB_HMGU1_TSS.gff \
    --project_path $optdir

## run terminator
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic terminator \
    --fasta_files $optdir/input/references/fasta_files/vB_AB_HMGU1.fa \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --transcript_files $optdir/output/transcripts/gffs/vB_AB_HMGU1_transcript.gff \
    --tex_notex_libs $TEX_LIBS \
    --replicate_tex all_1 \
    --project_path $optdir

## run utr
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic utr \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --tss_files $optdir/output/TSSs/gffs/vB_AB_HMGU1_TSS.gff \
    --transcript_files $optdir/output/transcripts/gffs/vB_AB_HMGU1_transcript.gff \
    --terminator_files $optdir/output/terminators/gffs/best_candidates/vB_AB_HMGU1_term.gff \
    --project_path $optdir

## run operon and suboperon
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic operon \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --tss_files $optdir/output/TSSs/gffs/vB_AB_HMGU1_TSS.gff \
    --transcript_files $optdir/output/transcripts/gffs/vB_AB_HMGU1_transcript.gff \
    --terminator_files $optdir/output/terminators/gffs/best_candidates/vB_AB_HMGU1_term.gff \
    --project_path $optdir

## Promoter motif detection
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic promoter \
    --tss_files $optdir/output/TSSs/gffs/vB_AB_HMGU1_TSS.gff \
    --fasta_files $optdir/input/references/fasta_files/vB_AB_HMGU1.fa \
    --motif_width 45 2-10 \
    --project_path $optdir

## sRNA and sORF
singularity exec -B `pwd`:`pwd` annogesic.sif annogesic srna \
    --filter_info tss blast_srna sec_str blast_nr \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --tss_files $optdir/output/TSSs/gffs/vB_AB_HMGU1_TSS.gff \
    --transcript_files $optdir/output/transcripts/gffs/vB_AB_HMGU1_transcript.gff \
    --fasta_files ANNOgesic_antibiotic_phage/input/references/fasta_files/vB_AB_HMGU1.fa \
    --terminator_files $optdir/output/terminators/gffs/best_candidates/vB_AB_HMGU1_term.gff \
    --promoter_tables $optdir/output/promoters/vB_AB_HMGU1/MEME/promoter_motifs_vB_AB_HMGU1_allgenome_all_types_45_nt/meme.csv \
    --promoter_names MOTIF_1 \
    --mountain_plot \
    --utr_derived_srna \
    --compute_sec_structures \
    --nr_database_path ANNOgesic_databases/nr \
    --srna_database_path ANNOgesic_databases/sRNA_database_BSRD \
    --tex_notex_libs $TEX_LIBS \
    --replicate_tex all_1 \
    --project_path $optdir
    #--nr_format \
    #--srna_format \

singularity exec -B `pwd`:`pwd` annogesic.sif annogesic sorf \
    --annotation_files $optdir/input/references/annotations/vB_AB_HMGU1.gff \
    --tss_files $optdir/output/TSSs/gffs/vB_AB_HMGU1_TSS.gff \
    --transcript_files $optdir/output/transcripts/gffs/vB_AB_HMGU1_transcript.gff \
    --fasta_files $optdir/input/references/fasta_files/vB_AB_HMGU1.fa \
    --srna_files $optdir/output/sRNAs/gffs/best_candidates/vB_AB_HMGU1_sRNA.gff \
    --tex_notex_libs $TEX_LIBS \
    --replicate_tex all_1 -u \
    --project_path $optdir
