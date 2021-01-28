

rangeget<-function(x,binmin,binmax,tiny=1E-3)  !((binmin+tiny)>max(x))&!((binmax)<min(x))

getall<-function(x,cparnam,mins,maxes,cpars){
  cnams<-names(OM1@cpars)
  state<-rangeget(x,mins,maxes)
  ind<-match(cparnam,cnams)
  if(!is.na(ind))state<-rangeget(OM1@cpars[[ind]],mins,maxes)
  if(sum(state)==0){
    dif<-(mean(x)-(mins+maxes)/2)^2
    state=dif==min(dif)
  }
  state
}  



GoBackwards<-function(OM1){
 
  HDat<-runMSE(OM1,Hist=T)
  FM<-apply(HDat$AtAge$FM[,,,2],c(1,3),max)
  FM<-FM/apply(FM,1,mean)
  
  ny<-OM1@nyears
  nsim<-OM1@nsim
  
  # Fpanels ------------------------------
  PanelState[[1]][1][[1]]<<-getall(OM1@M,"M",M_mins,M_maxes,OM1@cpars)
  PanelState[[1]][2][[1]]<<-getall(OM1@D,"D",D_mins,D_maxes,OM1@cpars)
  PanelState[[1]][3][[1]]<<-getall(OM1@h,"h",h_mins,h_maxes,OM1@cpars)
  
  trends<-array(NA,c(6,ny))
  fit<-rep(NA,6)
  for(i in 1:6){
    trends[i,]<-Ftrendfunc(M1=M1s[i],M2=M2s[i],sd1=sd1s[i],sd2=sd2s[i],h2=h2s[i],ny=ny)
    fit[i]<-sum((rep(trends[i,],each=nsim)-FM)^2)
  }
  #cols<-c('blue','black','dark grey','orange',"red","green")
  #ltys<-rep(c(1,2),each=3)
  #par(mfrow=c(1,2))
  #matplot(t(FM),type='l')
  #matplot(t(trends),type='l',col=cols,lty=ltys,lwd=c(1,3)[as.integer(fit==min(fit))+1])
  #legend('topleft',legend=paste(names(FP_list),round(fit,0)),text.col=cols,lty=ltys,col=cols,bty='n',cex=0.8)
  
  PanelState[[1]][4][[1]]<<-fit<(min(fit)*1.1)
  
  FSDrange<-range(apply(abs((FM[,1:(ny-1)]-FM[,2:ny])/FM[,2:ny]),1,quantile,p=c(0.2,0.8)))
  PanelState[[1]][5][[1]]<<-getall(FSDrange,"nope",F_mins,F_maxes,OM1@cpars)
  
  Sel50sim<-c(mean(c(OM1@L5[1],OM1@LFS[1])),mean(c(OM1@L5[2],OM1@LFS[2])))
  if(Sel50sim[1]>2)Sel50sim<-Sel50sim/OM1@L50[2:1]
  PanelState[[1]][6][[1]]<<-getall(Sel50sim,"nope",sel_mins,sel_maxes,OM1@cpars)
  
  PanelState[[1]][7][[1]]<<-getall(OM1@Vmaxlen,"Vmaxlen",dome_mins,dome_maxes,OM1@cpars)
  PanelState[[1]][8][[1]]<<-getall(OM1@DR,"DR",DR_mins,DR_maxes,OM1@cpars)
  PanelState[[1]][9][[1]]<<-getall(OM1@Fdisc,"Fdisc",PRM_mins,PRM_maxes,OM1@cpars)
  PanelState[[1]][10][[1]]<<-getall(OM1@Perr,"Perr",sigR_mins,sigR_maxes,OM1@cpars)
  PanelState[[1]][11][[1]]<<-getall(OM1@qinc,"qinc",q_mins,q_maxes,OM1@cpars)
  PanelState[[1]][12][[1]]<<-getall(OM1@Size_area_1,"Size_area_1",A_mins,A_maxes,OM1@cpars)
  PanelState[[1]][13][[1]]<<-getall(OM1@Prob_staying,"Prob_staying",V_mins,V_maxes,OM1@cpars)
  
  # Mpanels ----------------------------------
  
  PanelState[[2]][2][[1]]<<-getall(OM1@TACFrac,"TACFrac",IB_mins,IB_maxes,OM1@cpars)
  PanelState[[2]][3][[1]]<<-getall(OM1@TACSD,"TACSD",IV_mins,IV_maxes,OM1@cpars)
  
  # Dpanels ----------------------------------
  
  Cbiasrange<-qlnorm(c(0.05,0.95),0,OM1@Cbiascv)
  PanelState[[3]][2][[1]]<<-getall(Cbiasrange,"Cbias",CB_mins,CB_maxes,OM1@cpars)
  PanelState[[3]][3][[1]]<<-getall(OM1@beta,"beta",Beta_mins,Beta_maxes,OM1@cpars)
  
  dif<-(mean(OM1@Cobs)-c(0.025,0.15,0.2,0.4))^2
  PanelState[[3]][4][[1]]<<-dif==min(dif)
  
  Just[[1]][1+(1:13)]<<-"Best match to loaded operating model"
  Just[[2]][2:3]<<-"Best match to loaded operating model"
  Just[[3]][2:4]<<-"Best match to loaded operating model"
  
  updateTextInput(session, "Name",     value= OM1@Name)
  updateTextInput(session, "Species",  value= OM1@Species)
  updateTextInput(session, "Region",   value= OM1@Region)
  updateTextInput(session, "Agency",   value= OM1@Agency)
  updateTextInput(session, "nyears",   value= OM1@nyears)
  updateTextInput(session, "Author",   value= OM1@Sponsor)
  updateTextInput(session, "Justification",value=Just[[1]][1])
  updateTabsetPanel(session,"tabs1",selected="1")
  
}



GoBackwards_SRA<-function(OM1){
  
  HDat<-runMSE(OM1,Hist=T)
  FM<-apply(HDat$AtAge$FM[,,,2],c(1,3),max)
  FM<-FM/apply(FM,1,mean)
  
  ny<-OM1@nyears
  nsim<-OM1@nsim
   # Fpanels ------------------------------
  PanelState[[1]][2][[1]]<<-getall(OM1@D,"D",D_mins,D_maxes,OM1@cpars)
  
  trends<-array(NA,c(6,ny))
  fit<-rep(NA,6)
  for(i in 1:6){
    trends[i,]<-Ftrendfunc(M1=M1s[i],M2=M2s[i],sd1=sd1s[i],sd2=sd2s[i],h2=h2s[i],ny=ny)
    fit[i]<-sum((rep(trends[i,],each=nsim)-FM)^2)
  }
  #cols<-c('blue','black','dark grey','orange',"red","green")
  #ltys<-rep(c(1,2),each=3)
  #par(mfrow=c(1,2))
  #matplot(t(FM),type='l')
  #matplot(t(trends),type='l',col=cols,lty=ltys,lwd=c(1,3)[as.integer(fit==min(fit))+1])
  #legend('topleft',legend=paste(names(FP_list),round(fit,0)),text.col=cols,lty=ltys,col=cols,bty='n',cex=0.8)
  
  PanelState[[1]][4][[1]]<<-fit<(min(fit)*1.1)
  
  FSDrange<-range(apply(abs((FM[,1:(ny-1)]-FM[,2:ny])/FM[,2:ny]),1,quantile,p=c(0.2,0.8)))
  PanelState[[1]][5][[1]]<<-getall(FSDrange,"nope",F_mins,F_maxes,OM1@cpars)
  
  Sel50sim<-c(mean(c(OM1@L5[1],OM1@LFS[1])),mean(c(OM1@L5[2],OM1@LFS[2])))
  if(Sel50sim[1]>2)Sel50sim<-Sel50sim/OM1@L50[2:1]
  PanelState[[1]][6][[1]]<<-getall(Sel50sim,"nope",sel_mins,sel_maxes,OM1@cpars)
  
  PanelState[[1]][7][[1]]<<-getall(OM1@Vmaxlen,"Vmaxlen",dome_mins,dome_maxes,OM1@cpars)
  PanelState[[1]][10][[1]]<<-getall(OM1@Perr,"Perr",sigR_mins,sigR_maxes,OM1@cpars)
 
  # Mpanels ----------------------------------
  
  PanelState[[2]][2][[1]]<<-getall(OM1@TACFrac,"TACFrac",IB_mins,IB_maxes,OM1@cpars)
  PanelState[[2]][3][[1]]<<-getall(OM1@TACSD,"TACSD",IV_mins,IV_maxes,OM1@cpars)
  
  # Dpanels ----------------------------------
  
  Cbiasrange<-qlnorm(c(0.05,0.95),0,OM1@Cbiascv)
  PanelState[[3]][2][[1]]<<-getall(Cbiasrange,"Cbias",CB_mins,CB_maxes,OM1@cpars)
  PanelState[[3]][3][[1]]<<-getall(OM1@beta,"beta",Beta_mins,Beta_maxes,OM1@cpars)
  
  dif<-(mean(OM1@Cobs)-c(0.025,0.15,0.2,0.4))^2
  PanelState[[3]][4][[1]]<<-dif==min(dif)

}

UpdateQuest<-function(){
  
  for(i in 1:length(PanelState)){
    for(j in 1:length(PanelState[[i]])) {
      if(!(i==3&j==4)){ # not the radio button
        state<-as.vector(unlist(PanelState[[i]][j]))
        choices<-as.vector(unlist(get(MasterList[[i]][j])))
        selected<-as.list(choices[state])
        choices<-as.list(choices)
        updateCheckboxGroupInput(session, as.character(inputnames[[i]][j]), selected = selected)
      }
    }
  }
  
  i<-3
  j<-4
  state<-as.vector(unlist(PanelState[[i]][j]))
  choices<-as.vector(unlist(get(MasterList[[i]][j])))
  selected<-as.list(choices[state])
  choices<-as.list(choices)
  updateRadioButtons(session, as.character(inputnames[[i]][j]), selected = selected)
  
  
  
}

