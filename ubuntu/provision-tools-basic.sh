# Update box
DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y

echo "deb http://http.us.debian.org/debian buster multiverse" >> /etc/apt/sources.list

apt-get install -y software-properties-common

# Enable multiverse for basic tooling
add-apt-repository non-free

# Install basic tools
apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    vim \
    nmap \
    netcat \
    gnupg2 \
    snapd

apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" curl


# Install metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

# Install john from snap
snap install john-the-ripper


apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    nikto \
    hydra \
    sqlmap
