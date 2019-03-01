# == Class: tick_stack::telegraf::params
#
class tick_stack::telegraf::params {
  $ensure       = 'present'
  
  # Service options
  $service            = 'running'
  $enable             = true
  $hasrestart         = true
  $hasstatus          = true

  $conf_path    = '/etc/telegraf/telegraf.conf'

  $global_tags = {
    'dc' => 'home',
  }
  $agent       = {
    'interval' => '10s',
  }

  $outputs     = {
    'outputs.influxdb' => {
      'urls'      => [ 'http://localhost:8086' ],
      'database'  => '"telegraf"',
      'precision' => '"s"',
      },
  }
  $inputs      = {
    'inputs.cpu' => {
      'percpu'   => true,
      'totalcpu' => true,
    },
    'inputs.system' => {}
  }
}
