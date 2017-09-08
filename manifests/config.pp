class mysql::config(
  String $config_my_dir	= $mysql::config_my_dir,
  String $config_owner	= $mysql::config_owner,
  String $config_group	= $mysql::config_group,
  String $config_mode	= $mysql::config_mode,
){
  file { $config_my_dir:
    ensure	=> file,
    owner	=> $config_owner,
    group	=> $config_group,
    mode	=> $config_mode,
    content	=> template("$module_name/my.cnf.erb")
  }
}
