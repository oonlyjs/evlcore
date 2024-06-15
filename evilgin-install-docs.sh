# sudo apt-get install wget
# wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
# tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
# rm go1.22.4.linux-amd64.tar.gz
# printf "\nexport PATH=$PATH:/usr/local/go/bin\n" >> ~/.profile
# go version

# good
apt-get update && apt-get install make git
git clone https://github.com/oonlyjs/evlcore.git evlcore-src
mkdir evlcore
cd evlcore-src
tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
rm go1.22.4.linux-amd64.tar.gz
printf "\nexport PATH=$PATH:/usr/local/go/bin\n" >> ~/.profile
go version
# good

make && cd ../evlcore
cp ~/evlcore-src/build/evilginx .
cp -r ~/evlcore-src/phishlets .
cp -r ~/evlcore-src/redirectors .
setcap CAP_NET_BIND_SERVICE=+eip evlcore/evilginx
nano /etc/systemd/resolved.conf
#- Update the '/etc/systemd/resolved.conf'
DNS=1.1.1.1
DNSStubListener=no
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
reboot
./evilginx