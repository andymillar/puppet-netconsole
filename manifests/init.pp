#=Class: netconsole
#
# Manage netconsole for sending console messages off to another system.
#
# [*localport*]
#   The local port number that the netconsole module will use
#
# [*dev*]
#   The ethernet device to send console messages out of (only set this if it
#   can't be automatically determined)
#
# [*syslogaddr*]
#   The IP address of the remote syslog server to send messages to
#
# [*syslogport*]
#   The listening port of the remote syslog daemon
#
# [*syslogmacaddr*]
#   The MAC address of the remote syslog server (only set this if it can't
#   be automatically determined)

class netconsole (
  $localport     = undef,
  $dev           = undef,
  $syslogaddr    = undef,
  $syslogport    = undef,
  $syslogmacaddr = undef,
  $enable        = $::netconsole::params::enable,
  $package_list  = $::netconsole::params::package_list,
  $config_file   = $::netconsole::params::config_file,
  $service_name  = $::netconsole::params::service_name,
) inherits netconsole::params {

  if ($localport) {
    # Valid ports, ish, are 1-65535
    validate_integer($localport, 65535, 1)
  }

  if ($dev) {
    validate_string($dev)
  }

  if ($syslogaddr) {
    validate_string($syslogaddr)
  }

  if ($syslogport) {
    # Valid ports, ish, are 1-65535
    validate_integer($syslogport, 65535, 1)
  }

  if ($syslogmacaddr) {
    # TODO: Should really validate this as a regex for a mac, not a string
    validate_string($syslogmacaddr)
  }

  validate_bool($enable)
  validate_string($package_list)
  validate_absolute_path($config_file)

  contain netconsole::install
  contain netconsole::config
  contain netconsole::service

  Class[netconsole::install] -> Class[netconsole::config]
  Class[netconsole::config] -> Class[netconsole::service]
}
