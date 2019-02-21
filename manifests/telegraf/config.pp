class tick_stack::telegraf::config(
    $section_defaults = lookup(tick_stack::telegraf::section_defaults),
    $defaults_telegraf = lookup(tick_stack::telegraf::defaults_telegraf),
    $config_path = lookup(tick_stack::telegraf::config_path),
    ){

    create_ini_settings($defaults_telegraf,$section_defaults)

    $influxdb_config = {
      'outputs.influxdb' => {
        'url' => "$tick_stack::influxdb_url",
        'database' => "$tick_stack::influxdb_database",
        'precision' => "$tick_stack::influxdb_precision",
      }
    }

    create_ini_settings($influxdb_config,$section_defaults)
}
