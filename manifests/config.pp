class jenkins::config inherits jenkins {

  file {
    '/etc/default/jenkins':
    ensure  => file,
    content => template('jenkins/config/default.erb');
  }

  file {
  "${jenkins::home_path}/jenkins/jobs":
    ensure  => directory,
    mode    => '0755',
    owner   => 'jenkins';
  }
}