#!/usr/bin/bash
. /home/viro/xue.peng/software_home/miniconda3/etc/profile.d/conda.sh
conda activate reademption
optdir="READemption_timepoint_bacteria"
#reademption create --project_path $optdir --species acinetobacter="Acinetobacter Baumannii"
#reademption align -p 10 --poly_a_clipping -l 12 -q -g --project_path $optdir
#reademption coverage -p 10 --project_path $optdir
#reademption gene_quanti -p 10 --features CDS,tRNA,rRNA --project_path $optdir
reademption deseq \
-l 23L003025_S1_L001_R1_001.fastq.gz,23L003025_S1_L001_R2_001.fastq.gz,23L003026_S2_L001_R1_001.fastq.gz,23L003026_S2_L001_R2_001.fastq.gz,23L003027_S3_L001_R1_001.fastq.gz,23L003027_S3_L001_R2_001.fastq.gz,23L003028_S4_L001_R1_001.fastq.gz,23L003028_S4_L001_R2_001.fastq.gz,23L003029_S5_L001_R1_001.fastq.gz,23L003029_S5_L001_R2_001.fastq.gz,23L003030_S6_L001_R1_001.fastq.gz,23L003030_S6_L001_R2_001.fastq.gz,23L003031_S7_L001_R1_001.fastq.gz,23L003031_S7_L001_R2_001.fastq.gz,23L003032_S8_L001_R1_001.fastq.gz,23L003032_S8_L001_R2_001.fastq.gz,Sample_22L004117.1.fastq.gz,Sample_22L004117.2.fastq.gz,Sample_22L004118.1.fastq.gz,Sample_22L004118.2.fastq.gz,Sample_22L004119.1.fastq.gz,Sample_22L004119.2.fastq.gz,Sample_22L004120.1.fastq.gz,Sample_22L004120.2.fastq.gz,Sample_22L004121.1.fastq.gz,Sample_22L004121.2.fastq.gz,Sample_22L004122.1.fastq.gz,Sample_22L004122.2.fastq.gz,Sample_22L004123.1.fastq.gz,Sample_22L004123.2.fastq.gz,Sample_22L004124.1.fastq.gz,Sample_22L004124.2.fastq.gz,Sample_22L004125.1.fastq.gz,Sample_22L004125.2.fastq.gz,Sample_22L004126.1.fastq.gz,Sample_22L004126.2.fastq.gz,Sample_22L004127.1.fastq.gz,Sample_22L004127.2.fastq.gz,Sample_22L004128.1.fastq.gz,Sample_22L004128.2.fastq.gz,Sample_22L004129.1.fastq.gz,Sample_22L004129.2.fastq.gz,Sample_22L004130.1.fastq.gz,Sample_22L004130.2.fastq.gz,Sample_22L004131.1.fastq.gz,Sample_22L004131.2.fastq.gz,Sample_22L004132.1.fastq.gz,Sample_22L004132.2.fastq.gz \
-c T0_plus,T0_plus,T0_minus,T0_minus,T5_plus,T5_plus,T5_minus,T5_minus,T15_plus,T15_plus,T15_minus,T15_minus,T30_plus,T30_plus,T30_minus,T30_minus,T0_minus,T0_minus,T0_plus,T0_plus,T5_minus,T5_minus,T5_plus,T5_plus,T15_minus,T15_minus,T15_plus,T15_plus,T30_minus,T30_minus,T30_plus,T30_plus,T0_minus,T0_minus,T0_plus,T0_plus,T5_minus,T5_minus,T5_plus,T5_plus,T15_minus,T15_minus,T15_plus,T15_plus,T30_minus,T30_minus,T30_plus,T30_plus \
-r 1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,4,3,4,3,4,3,4,3,4,3,4,3,4,3,4,5,6,5,6,5,6,5,6,5,6,5,6,5,6,5,6 \
--libs_by_species acinetobacter=23L003025_S1_L001_R1_001,23L003025_S1_L001_R2_001,23L003026_S2_L001_R1_001,23L003026_S2_L001_R2_001,23L003027_S3_L001_R1_001,23L003027_S3_L001_R2_001,23L003028_S4_L001_R1_001,23L003028_S4_L001_R2_001,23L003029_S5_L001_R1_001,23L003029_S5_L001_R2_001,23L003030_S6_L001_R1_001,23L003030_S6_L001_R2_001,23L003031_S7_L001_R1_001,23L003031_S7_L001_R2_001,23L003032_S8_L001_R1_001,23L003032_S8_L001_R2_001,Sample_22L004117.1,Sample_22L004117.2,Sample_22L004118.1,Sample_22L004118.2,Sample_22L004119.1,Sample_22L004119.2,Sample_22L004120.1,Sample_22L004120.2,Sample_22L004121.1,Sample_22L004121.2,Sample_22L004122.1,Sample_22L004122.2,Sample_22L004123.1,Sample_22L004123.2,Sample_22L004124.1,Sample_22L004124.2,Sample_22L004125.1,Sample_22L004125.2,Sample_22L004126.1,Sample_22L004126.2,Sample_22L004127.1,Sample_22L004127.2,Sample_22L004128.1,Sample_22L004128.2,Sample_22L004129.1,Sample_22L004129.2,Sample_22L004130.1,Sample_22L004130.2,Sample_22L004131.1,Sample_22L004131.2,Sample_22L004132.1,Sample_22L004132.2 \
--project_path $optdir
reademption viz_align --project_path $optdir 
reademption viz_gene_quanti --project_path $optdir
reademption viz_deseq --project_path $optdir
