# == Class: tick
#
class tick {
  include tick::base
  include tick::telegraf::install
  include tick::telegraf::config
}
