class mysql::install(
  String $install_repo_file	= $mysql::install_repo_file,
  Array[String] $packages_mysql = $mysql::packages_mysql, 
){
  file { "/etc/yum.repos.d/${install_repo_file}": 
    ensure	=> file,
    content	=> template("$module_name/mysql.repo.erb"),
    notify	=> Exec['update'],
  }

  exec { 'update':
    refreshonly	=> true,
    command	=> "/usr/bin/yum update -y",
  } 

  package { $packages_mysql:
    ensure	=> installed,
  }  
}
