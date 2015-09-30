class jenkins::config (

  $http_port = $jenkins::params::http_port,
  $service = $jenkins::params::service,
  $user   =  $jenkins::params::user 

) inherits jenkins::params {

	file { '/etc/default/jenkins':
  		ensure  => file,
  		content => template('jenkins/config/default.erb')
  	}	
}