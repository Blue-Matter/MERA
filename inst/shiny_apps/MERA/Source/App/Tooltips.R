# Tooltips

ntips<<-18
ids<-list()
titles<-list()
placements<-as.list(rep('bottom',ntips))
triggers<-as.list(rep('hover',ntips))

ids[[1]]<-"interval"
titles[[1]]<-"The number of years between management implementations (e.g. between TACs are set)"

ids[[2]]<-"Save"
titles[[2]]<-"Save just the MERA questionnaire (small)"

ids[[3]]<-"Save_session"
titles[[3]]<-"Save a previous session including calculated results (large)"

ids[[4]]<-"Save_OM"
titles[[4]]<-"Export just the operating model created by this MERA session"

ids[[5]]<-"plusgroup"
titles[[5]]="For computational efficiency, MERA assumes a plus group age that is the smaller of
                               either the age specified here or the age at 10 per cent cumulative unfished survival"


ids[[6]]<-"Start"
titles[[6]]= "Start a new MERA session"

ids[[7]]<-"Distribution"
titles[[7]]<-"In Step 1: Characterize fishery system, the user answers questions relating to parameters of the operating models.
               These are presented as a range of values. Here the user can select the distribution used to sample those parameter
               values in the range specified"

ids[[8]]<-"IQRange"
titles[[8]]<-"If the user selected a non-uniform distribution for sampling operating model parameters, they can also specify the quantiles 
              that correspond to upper and lower bounds in the questionnaire. Selecting a value of 90% will sample values between the 5th and 95th 
              percentiles of the distribution"

ids[[9]]<-"Parallel"
titles[[9]]<-"The user can opt to use parallel processing for operating models with more than 48 simulations which can dramatically shorten 
               the time taken for calculations"

ids[[10]]<-"nsim"
titles[[10]]<-"The number of simulations (individual unique fishery instances) used for MSE analyses. In each simulation a unique sample of operating model parameters is 
#sampled based on the ranges specified in the MERA questionnaires. If operating models are conditioned on data, an individual model fit is done on each simulation.
#Non-converged simulations are dropped."

ids[[11]]<-"OM_C"
titles[[11]]<-"Should MSE analyses use the conditioned operating model or just use that determined by only the Questionnaire?
   When the user loads a data file, if there are sufficient data they can opt to condition (fit) their
   MERA-specified operating model on those data. MERA automatically detects what conditioning approaches 
   may be applied given the data provided. It can make use of catch (C), complete effort (E), length composition (L), 
   age composition (A), mean length (M) and relative indices of total biomass, spawning biomass, and vulnerable
   biomass (I). If the user specifies a conditioning model that includes effort (E), the model will assume that 
   apical fishing mortality rates are proportional to effort while attempting to fit all other data. Conditioning models that
   do not include catches (C), will be scale-free (unfished recruitment is not updated)"

ids[[12]]<-"C_eq_val"
titles[[12]]<-"The equilibrium catches that were taken on average, prior to the first year that catch data are provided. This provides a way to 
               condition a stock that is depleted prior to the first year that data are available."

ids[[13]]<-"C_eq"
titles[[13]]<-"Use the equilibrium catches in operating model conditioning."

ids[[14]]<-"ESS"
titles[[14]]<-"The maximum effective sample size (ESS) of annual age and length composition data. If three years of length composition data were provided 
               that had 90, 170 and 20 samples in each, an ESS value of 100 would affect only the second value and lead to a vector: [90, 100, 20]."

ids[[15]]<-"Wt_comp"
titles[[15]]<-"A weighting factor for the negative log-likelihood component for age and length composition data. A weighting of 1 is no adjustment. If three years of length composition data were provided 
               that had 90, 170 and 20 samples in each, a multiplier of 0.1 would lead to totals of 9, 17 and 2, respectively."

ids[[16]]<-"max_F"
titles[[16]]<-"The maximum apical (most selected age class), fishing mortality rate allowed in operating model conditioning. For example, a value of 3 corresponds to a 
               maximum harvest rate of 95 per cent for the most selected age class."


ids[[17]]<-"Dep_reb"
titles[[17]]= "The Management Planning mode runs a second projection starting at a user-specified level of depletion to evaluate
    the abilty of management procedures to rebuild from depleted levels."

ids[[18]]<-"catchcond"
titles[[18]]= "Where the conditioning model does not include effort 'E', the model defaults to a stock reduction analysis formulation that solves the 
    Baranov equation in each time step - which means that catches are removed exactly and annual apical F parameters do not need to be estimated. If the user has
    issues with applying the SRA approach they can opt to estimate the annual apical F parameters and accept observation error in the catches by checking this box"



