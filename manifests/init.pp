# Class: harden
# ===========================
#
# Full description of class harden here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class harden (
  $package_name = $::harden::params::package_name,
  $service_name = $::harden::params::service_name,
) inherits ::harden::params {

  # validate parameters here

#  class { '::harden::install': } ->
  class { '::harden::config': } ->
#  class { '::harden::config': } ~>
#  class { '::harden::service': } ->
  Class['::harden']
}
