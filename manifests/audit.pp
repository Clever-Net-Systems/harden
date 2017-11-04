# == Class harden::audit
#
# auditd part of hardening
#
class harden::audit {
  file_line { 'auditd_max_log_file':
    ensure => present,
    path   => '/etc/audit/auditd.conf',
    line   => 'max_log_file = 32',
    match  => '^max_log_file',
  } ->
  file {'/etc/audit/rules.d/CIS.rules':
    ensure => file,
    content => template('harden/CIS.rules.erb'),
  } ~>
  exec {'/sbin/service auditd restart':
    refreshonly => true,
  }
}
