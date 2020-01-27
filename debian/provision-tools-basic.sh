# Default settings for installation
RUN DEFAULTS='-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
RUN FRONTEND='DEBIAN_FRONTEND=noninteractive'

# Update box
apt-get update && $FRONTEND apt-get upgrade $DEFAULTS -y

echo "deb http://http.us.debian.org/debian buster multiverse" >> /etc/apt/sources.list

apt-get install -y software-properties-common

# Enable multiverse for basic tooling
add-apt-repository non-free

# Install basic tools
$FRONTEND apt-get install -y $DEFAULTS \
    apt-utils \
    vim \
    nmap \
    netcat \
    gnupg2 \
    snapd

$FRONTEND apt-get install -y $DEFAULTS curl


# Install metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

# Install john from snap
snap install john-the-ripper


$FRONTEND apt-get install -y $DEFAULTS \
    nikto \
    hydra \
    sqlmap
