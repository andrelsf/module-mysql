# Class: mysql
# ===========================
#
# Full description of class mysql here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'mysql':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class mysql(
  String $install_repo_file	= $mysql::params::install_repo_file,
  Array[String] $packages_mysql = $mysql::params::packages_mysql,
  String $config_my_dir 	= $mysql::params::config_my_dir,
  String $config_owner  	= $mysql::params::config_owner,
  String $config_group  	= $mysql::params::config_group,
  String $config_mode   	= $mysql::params::config_mode,
  
  String $service_name          = $mysql::params::service_name,
  String $service_ensure        = $mysql::params::service_ensure,
  Boolean $service_enable       = $mysql::params::service_enable,
  Boolean $service_hasstatus    = $mysql::params::service_hasstatus,
  Boolean $service_hasrestart   = $mysql::params::service_hasrestart,

  String $node_mysql_1		= $mysql::params::node_mysql_1,
  String $node_mysql_2		= $mysql::params::node_mysql_2,
  String $mysql_cmdline_left    = $mysql::params::mysql_cmdline_left,
) inherits ::mysql::params {
  class { '::mysql::install': }
  -> class { '::mysql::config': }
  ~> class { '::mysql::service': }
}
