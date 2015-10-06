class jenkins (

  # install
  
  $gpg_key_id = $jenkins::params::gpg_key_id,
  $gpg_key_source = $jenkins::params::gpg_key_source,
  $pkg_location = $jenkins::params::pkg_location,
  $pkg_release = $jenkins::params::pkg_release,
  $pkg_repo = $jenkins::params::pkg_repo,
  $java = $jenkins::params::java,

  # config

  $http_port = $jenkins::params::http_port,
  $service = $jenkins::params::service,
  $user = $jenkins::params::user,
  $home_path = $jenkins::params::home_path

  ) inherits jenkins::params {

  include jenkins::install
  include jenkins::config
  include jenkins::service

  Class['Jenkins::Install'] ~> Class['Jenkins::Config'] ~> Class['Jenkins::Service']

}
