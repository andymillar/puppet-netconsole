#=Class: netconsole::service
#

class netconsole::service(
  $service_name = $::netconsole::service_name,
  $enable       = $::netconsole::enable,
) inherits netconsole {

  if ($enable) {
    service { $service_name:
      ensure => 'running',
      enable => true,
    }
  } else {
    service { $service_name:
      ensure => 'stopped',
      enable => false,
    }
  }
}
