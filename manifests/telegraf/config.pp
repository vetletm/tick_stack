class tick_stack::telegraf::config(
  $defaults = lookup(tick_stack::telegraf::defaults),
  $defaults_telegraf = lookup(tick_stack::telegraf::defaults_telegraf)
  ){
   create_ini_settings($defaults,$defaults_telegraf)
}
