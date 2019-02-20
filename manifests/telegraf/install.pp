class tick_stack::telegraf::install {
  # $osfamily         = $::facts['os']['family'],
  # ){
  #
  # if $osfamily == 'Debian' {
  #   $operatingsystem  = downcase($::facts['os']['name'])
  #   $oscodename       = downcase($::facts['os']['distro']['codename'])
  #   apt::source { 'influx':
  #     location => "https://repos.influxdata.com/${operatingsystem}",
  #     repos    => 'stable',
  #     release  => $oscodename,
  #     key      => {
  #       'id'     => '05CE15085FC09D18E99EFB22684A14CF2582E0C5',
  #       'source' => 'https://repos.influxdata.com/influxdb.key',
  #     },
  #     before   => Package['telegraf'],
  #   }
  # } elsif $osfamily == 'RedHat' {
  #   yumrepo { 'influx':
  #     baseurl  => 'https://repos.influxdata.com/rhel/$releasever/$basearch/stable',
  #     descr    => 'InfluxDB Repository - RHEL \$releasever',
  #     enabled  => '1',
  #     gpgcheck => '1',
  #     gpgkey   => 'https://repos.influxdata.com/influxdb.key',
  #     before   => Package['telegraf'],
  #   }
  # }
  package { 'telegraf':
    ensure => latest,
    notify => Service['telegraf'],
  }

  service { 'telegraf':
   ensure  => running,
   enable  => true,
   require => Package['telegraf'],
   notify  => File['telegraf_conf'],
  }

  # After installation, telegraf will add a fully commented config file, this removes it so we can add our own
  file { 'telegraf_conf':
    ensure  => absent,
    require => Service['telegraf'],
    path    => '/etc/telegraf/telegraf.conf'
  }
}
