class tick_stack::telegraf::config {
  $defaults_telegraf = {
    'ensure'         => present,
    'path'           => '/etc/telegraf/telegraf.conf',
    'section_prefix' => '[',
    'section_suffix' => ']',
    'indent_char'    => ' ',
    'indent_width'   => 2,
  }

  $userpw_telegraf = {
      'global_tags' => {
        'dc' => "\"branch1\""
      },
      'agent' => {
        'interval' => "\"10s\"",
      },
      'outputs.influxdb'  => {
        # Change URL to be DNS resolved hostname, requires whole infrastructure
        'url'       => "\"http://128.39.169.97:8086\"",
        'database'  => "\"telegraf\"",
        'precision' => "\"s\""
      },
      'inputs.cpu' => {
        'percpu'    => true,
        'totalcpu'  => true,
      },
  }
   create_ini_settings($userpw_telegraf,$defaults_telegraf)
}
