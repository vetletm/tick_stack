# == Class: tick_stack::chronograf::install
#
class tick_stack::chronograf::install (
  $ensure   = $tick_stack::chronograf::params::ensure,
  $src_dir  = $tick_stack::chronograf::params::src_dir,
  $pkg_url  = $tick_stack::chronograf::params::pkg_url,
  $pkg_name = $tick_stack::chronograf::params::pkg_name,
  $provider = $tick_stack::chronograf::params::provider,
  ) inherits tick_stack::chronograf::params {

  file { $src_dir:
    ensure => directory,
  }
  -> wget::fetch { 'Fetch chrono package':
    source      => $pkg_url,
    destination => $src_dir
  }
  -> package { $pkg_name:
      ensure   => $ensure,
      provider => $provider,
      source   => "${src_dir}/${pkg_name}",
  }
}
