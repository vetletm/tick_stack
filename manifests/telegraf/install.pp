# == Class: tick_stack::telegraf::install
#
class tick_stack::telegraf::install {

  package { 'telegraf':
    ensure => latest,
  }
  -> file { 'telegraf_conf':
    ensure => absent,
    path   => '/etc/telegraf/telegraf.conf',
  }
}
