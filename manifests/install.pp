class jenkins::install {

	include jenkins::install::repo
	include jenkins::install::java  

	exec {
		'apt-get update':
			command     => '/usr/bin/apt-get update',
	  		refreshonly => true
	}

	package { 
		'jenkins':
	  		ensure      => installed,
	  		require     => Exec['apt-get update']      
	}

	Class['jenkins::install::repo'] -> Class['jenkins::install::java'] -> Package['jenkins']

}