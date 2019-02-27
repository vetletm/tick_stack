# == Class: tick_stack::chronograf::params
#
class tick_stack::chronograf::params {
  $url      = 'localhost:8086'
  $ensure   = 'present'
  $src_dir  = '/tmp/chronograf/'

  case $::facts['os']['family'] {
    'Debian': {
      $pkg_url  = 'https://dl.influxdata.com/chronograf/releases/chronograf_1.7.8_amd64.deb'
      $pkg_name = 'chronograf_1.7.8_amd64.deb'
      $provider = 'dpkg'
    }
    'RedHat': {
      $pkg_url  = 'https://dl.influxdata.com/chronograf/releases/chronograf-1.7.8.x86_64.rpm'
      $pkg_name = 'chronograf-1.7.8.x86_64.rpm'
      $provider = 'rpm'
    }
    default: {
      fail('Only RedHat and Debian type distributions are supported')
    }
  }

  $service    = 'running'
  $enable     = true
  $hasrestart = true
  $hasstatus  = true

  $conf_path = '/etc/default/chronograf'
  $config    = ''
}
