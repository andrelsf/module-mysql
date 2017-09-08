class mysql::install(
  String $install_repo_file	= $mysql::install_repo_file,
  Array[String] $packages_mysql = $mysql::packages_mysql, 
){
  file { $install_repo_file: 
    ensure	=> directory,
    recurse	=> true,
    content	=> "puppet:///module/mysql/repos/mysql.repo",
    notify	=> Package[$packages_mysql],
  }

  package { $packages_mysql:
    ensure	=> present,
  }  
}
