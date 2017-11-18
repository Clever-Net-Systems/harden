# == Class harden::params
#
# This class is meant to be called from harden.
# It sets variables according to platform.
#
class harden::params {
  # Default is to activate all hardening items
  $harden_grub      = true
  $harden_audit     = true
  $harden_sysctl    = true
  $harden_limits    = true
  $harden_modprobe  = true
  $harden_logindefs = true
  $install_packages = [ 'scap-security-guide', 'aide' ]

  case $::osfamily {
    #'Debian': {
    #}
    'RedHat': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
