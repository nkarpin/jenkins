class jenkins::install::repo inherits jenkins {

  apt::key { 'jenkinsci':
    id       => $jenkins::gpg_key_id,
    source   => $jenkins::gpg_key_source;
  }

##sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  apt::source { 'jenkinsci':
    location => $jenkins::pkg_location,
    release  => $jenkins::pkg_release,
    repos    => $jenkins::pkg_repo,
    require  => Apt::Key['jenkinsci'];
  }
}