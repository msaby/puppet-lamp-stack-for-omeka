class tools {

  # package install list
  $packages = [
    "curl",
    "vim",
    "htop",
    "git",
    "unzip",
    "imagemagick"
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
