#!/usr/bin/python
import pandas as pd
import matplotlib.pylab as plt
import seaborn as sns
import matplotlib.patches as patches
import numpy as np
import glob

nameD={
"23L003033":"Ab1_Rif_plus",
"23L003034":"Ab1_Rif_minus",
"23L003035":"Ab1_HMGU1_Rif_plus",
"23L003036":"Ab1_HMGU1_Rif_minus",
"23L003037":"Ab2_Rif_plus",
"23L003038":"Ab2_Rif_minus",
"23L003039":"Ab2_HMGU1_Rif_plus",
"23L003040":"Ab2_HMGU1_Rif_minus",
"23L003041":"Ab3_Rif_plus",
"23L003042":"Ab3_Rif_minus",
"23L003043":"Ab3_HMGU1_Rif_plus",
"23L003044":"Ab3_HMGU1_Rif_minus",
"23L003045":"Ab1_Tig_plus",
"23L003046":"Ab1_Tig_minus",
"23L003047":"Ab1_HMGU1_Tig_plus",
"23L003048":"Ab1_HMGU1_Tig_minus",
"23L003049":"Ab2_Tig_plus",
"23L003050":"Ab2_Tig_minus",
"23L003051":"Ab2_HMGU1_Tig_plus",
"23L003052":"Ab2_HMGU1_Tig_minus",
"23L003053":"Ab3_Tig_plus",
"23L003054":"Ab3_Tig_minus",
"23L003055":"Ab3_HMGU1_Tig_plus",
"23L003056":"Ab3_HMGU1_Tig_minus"   
}

def generate_sum_min_cov(sample_name):

    fileList = glob.glob("./READemption_antibiotic_bacteria/output/acinetobacter_coverage-tnoar_min_normalized/%s*"%sample_name)
  
    ## length of the ref
    t = pd.DataFrame({"pos":[i for i in range(3976747+1)]})
    t
    header = ["pos"]
    ## add four file together
    for cov_file in fileList:
        strand = cov_file.split("_")[-1].replace(".wig","")
        sample = cov_file.split("/")[-1].split("_")[3]
        sample_legend = "%s.%s_%s"%(sample_name,sample,strand)
        print(sample_legend)
        # min_cov_file="./READemption_analysis/output/acinetobacter_coverage-tnoar_min_normalized/Sample_22L004117.1_div_by_7120.0_multi_by_6230.0_forward.wig"
        min_cov_df=pd.read_csv(cov_file,skiprows=[0,1],sep=" ",names=["pos","covergae"])
        t = t.merge(min_cov_df,on="pos",how="outer")
        header.append(sample_legend)
        
    t = t.fillna(0)
    t.columns=header
    
    ## add merge reverse and forward
    newt=t.loc[:,["pos"]].copy()
    unique_list = set([i.split("_")[0] for i in t.columns[1:5]])
    for i in unique_list:
        print(i)
        sub = t.filter(regex=("%s_*"%i))
        newt[i]=sub.sum(1)
        
    ## this is for not merge
#     concat_df = pd.melt(t, id_vars='pos', value_vars=header[1:])
    ## this is for merge
    concat_df = pd.melt(newt, id_vars='pos', value_vars=unique_list)
    concat_df["merge_sample"] = concat_df["variable"].replace(nameD,regex=True)
    print("finish")
    sum_df = pd.DataFrame(t.abs().sum(1)) 
#     sum_df = sum_df.reset_index()
#     sum_df.columns= ["pos","cov"]
#     sum_df["type"] = "min_cov_sum"
#     sum_df["sample"] = sample_name

    
    
    return t,sum_df,concat_df,newt


import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

def plot_image(sample_name, savename):

    fig = make_subplots(rows=2, cols=1,row_heights=[1.0,0])


#     colorDict={'%s.R1_forward'%sample_name:"Blue", '%s.R1_reverse'%sample_name:"Orange",
#                '%s.R2_reverse'%sample_name:"Red", '%s.R2_forward'%sample_name:"Green"}
    colorDict={'%s.R1'%savename:"Blue", 
               '%s.R2'%savename:"Red"}
    for i in concat_df["merge_sample"].unique():
        print(i)
        tmpdf=concat_df[concat_df['merge_sample'] == i]
        fig.add_trace(go.Scatter(x=tmpdf["pos"],y=tmpdf["value"], 
                      mode='lines',marker=dict(color=colorDict[i],size=2),
                      name=i),
                      row=1, col=1)
        fig.update_xaxes(range=[-1000,3976747])

## add cds
    for i in gene_wise_df.index:
        start=gene_wise_df.loc[i,"Start"]
        end=gene_wise_df.loc[i,"End"]
#         fq1_cov = gene_wise_df.loc[i,"%s.R1"%sample_name]
#         fq2_cov = gene_wise_df.loc[i,"%s.R2"%sample_name]

        ## add cds region
    #     print(start,end)
        min_value_first = min(concat_df.value) - 50
        fig.add_shape(type="rect", x0=start, y0=min_value_first, x1=end, y1=min_value_first+20,
                      line=dict(color="Red",width=2,),
                      fillcolor="White",row=1, col=1)
#         fig.add_shape(type="rect", x0=start, y0=-100, x1=end, y1=100,
#               line=dict(color="Red",width=1,),
#               fillcolor="White",
#               row=1, col=1)
    fig.show()

    fig.write_html("%s_bacteria_v2.html"%savename)
    
#### test

if __name__ == "__main__":
    import sys
    sample_name=sys.argv[1]

    gene_wise_df=pd.read_csv("./READemption_antibiotic_bacteria/output/acinetobacter_gene_quanti_combined/gene_wise_quantifications_combined_tpm.csv",sep="\t")

    # gene_wise_df

    #sample_name="23L003033"
    t,sum_df,concat_df,newt = generate_sum_min_cov(sample_name)
    t
    print(concat_df)
    newt
    plot_image(sample_name,sys.argv[2])

