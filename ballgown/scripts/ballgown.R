#!/usr/bin/env Rscript
args_input = commandArgs(trailingOnly=TRUE)



      #### Load required packages ####
      library(ballgown)
      library(RSkittleBrewer)
      library(genefilter)
      library(dplyr)
      library(devtools)



      #### Input checks and defaults ####
      # Check if a valid number of threads and a proper path for was provided and print number of threads. 
      # If no threads are provided, default on one thread and "./".

      if(length(args_input) != 3){
        print("Not all arguments are set. Using default arguments!")
        args_input = list(n_threads=1,
                          pheno_file="./pheno_data.csv", 
                          data_dir="~/seq_data")
        }

      if(is.na(as.integer(args_input$n_threads)) | args_input$n_threads <= 0){
        stop("Please provide valid number of threads!")
      }

      if(!is.character(args_input$pheno_file)){
        stop("Please provide valid path of pheno data!")
      }

      if(!is.character(args_input$data_dir)){
        stop("Please provide valid path for data directory!")
      }

      
   
      # Print threads and pheno file 
      cat("Processing with", args_input$n_threads, "thread(s). ")
      cat("Pheno data input file:", args_input$pheno_file, " ")
      cat("Data input directory:", args_input$data_dir, " ")
      
      
      
      #### Set working directory ####
      setwd(args_input$data_dir)

      
      
      #### Read and preprocess data ####
      
      # Read pheno data
      pheno_data = read.csv(args_input$pheno_file)
      
      # Read ballgown tables
      bg = ballgown(dataDir = "./", samplePattern = "CORKUM",  pData = pheno_data)

      
      # Filter for low abundancies
      bg_filt <- subset(bg, "rowVars(texpr(bg)) > 1", genomesubset=TRUE)
      
      
      
      #### Statistical analysis ####
      # Test for differential expression
      results_transcripts = stattest(bg_filt, 
                                     feature='transcript', 
                                     covariate='sex', 
                                     # adjustvars=c('severity'),
                                     getFC=T,
                                     meas='FPKM')
      
      # Add gene names and sort for p-values
      results_transcripts = data.frame(geneNames=ballgown::geneNames(bg_filt),
                                       geneIDs=ballgown::geneIDs(bg_filt),
                                       results_transcripts)
      results_transcripts = arrange(results_transcripts,pval)
      
      # Test for differential gene expression
      results_genes = stattest(bg_filt, feature='gene',
                               covariate='sex',
                               getFC=TRUE,
                               meas='FPKM')
      results_genes = arrange(results_genes,pval)
      
      
      
      # Plot differences in transcript expression
      plotTranscripts(ballgown::geneIDs(bg)[201100], bg, main=c('PRDM1/BLIMP-1'), sample=c('CORKUM_03','CORKUM_05','CORKUM_11', 'CORKUM_12'))
      
      

      