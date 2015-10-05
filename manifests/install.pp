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
	}

	Class['Jenkins::Install::Repo'] ~> Exec['Apt-get Update'] ~> Class['Jenkins::Install::Java'] ~> Package['Jenkins']

}