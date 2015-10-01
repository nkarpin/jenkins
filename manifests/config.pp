class jenkins::config inherits jenkins {

	file { '/etc/default/jenkins':
  		ensure  => file,
  		content => template('jenkins/config/default.erb')
  	}	
}