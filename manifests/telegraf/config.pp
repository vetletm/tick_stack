class tick_stack::telegraf::config(
    $section_defaults = lookup(tick_stack::telegraf::section_defaults),
    $defaults = lookup(tick_stack::telegraf::defaults),
    ){

    create_ini_settings($defaults,$section_defaults)

    $influxdb_config = {
      'outputs.influxdb' => {
        'url' => "$tick_stack::telegraf::influxdb_url",
        'database' => "$tick_stack::telegraf::influxdb_database",
        'precision' => "$tick_stack::telegraf::influxdb_precision",
      }
    }

    create_ini_settings($influxdb_config,$section_defaults)
}
