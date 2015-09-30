class jenkins (

  $port = $jenkins::params::port,
  $service = $jenkins::params::service,
  $user   =  $jenkins::params::user 

) inherits jenkins::params {

	include jenkins::install
	include jenkins::service
	include jenkins::config
}