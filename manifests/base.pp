class base {
  # Add repository for telegraf and influxdb
  apt::source { 'influx':
    location => "https://repos.influxdata.com/${operatingsystem}",
    repos    => 'stable',
    release  => $oscodename,
    key      => {
      'id'     => '05CE15085FC09D18E99EFB22684A14CF2582E0C5',
      'source' => 'https://repos.influxdata.com/influxdb.key',
    }
  }
}
