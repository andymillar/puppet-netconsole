#=Class: netconsole::config
#

class netconsole::config (
  $localport     = $::netconsole::localport,
  $dev           = $::netconsole::dev,
  $syslogaddr    = $::netconsole::syslogaddr,
  $syslogport    = $::netconsole::syslogport,
  $syslogmacaddr = $::netconsole::syslogmacaddr,
  $config_file   = $::netconsole::params::config_file,
) inherits netconsole {

  file { $config_file:
    ensure  => 'present',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/netconsole.erb"),
    notify  => Class['Netconsole::Service'],
  }
}
