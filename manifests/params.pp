# Class: sendmail::params
#
# This class defines default parameters used by the main module class sendmail
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to sendmail class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class sendmail::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/       => 'sendmail-bin',
    /(?i:Centos|RedHat|Scientific)/ => [ 'sendmail' , 'sendmail-cf' ],
    default => 'sendmail',
  }

  $service = $::operatingsystem ? {
    default => 'sendmail',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'sendmail',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'sendmail',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/mail',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/mail/sendmail.mc',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/sendmail',
    default                   => '/etc/sysconfig/sendmail',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/sendmail.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/spool/mail',
  }

  $log_dir = $::operatingsystem ? {
    default => '',
  }

  $log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/mail.log',
    default => '/var/log/maillog',
  }

  $port = '25'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
