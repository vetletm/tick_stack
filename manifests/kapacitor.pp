# == Class: tick_stack::kapacitor
#
class tick_stack::kapacitor (
  # For Install-class
  $ensure     = $tick_stack::kapacitor::params::ensure,

  # For Config-class
  $conf_path  = $tick_stack::kapacitor::params::conf_path,
  $template   = $tick_stack::kapacitor::params::template,

  # For Service-class
  $service    = $tick_stack::kapacitor::params::service,
  $enable     = $tick_stack::kapacitor::params::enable,
  $hasrestart = $tick_stack::kapacitor::params::hasrestart,
  $hasstatus  = $tick_stack::kapacitor::params::hasstatus,

  # Specific configuration settings:
  String $data_dir = $tick_stack::kapacitor::params::data_dir,
  Hash $http       = $tick_stack::kapacitor::params::http,
  Hash $influxdb   = $tick_stack::kapacitor::params::influxdb,
  Hash $replay     = $tick_stack::kapacitor::params::replay,
  Hash $storage    = $tick_stack::kapacitor::params::storage,
  Hash $task       = $tick_stack::kapacitor::params::task,
  Hash $load       = $tick_stack::kapacitor::params::load,
  Hash $logging    = $tick_stack::kapacitor::params::logging,

  ) inherits tick_stack::kapacitor::params {

  include tick_stack::repo

  contain tick_stack::kapacitor::install
  contain tick_stack::kapacitor::config
  contain tick_stack::kapacitor::service

  Class['tick_stack::kapacitor::install']
  -> Class['tick_stack::kapacitor::config']
  ~> Class['tick_stack::kapacitor::service']

}
