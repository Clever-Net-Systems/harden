# == Class harden::config
#
# This class is called from harden for service config.
#
class harden::config {
  file {'/etc/sysctl.d/90-cis.conf':
    ensure => file,
    content => template('harden/90-cis.conf.erb'),
  } ~>
  exec {'/sbin/sysctl -p --system':
  }
  file {'/etc/modprobe.d/CIS.conf':
    ensure => file,
    content => template('harden/CIS.conf.erb'),
  }
}
