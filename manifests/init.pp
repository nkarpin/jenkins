class jenkins  (

  $http_port = $jenkins::params::http_port,
  $service = $jenkins::params::service,
  $user   =  $jenkins::params::user

) inherits jenkins::params {

	include jenkins::install
	include jenkins::config
	include jenkins::service


	Class['jenkins::install'] ~> Class['jenkins::config'] ~> Class['jenkins::service']

}