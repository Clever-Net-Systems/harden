# == Class harden::service
#
# This class is meant to be called from harden.
# It ensure the service is running.
#
class harden::service {

  service { $::harden::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
