class mysql::params {
  $install_repo_file	= "/etc/yum.repos.d/mysql.repo"
  $packages_mysql	= ['mysql-community-server', 'mysql-community-client', 'mysql-community-common', 'mysql-community-libs', 'mysql-community-release']
}
