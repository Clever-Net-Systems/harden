# == Class harden::limits
#
# limits part of hardening
#
class harden::limits {
  file {'/etc/security/limits.d/50-hardcore.conf':
    ensure => file,
    content => template('harden/50-hardcore.conf.erb'),
  }
}
