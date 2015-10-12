class php::phpunit {
  include php

  # Download PHPUnit: https://phar.phpunit.de/phpunit-4.8.9.phar
  exec { 'download-phpunit':
    command => 'wget https://phar.phpunit.de/phpunit-4.8.9.phar',
    cwd     => '/vagrant/',
    creates => '/vagrant/phpunit-4.8.9.phar'
  }

  exec {'permission phpunit':
  	cwd     => '/vagrant/',
  	command => 'sudo chmod +x phpunit-4.8.9.phar',
  	require => Exec['download-phpunit']
  }

  exec {'move phpunit':
    require => Exec['permission phpunit'],
    command => 'sudo mv /vagrant/phpunit-4.8.9.phar /usr/local/bin/phpunit'
  }

}
