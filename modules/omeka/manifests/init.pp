# Install Omeka

class omeka {

  # Create the Omeka database
  exec { 'create-database':
    require => Class['mysql'],
    unless  => 'mysql -u root -pd3v0p5 omeka',
    command => 'mysql -u root -pd3v0p5 --execute=\'create database omeka\'',
  }

  exec { 'create-user':
    require => Class['mysql'],
    unless  => 'mysql -u omeka -pomeka omeka',
    command => 'mysql -u root -pd3v0p5 --execute="GRANT ALL PRIVILEGES ON omeka.* TO \'omeka\'@\'localhost\' IDENTIFIED BY \'omeka\'"',
  }

  # Download Omeka: http://omeka.org/files/omeka-2.3.zip

  exec { 'download-omeka':
    command => 'wget http://omeka.org/files/omeka-2.3.zip',
    cwd     => '/vagrant/',
    creates => '/vagrant/omeka-2.3.zip'
  }

  exec { 'unzip-omeka':
    cwd     => '/vagrant/',
    command => 'unzip omeka-2.3.zip',
    require => Exec['download-omeka'],
    creates => '/vagrant/omeka-2.3.zip',
  }

  exec { 'move-omeka':
    require => Exec['unzip-omeka'],
    command => 'sudo mv /vagrant/omeka-2.3/* /vagrant/webroot/ | sudo mv /vagrant/omeka-2.2.2/.htaccess /vagrant/webroot/',
    }
  exec {'cleanup-omeka':
    require => Exec['move-omeka'],
    command => 'sudo rm /vagrant/omeka-2.3.zip | sudo rm -R /vagrant/omeka-2.3 | sudo rm /vagrant/webroot/db.ini',
    }

  # Copy db.ini
  file { '/vagrant/webroot/db.ini':
    require => Exec['cleanup-omeka'],
    name  => '/vagrant/webroot/db.ini',
    ensure  => present,
    source  => '/vagrant/files/db.ini',
    owner  => 'www-data',
    group  => 'vagrant',
    mode   => '0700',
}
}
