class jenkins::install::repo {

	apt::key { 'jenkinsci':
		id  =>  '0x9B7D32F2D50582E6',
  		source  => 'http://jenkins-ci.org/debian/jenkins-ci.org.key'
  	}
##sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  	apt::source { 'jenkinsci':
  		location => 'http://pkg.jenkins-ci.org/debian',
      	release => 'binary/',
      	repos => '',
      	require => Apt::Key['jenkinsci']
	}


}