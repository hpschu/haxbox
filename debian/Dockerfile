FROM debian:buster

# Default settings for installation
RUN DEFAULTS='-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
RUN FRONTEND='DEBIAN_FRONTEND=noninteractive'

RUN apt-get update && $FRONTEND apt-get install -y $DEFAULTS apt-utils

RUN $FRONTEND apt-get install -y software-properties-common

# Enable multiverse for basic tooling
RUN apt-get update && add-apt-repository non-free

# Install basic tools
RUN $FRONTEND apt-get install -y $DEFAULTS \
    apt-utils \
    vim \
    nmap \
    netcat \
    gnupg2

RUN $FRONTEND apt-get install -y $DEFAULTS \
    curl

# Install metasploit
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus\
/master/config/templates\
/metasploit-framework-wrappers/msfupdate.erb > msfinstall

RUN chmod 755 msfinstall
RUN ./msfinstall

RUN $FRONTEND apt-get install -y $DEFAULTS \
    john \
    nikto \
    hydra \
    sqlmap \
    && rm -rf /var/lib/apt/lists/*
