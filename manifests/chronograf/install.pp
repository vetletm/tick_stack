# == Class: tick_stack::chronograf::
#
class tick_stack::chronograf::install (
  $ensure   = $tick_stack::chronograf::params::ensure,
  $src_dir  = $tick_stack::chronograf::params::src_dir,
  $pkg_url  = $tick_stack::chronograf::params::pkg_url,
  $pkg_name = $tick_stack::chronograf::params::pkg
  ) inherits tick_stack::chronograf::params {

  file { $src_dir:
    ensure => directory,
  }

  -> wget::fetch { 'Fetch chrono package':
    source      => $pkg_url,
    destination => $src_dir
  }

  -> case $facts['osfamily'] {
    'Debian': {
      package { 'chronograf':
        ensure   => $ensure,
        provider => dpkg,
        source   => "${src_dir}/${pkg_name}",
      }
    }
    'Redhat': {
      yum::install { $pkg_name:
        ensure => $ensure,
        source => "${src_dir}/${pkg_name}"
      }
    }
    default: {
      fail('Only RedHat and Debian type distributions are supported')
    }
  }
}
