# LAMP Stacks ready for Omeka with Vagrant & Puppet

Allows those with an interest in exploring Omeka an easy way to create a virtual development environment.

## This would not exist without the following repositories:
Forked from:
* [jrodriguezjr/puppet-lamp-stack](https://github.com/jrodriguezjr/puppet-lamp-stack).
* Which was based on:
* [PerishableDave/puppet-lamp-stack](https://github.com/PerishableDave/puppet-lamp-stack).
* [jas0nkim/my-vagrant-puppet-lamp](https://github.com/jas0nkim/my-vagrant-puppet-lamp).

## Prerequisites
* [Vagrant](http://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)

## Instructions
0. Ensure Vagrant (http://www.vagrantup.com/) and Virutal Box (https://www.virtualbox.org/) are installed.
1. Open Terminal and install precise32 Vagrant box with the following command (if not installed already):

        $ vagrant box add precise32 http://files.vagrantup.com/precise32.box

2. Clone this repository.
3. Create directory (new folder) "webroot" in the root directory of the clone. This will act as your root web folder.
4. In terminal, change directory to the Git repo root, and start the vagrant box with the following command (may take 1-2 minutes):

        $ vagrant up

5. You're virtual server has been created! Open a browser and visit http://localhost:8888 to finish the Omeka installation.


Optional: If you'd like to access your new Omeka install via the terminal, issue the following command while in the Git repo root:

        $ vagrant ssh
        


## System Package include

* apache2 - rewrite mode enabled, having virtual host with config - refer manifest/vagrant_webroot.sample
* php5
* php5-cli
* php5-mysql
* php5-dev
* php5-gd
* php5-mcrypt
* libapache2-mod-php5
* mysql-server
* curl
* vim
* htop
* unzip
* git
* imagemagick
* omeka

## Updates
25/05/2016 - Updates Omeka to v2.4
10/12/2015 - Updates Omeka to v2.3.1. Updates PHPUnit installation method.
