class jenkins::config {

	file { '/etc/default/jenkins':
  		ensure  => file,
  		content => template('config/default.erb')
  	}	
}