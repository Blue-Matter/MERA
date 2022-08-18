# MERA

### Introduction 
Fisheries managers are in need of quantitative tools to inform decisions regarding selection of robust management practices, prioritizing research gaps, and stocks to focus on, particularly where there are limited resources or data. To support these decisions, the use of Management Strategy Evaluation (MSE), i.e., closed loop simulation-testing of harvest strategy performance, is widely regarded as best practice.

However, applying MSE is time- and computationally-intensive, and requires highly skilled expertise and processes for stakeholder input and peer review. For data- and capacity-limited fisheries MSE may be particularly challenging to implement. Yet, these are the contexts where it is most critical to test assumptions, evaluate the implications of all sources of uncertainty, and identify the most informative data sources. 

The MERA (Method Evaluation and Risk Assessment) framework was developed as an accessible online interface to facilitate wider use of MSE, with quick processing time, focused on generic data-limited management procedures, but allowing progression to tailored and more data rich methods.  

The framework links a quantitative questionnaire and data input standard to a flexible operating model with optional customization via command line access to the back-end open-source [openMSE](https://openmse.com/) R libraries.
          

MERA includes more than 30 approaches for estimating population status from varying data types and more than 100 fishery management options.

A comprehensive user guide is available [here](https://blue-matter.github.io/openMSE/MERA-User-Guide.html). The [MERA library](https://www.merafish.org/library/) contains over 30 case studies that can be used to explore the app.     

MERA was commissioned by the [Marine Stewardship Council](https://www.msc.org) and developed by [ Blue Matter Science](https://www.bluematterscience.com). Additional support is gratefully acknowledged from the [Natural Resources Defense Council](https://www.nrdc.org/). 



### Licensing
The MERA software is available under two different Creative Common licences:

1. [MERA for Users](https://www.merafish.org/): the online app commissioned by the [MSC](https://www.msc.org) and licensed with [CC BY-NC-ND](https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode).

2. MERA for Developers: the open-source code available in this repository and licensed with [CC BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode). Under this license, users may copy and modify the code for MERA, but any derivative versions must not be used for commercial purposes and must not use the [MSC](https://www.msc.org) logo.
            
### Installing and Using the App

The MERA App can be installed and run locally within the R environment:

Download and install the MERA package: 

```
# install.packages('devtools')
devtools::install_github('bluematter/MERA')
```

Run the MERA App:

```
library(MERA)
MERA()
```