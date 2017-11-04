# == Class harden::params
#
# This class is meant to be called from harden.
# It sets variables according to platform.
#
class harden::params {
  case $::osfamily {
    #'Debian': {
    #  $package_name = 'harden'
    #  $service_name = 'harden'
    #}
    'RedHat': {
      $package_name = "['scap-security-guide', 'aide']"
      $service_name = 'harden'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
