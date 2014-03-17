# default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

include bootstrap
include tools
include apache
include php
include php::pear
include php::pecl
include mysql

file { '/opt/omeka-autoinstall.sh':
	name	=> '/opt/omeka-autoinstall.sh',
	ensure	=> present,
	source	=> '/vagrant/files/omeka-autoinstall.sh',
    owner  => 'www-data',
    group  => 'vagrant',
    mode   => '0700',
}