# == Class harden::install
#
# This class is called from harden for install.
#
class harden::install {

  package { $harden::params::install_packages:
    ensure => present,
  }
}
