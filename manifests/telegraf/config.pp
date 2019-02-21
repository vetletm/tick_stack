class tick_stack::telegraf::config(
    $defaults = lookup(tick_stack::telegraf::section_defaults),
    $defaults_telegraf = lookup(tick_stack::telegraf::defaults_telegraf),
    $config_path = lookup(tick_stack::telegraf::config_path),
    $influxdb_url = lookup(tick_stack::telegraf::influxdb_url),
    $influxdb_database = lookup(tick_stack::telegraf::influxdb_database),
    $influxdb_precision = lookup(tick_stack::telegraf::influxdb_precision)
    ){

    create_ini_settings($defaults_telegraf,$defaults)

    $influxdb_config = {
      'outputs.influxdb' => {
        'url' => "$influxdb_url",
        'database' => "$influxdb_database",
        'precision' => "$influxdb_precision",
      }
    }

    create_ini_settings($influxdb_config,$defaults)
}
