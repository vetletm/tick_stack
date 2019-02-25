# == Class: tick_stack::telegraf::config
#
class tick_stack::telegraf::config(
  # $section_defaults = lookup(tick_stack::telegraf::section_defaults),
  # $defaults         = lookup(tick_stack::telegraf::defaults),

  $url          = $tick_stack::telegraf::params::url,
  $database     = $tick_stack::telegraf::params::database,
  $precision    = $tick_stack::telegraf::params::precision,
  $username     = $tick_stack::telegraf::params::username,
  $password     = $tick_stack::telegraf::params::password,

  $path         = $tick_stack::telegraf::params::conf_path,

  $service_type = $tick_stack::telegraf::params::service_type,
  $region       = $tick_stack::telegraf::params::region,
  $environment  = $tick_stack::telegraf::params::environment,
  $interval     = $tick_stack::telegraf::params::interval,

  ) inherits tick_stack::telegraf::params {

  $section_defaults = {
    'ensure'          => present,
    'path'            => $path,
    'section_prefix'  => '[',
    'section_suffix'  => ']',
    'indent_char'     => ' ',
    'indent_width'    => 2,
  }

  $defaults = {
    'global_tags'   => {
      'dc'            => "\"branch1\"",
      'service'       => $service_type,
      'region'        => $region,
      'environment'   => $environment,
    },

    'agent'         => {
      'interval'      => $interval,
    },
    'inputs.cpu'    => {
      'percpu'        => true,
      'totalcpu'      => true,
    },
    'inputs.mem'    => {
      '# requires'      => 'no config',
    },
    'inputs.system' => {
      '# requires'      => 'no config',
    },
  }

  create_ini_settings($defaults,$section_defaults)

  $influxdb_config = {
    'outputs.influxdb' => {
      'url'       => $url,
      'database'  => $database,
      'precision' => $precision,
      'username'  => $username,
      'password'  => $password,
    }
  }

  create_ini_settings($influxdb_config,$section_defaults)
}
