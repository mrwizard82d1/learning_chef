# Diary (_Learning Chef_)

## 31-May-2015

I began with a problem. The book, _Learning Chef_, seems to assume
that one can the GUI installer available by clicking the _Download_
link on the https://downloads.chef.io/chef-dk/ubuntu/#/. The problem
with this approach is that I have no GUI. I only have an SSH
terminal.

I thought I could get a GUI by setting the `vm.provider.gui` to
true. When I set this attribute to true, I get a GUI but not the GUI I
expect; its only a console in a Mac window.

I noticed at the end of the `Vagrantfile` a option to configure the
virtual machine provisioner. I tried the following:

	config.vm.provision "chef_solo" do |chef|
	end

This failed with the error:

	FATAL: None of the cookbook paths set in
    Chef::Config[:cookbook_path],
    ["/tmp/vagrant-chef/cookbooks/cookbooks"], contain any cookbooks

I then tried adding a recipe as follows:

	config.vm.provision "chef_solo" do |chef|
	  chef.add_recipe "apache"
	end

This failed with the message:

	ERROR: Cookbook apache not found. If you're loading apache from
    another cookbook, make sure you configure the dependency in your
    metadata

I then did more Googling and found the web page
https://www.chef.io/blog/2013/03/11/chef-11-server-up-and-running/. This
page describes how to:

* Download the chef_solo .deb file.
* Install it using `dpkg`.

Execute the steps:

* `vagrant up` (after installing the box `chef/ubuntu14.04`).
* Open new terminal and execute `vagrant ssh`.
* `wget -O chefdk_0.6.0-1.deb
https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.0-1_amd64.deb`
* Wait patiently.
* `sudo dpkg -i chefdk_0.6.0-1.deb`
* Wait patiently again.

Hooray! It responds _Thank you for installing he Chef Development
Kit!_

I believe I can `rm chefdk_0.6.0-1.deb`. In fact, I think I could add
this provisioning to the `Vagrantfile`. Time to try it.

### Install Chef Solo when provisioned using inline code

* Change the provisioner to the following:

	config.vm.provision "shell", inline: <<-SHELL
	  wget -O chefdk_0.6.0-1.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.0-1_amd64.deb
	  sudo dpkg -i chefdk_0.6.0-1.deb
	SHELL

This seems to work, although because the terminal is **not** a TTY, it
prints **bazillions** of lines (trying to use the curses
library?). Might not be the best option.

I think I'll try the same provisioner but redirecting I/O.

### Install Chef Solo when provisioned using a script

* `vagrant destroy`.
* Create the script `install_chef_solo.sh` with the contents:

	wget -O chefdk_0.6.0-1.deb https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.6.0-1_amd64.deb > install_chef_solo.out.txta
	sudo dpkg -i chefdk_0.6.0-1.deb
	less install_chef_solo.out.txt

* Change the provisioner to:

	config.vm.provision "shell", path: "install_chef_solo.sh"

Hmmm. These changes failed to suppress the "progress dots" used by
`wget`. Time to do more Googling.

### Research wget options

Found a page describing all the options for `wget`
(http://www.gnu.org/software/wget/manual/html_node/Download-Options.html). Discovered
the `--quiet` option and the `--output-file=logfile` option. Let's try
the logfile option first.

Hmmm. Still get the _stdin: is not a tty_ message; however, I **do
not** see the progress dots. I do, still, however, need to wait
patiently. :)

Hmmm. Now I get an error: _install_chef_solo.log.txt_: No such file or
directory when trying to display it. Very close. I'll try piping it to
`/vagrant/install_chef_solo.log.txt` instead since that is a shared
location.

Argh! A trailing _._ when specifying the output file. Try again. I
know it'll work this time.

It's working!

Duh. DRY. Eventually I'll learn.



