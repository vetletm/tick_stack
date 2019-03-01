# == Class: tick_stack::chronograf::install
#
class tick_stack::chronograf::install (
  $ensure   = $tick_stack::chronograf::params::ensure,
  ) inherits tick_stack::chronograf::params {
  package { 'chronograf':
      ensure   => $ensure,
  }
}
