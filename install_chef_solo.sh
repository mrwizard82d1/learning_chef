wget -O chefdk_0.6.0-1.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.0-1_amd64.deb > install_chef_solo.out.txt
sudo dpkg -i chefdk_0.6.0-1.deb
less install_chef_solo.out.txt
