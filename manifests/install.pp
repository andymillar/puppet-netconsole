#=Class: netconsole::install
#
# Install netconsole. Chances are the system already has it, but it's bad
# practice to assume.

class netconsole::install (
  $package_list = $::netconsole::package_list,
) inherits netconsole {
  package { $package_list:
    ensure => present,
  }
}
