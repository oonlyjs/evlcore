apt-get update && apt-get install make git
git clone https://github.com/oonlyjs/evlcore.git evlcore-src
mkdir evlcore
cd evlcore-src
tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
rm go1.22.4.linux-amd64.tar.gz
printf "\nexport PATH=$PATH:/usr/local/go/bin\n" >> ~/.profile
go version
make && cd ../evlcore
cp ~/evlcore-src/build/evilginx .
cp -r ~/evlcore-src/phishlets .
cp -r ~/evlcore-src/redirectors .
