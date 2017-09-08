class mysql::service(
  String $service_name	 	= $mysql::service_name,
  String $service_ensure 	= $mysql::service_ensure,
  Boolean $service_enable 	= $mysql::service_enable,
  Boolean $service_hasstatus 	= $mysql::service_hasstatus,
  Boolean $service_hasrestart 	= $mysql::service_hasrestart,
){
  service { $service_name:
    ensure	=> $service_ensure,
    enable	=> $service_enable,
    name	=> $service_name,
    hasstatus	=> $service_hasstatus,
    hasrestart	=> $service_hasrestart,
  }
}
