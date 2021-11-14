          seed = -12345     #random starting seed
       seqfile = muscle-nexus-clean-70p_mk2_top75.phylip    #sequence file retrieved at end of bioinformatic pipeline, same one used for iqtree analyses
      treefile = calibrated_treefile.treefile       #treefile with calibration node set, according to provided R script
       outfile = out

         ndata = 0  #nucleotide sequence data
       seqtype = 0  #0 because we're not dealing with protein sequence data
       usedata = 2 in.BV    #MUST BE MODIFIED WITH STEPS: 0 in step 1 to run without data to view priors, 3 in step 2 to approximate branch lengths, and 2 in.BV for steps 3 and 4 to actually run mcmctree using approximated branch length output
         clock = 2    #independent rates clock model
       RootAge = <.20  #constrains root age to less than 20 million years, based on prior literature

         model = 4  #HKY nucleotide substitution model
         alpha = 1    #rest of parameters not adjusted from suggested defaults
         ncatG = 4    

     cleandata = 0   

       BDparas = 1 1 0.1    
   kappa_gamma = 6 2      
   alpha_gamma = 1 1 

   rgene_gamma = 2 2   
  sigma2_gamma = 1 10    

      finetune = 0:  0.04 0.2 0.3 0.1 0.3

         print = 1
        burnin = 2000000 
      sampfreq = 1000
       nsample = 20000

