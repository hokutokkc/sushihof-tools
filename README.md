# sushihof-tools
## Add repo
```
echo "deb http://sushihof.de/debian/ jessie main" >> /etc/apt/sources.list
wget http://sushihof.de/debian/sushihof.gpg
sudo apt-key add sushihof.gpg
rm sushihof.gpg
sudo apt-get update
```
