class jenkins (

  $http_port = $jenkins::params::http_port,
  $service = $jenkins::params::service,
  $user   =  $jenkins::params::user 

) inherits jenkins::params {

	include jenkins::install
	include jenkins::service
	include jenkins::config
}