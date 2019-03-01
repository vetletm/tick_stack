# == Class: tick_stack::kapacitor::config
#
class tick_stack::kapacitor::config(
  $path = tick_stack::kapacitor::params::path
  ) inherits tick_stack::kapacitor::params {
  file { $path:
    ensure  => file,
    content => template('tick_stack/kapacitor.conf.erb')
  }
}
