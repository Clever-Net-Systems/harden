# Class: harden
# ===========================
#
# Provides CIS/C2S hardening for EL6/7
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# @param harden_grub [Boolean] Whether to harden Grub configuration.  Default value: true.
class harden (
  $harden_grub      = $harden::params::harden_grub,
  $harden_audit     = $harden::params::harden_audit,
  $harden_sysctl    = $harden::params::harden_sysctl,
  $harden_limits    = $harden::params::harden_limits,
  $harden_modprobe  = $harden::params::harden_modprobe,
  $harden_logindefs = $harden::params::harden_logindefs,
  $install_packages = $harden::params::install_packages,
) inherits ::harden::params {

  # validate parameters here
  validate_bool($harden_grub)
  validate_bool($harden_audit)
  validate_bool($harden_sysctl)
  validate_bool($harden_limits)
  validate_bool($harden_modprobe)
  validate_bool($harden_logindefs)
  validate_array($install_packages)

  class { '::harden::grub': }
  class { '::harden::install': }
  class { '::harden::audit': }
  class { '::harden::sysctl': }
  class { '::harden::limits': }
  class { '::harden::modprobe': } ->
  class { '::harden::logindefs': } ->
  Class['::harden']
}
