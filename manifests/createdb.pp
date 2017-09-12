class mysql::createdb(
  Array[String] $mysql_cmdline = $mysql::mysql_cmdline,
){
  exec { 'mysqlcmdline':
    command	=> $mysql_cmdline,
  }
}
