# == Class: tick_stack::chronograf
#
class tick_stack::chronograf (
  $url        = $tick_stack::chronograf::params::url,
  $ensure     = $tick_stack::chronograf::params::ensure,
  $service    = $tick_stack::chronograf::params::service,
  $src_dir    = $tick_stack::chronograf::params::src_dir,
  $pkg_url    = $tick_stack::chronograf::params::pkg_url,
  $pkg_name   = $tick_stack::chronograf::params::pkg_name,
  $enable     = $tick_stack::chronograf::params::enable,
  $hasrestart = $tick_stack::chronograf::params::hasrestart,
  $hasstatus  = $tick_stack::chronograf::params::hasstatus,
  $conf_path  = $tick_stack::chronograf::params::conf_path,
  $config     = $tick_stack::chronograf::params::config
  ) inherits tick_stack::chronograf::params {
  class {'tick_stack::chronograf::install':
    ensure   => $ensure,
    src_dir  => $src_dir,
    pkg_url  => $pkg_url,
    pkg_name => $pkg_name
  }
  -> class {'tick_stack::chronograf::config':
    conf_path => $conf_path,
    config    => $config
  }
  ~> class {'tick_stack::chronograf::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
