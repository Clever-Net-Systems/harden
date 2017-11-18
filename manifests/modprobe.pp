# == Class harden::modprobe
#
# modprobe part of hardening
#
class harden::modprobe {
  if $harden::harden_modprobe {
    file {'/etc/modprobe.d/CIS.conf':
      ensure => file,
      content => template('harden/CIS.conf.erb'),
    }
  }
}
