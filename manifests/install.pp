# == Class harden::install
#
# This class is called from harden for install.
#
class harden::install {

  package { $::harden::package_name:
    ensure => present,
  }
}
