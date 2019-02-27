# == Class: tick_stack::chronograf::params
#
class tick_stack::chronograf::params {
  $url = 'localhost:8086'
  $ensure = 'present'
  $service = 'running'
  $src_dir = '/tmp/chronograf/'

  case $::facts['os']['family'] {
    'Debian': {
      $pkg_url = 'https://dl.influxdata.com/chronograf/releases/chronograf_1.7.8_amd64.deb'
      $pkg_name = 'chronograf_1.7.8_amd64.deb'
    }
    'RedHat': {
      $pkg_url = 'https://dl.influxdata.com/chronograf/releases/chronograf-1.7.8.x86_64.rpm'
      $pkg_name = 'chronograf-1.7.8.x86_64.rpm'
    }
    default: {
      fail('Only RedHat and Debian type distributions are supported')
    }
  }
}
