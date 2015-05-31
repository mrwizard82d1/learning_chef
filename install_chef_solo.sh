LOG_FILE=/vagrant/install_chef_solo.log.txt
wget --output-file=$LOG_FILE -O chefdk_0.6.0-1.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.0-1_amd64.deb
cat $LOG_FILE
sudo dpkg -i chefdk_0.6.0-1.deb
