class tick_stack::telegraf::config(
    $defaults = lookup(tick_stack::telegraf::defaults),
    $defaults_telegraf = lookup(tick_stack::telegraf::defaults_telegraf),
    $config_path = lookup(tick_stack::telegraf::config_path),
    $influxdb_url = lookup(tick_stack::telegraf::influxdb_url),
    $influxdb_database = lookup(tick_stack::telegraf::influxdb_database),
    $influxdb_precision = lookup(tick_stack::telegraf::influxdb_precision)
    ){

    create_ini_settings($defaults,$defaults_telegraf)

    ini_setting { 'influxdb':
      ensure  => present,
      path => $config_path,
      section => 'outputs.influxdb',
      setting => 'url',
      value   => $influxdb_url,
      section_prefix => '[',
      section_suffix => ']',
    }
    ini_setting { 'influxdb':
      ensure  => present,
      path => $config_path,
      section => 'outputs.influxdb',
      setting => 'database',
      value   => $influxdb_database,
      section_prefix => '[',
      section_suffix => ']',
    }
    ini_setting { 'influxdb':
      ensure  => present,
      path => $config_path,
      section => 'outputs.influxdb',
      setting => 'precision',
      value   => $influxdb_precision,
      section_prefix => '[',
      section_suffix => ']',
    }
}
