class mysql::params {
  $install_repo_file	= "/etc/yum.repos.d/mysql.repo"
  $packages_mysql	= ['mysql-community-server', 'mysql-community-client', 'mysql-community-common', 'mysql-community-libs', 'mysql-community-release']

  $config_my_dir = '/etc/my.cnf' 
  $config_owner  = 'root'
  $config_group  = 'root'
  $config_mode   = '0644'
}
