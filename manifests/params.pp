class mysql::params {
  $install_repo_file	= "mysql.repo"
  $packages_mysql	= ['mysql-community-server', 'mysql-community-client', 'mysql-community-common', 'mysql-community-libs']

  $config_my_dir 	= '/etc/my.cnf' 
  $config_owner  	= 'root'
  $config_group  	= 'root'
  $config_mode   	= '0644'

  $service_name	       	= 'mysqld' 
  $service_ensure       = 'running'
  $service_enable       = true
  $service_hasstatus    = true
  $service_hasrestart   = true

}
