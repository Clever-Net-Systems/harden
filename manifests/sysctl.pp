# == Class harden::sysctl
#
# sysctl part of hardening
#
class harden::sysctl {
  if $harden::harden_sysctl {
    file {'/etc/sysctl.d/90-cis.conf':
      ensure => file,
      content => template('harden/90-cis.conf.erb'),
    } ~>
    exec {'/sbin/sysctl -p --system':
      refreshonly => true,
    }
  }
}
