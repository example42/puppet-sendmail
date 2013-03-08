# Puppet module: sendmail

This is a Puppet module for sendmail based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-sendmail

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

## USAGE - Basic management

* Install sendmail with default settings

        class { 'sendmail': }

* Install a specific version of sendmail package

        class { 'sendmail':
          version => '1.0.1',
        }

* Disable sendmail service.

        class { 'sendmail':
          disable => true
        }

* Remove sendmail package

        class { 'sendmail':
          absent => true
        }

* Enable auditing without without making changes on existing sendmail configuration files

        class { 'sendmail':
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'sendmail':
          source => [ "puppet:///modules/example42/sendmail/sendmail.conf-${hostname}" , "puppet:///modules/example42/sendmail/sendmail.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'sendmail':
          source_dir       => 'puppet:///modules/example42/sendmail/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'sendmail':
          template => 'example42/sendmail/sendmail.conf.erb',
        }

* Automatically include a custom subclass

        class { 'sendmail':
          my_class => 'example42::my_sendmail',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'sendmail':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'sendmail':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'sendmail':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'sendmail':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


[![Build Status](https://travis-ci.org/example42/puppet-sendmail.png?branch=master)](https://travis-ci.org/example42/puppet-sendmail)
