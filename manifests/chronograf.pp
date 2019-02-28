# == Class: tick_stack::chronograf
#
class tick_stack::chronograf (
  $url                = $tick_stack::chronograf::params::url,
  $ensure             = $tick_stack::chronograf::params::ensure,
  $service            = $tick_stack::chronograf::params::service,
  $src_dir            = $tick_stack::chronograf::params::src_dir,
  $pkg_url            = $tick_stack::chronograf::params::pkg_url,
  $pkg_name           = $tick_stack::chronograf::params::pkg_name,
  $enable             = $tick_stack::chronograf::params::enable,
  $hasrestart         = $tick_stack::chronograf::params::hasrestart,
  $hasstatus          = $tick_stack::chronograf::params::hasstatus,

  $conf_path          = $tick_stack::chronograf::params::conf_path,
  $host               = $tick_stack::chronograf::params::host,
  $port               = $tick_stack::chronograf::params::port,
  $influxdb_url       = $tick_stack::chronograf::params::influxdb_url,
  $influxdb_username  = $tick_stack::chronograf::params::influxdb_username,
  $influxdb_password  = $tick_stack::chronograf::params::influxdb_password,
  $kapacitor_url      = $tick_stack::chronograf::params::kapacitor_url,
  $kapacitor_username = $tick_stack::chronograf::params::kapacitor_username,
  $kapacitor_password = $tick_stack::chronograf::params::kapacitor_password,
  $cert               = $tick_stack::chronograf::params::cert,
  $key                = $tick_stack::chronograf::params::key,

  ) inherits tick_stack::chronograf::params {
  class {'tick_stack::chronograf::install':
    ensure   => $ensure,
    src_dir  => $src_dir,
    pkg_url  => $pkg_url,
    pkg_name => $pkg_name
  }
  -> class {'tick_stack::chronograf::config':
    conf_path          => $conf_path,
    host               => $host,
    port               => $port,
    influxdb_url       => $influxdb_url,
    influxdb_username  => $influxdb_username,
    influxdb_password  => $influxdb_password,
    kapacitor_url      => $kapacitor_url,
    kapacitor_username => $kapacitor_username,
    kapacitor_password => $kapacitor_password,
    cert               => $cert,
    key                => $key,

  }
  ~> class {'tick_stack::chronograf::service':
    service    => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
