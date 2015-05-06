puppet-netconsole
=================

Description
-----------

A module to install and manage netconsole, a service to remote syslog console
output. 

Installation
------------

Install `netconsole` in as a module in your Puppetmaster's modulepath.

  git clone https://github.com/andymillar/puppet-netconsole.git /etc/puppet/modules/netconsole

Parameters
----------

  * localport: The local port number that the netconsole module will use.
  * dev: The ethernet device to send console messages out of (only set this if it can't be automatically determined).
  * syslogaddr: The IP address of the remote syslog server to send messages to.
  * syslogport: The listening port of the remote syslog daemon.
  * syslogmacaddr: The MAC address of the remote syslog server (only set this if it can't be automatically determined).

Example
-------

~~~puppet
  node 'node.example.com' {
    class { 'netconsole':
      enable     => true,
      syslogaddr => 'syslog.example.com',
      syslogport => 514,
    }
  }
~~~
