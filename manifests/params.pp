#=Class: netconsole::params
#
# Set the defaults for netconsole here. Blank is probably reasonable.

class netconsole::params (
  $enable = true,
) {
  # For RedHat, this should really already exist. 
  if ($::osfamily == 'RedHat') {
    $package_list = 'initscripts'
    $config_file  = '/etc/sysconfig/netconsole'
    $service_name = 'netconsole'
  } else {
    # I'm only writing for RedHat here. Give me working code if you want this
    # for another flavour. 
    fail('This module only supports RedHat. Check netconsole::params.')
  }
}
