wget --output-file=/vagrant/install_chef_solo.log.txt -O chefdk_0.6.0-1.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.0-1_amd64.deb

cat /vagrant/install_chef_solo.log.txt
sudo dpkg -i chefdk_0.6.0-1.deb
