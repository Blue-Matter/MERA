# build the Docker image from the base image 'openanalytics/r-base'
# this is an Ubuntu 16.04 LTS with a recent R version.
# this image is available on Docker hub at https://hub.docker.com/r/openanalytics/r-base/
FROM openanalytics/r-base

# add the maintainer of this Docker image (this should be you in this case)
LABEL maintainer "Adrian Hordyk <adrian@bluematterscience.com>"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
	build-essential \
    pandoc \
    pandoc-citeproc \
	libcurl4-openssl-dev \    
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
	libfontconfig1-dev \
	libxml2-dev 
	
	
	#libcurl4-gnutls-dev \

# install basic shiny functionality to R
RUN R -e "install.packages(c('shiny', 'rmarkdown', 'remotes', 'openMSE'), repos='https://cloud.r-project.org/')"

# install Github versions of openMSE packages	 
RUN R -e "remotes::install_github(c('blue-matter/MSEtool', 'blue-matter/DLMtool', 'blue-matter/SAMtool', 'blue-matter/MSEextra'))"

# install R package from shiny_live branch
RUN R -e "remotes::install_github('blue-matter/MERA', 'shiny_live')"

# instruct Docker to expose port 3838 to the outside world
# (otherwise it will not be possible to connect to the Shiny application)
EXPOSE 3838

# finally, instruct how to launch the Shiny app when the container is started
CMD ["R", "-e", "MERA::MERA(host='0.0.0.0', port=3838)"]
