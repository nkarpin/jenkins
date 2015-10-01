class jenkins::install::java inherits jenkins {
  
  package {
    $jenkins::java:
		ensure      => installed,
		require     => Exec['apt-get update']
  }

}