# == Class harden::config
#
# This class is called from harden for service config.
#
class harden::config {
  file_line { 'login_encrypt_method':
    ensure => present,
    path   => '/etc/login.defs',
    line   => 'ENCRYPT_METHOD SHA512',
    match  => '^ENCRYPT_METHOD',
  }
}
