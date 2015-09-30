class jenkins::install {

  include jenkins::install::repo
  include jenkins::install::java  

  package { 
    'jenkins':
          ensure      => installed,
          require     => Exec['apt-get update']      
  }

  Class['jenkins::install::repo'] -> Class['jenkins::install::java'] -> Package['jenkins']

}