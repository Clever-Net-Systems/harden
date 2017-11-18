# == Class harden::logindefs
#
# This class is called from harden for logindefs.
#
class harden::logindefs {
  if $harden::harden_logindefs {
    file_line { 'login_encrypt_method':
      ensure => present,
      path   => '/etc/login.defs',
      line   => 'ENCRYPT_METHOD SHA512',
      match  => '^ENCRYPT_METHOD',
    }
  }
}
