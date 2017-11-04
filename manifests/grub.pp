# == Class harden::grub
#
# grub part of hardening
#
class harden::grub {
  file {'/boot/grub2/grub.cfg':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  } ->
  shellvar { 'GRUB_CMDLINE_LINUX':
    ensure       => present,
    target       => '/etc/default/grub',
    value        => 'audit=1',
    quoted       => 'double',
    array_append => true
  } ~>
  exec { '/usr/sbin/grub2-mkconfig -o /boot/grub2/grub.cfg': }
}
