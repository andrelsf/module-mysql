class mysql::config(
  String $config_my_dir	= $mysql::config_my_dir,
  String $config_owner	= $mysql::config_owner,
  String $config_group	= $mysql::config_group,
  String $config_mode	= $mysql::config_mode,
  String $node_mysql_1	= $mysql::node_mysql_1,
  String $node_mysql_2	= $mysql::node_mysql_2,
  String $mysql_cmdline_left = $mysql::mysql_cmdline_left,
){
  if $node_mysql_1 == $::hostname {
    file { $config_my_dir:
      ensure	=> file,
      owner	=> $config_owner,
      group	=> $config_group,
      mode	=> $config_mode,
      content	=> template("$module_name/my.cnf.erb")
    }
  }elsif $node_mysql_2 == $::hostname {
    file { $config_my_dir:
      ensure	=> file,
      owner	=> $config_owner,
      group	=> $config_group,
      mode	=> $config_mode,
      content	=> template("$module_name/my.cnf.2.erb"),
      notify	=> Exec['mysqlcmdline'],
    }
    exec { 'mysqlcmdline':
      refreshonly => true,
      command	  => $mysql_cmdline_left,
    }
  } else {
    notify { 'info_node':
      message => "[Fail] Node not found."
    }
  }
}
