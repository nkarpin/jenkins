class jenkins::install {

	package {
    	'openjdk-7-jre':
        	ensure      => installed
	}

##wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
	apt::key { 'jenkinsci':
		id  =>  '0x9B7D32F2D50582E6',
  		source  => 'http://jenkins-ci.org/debian/jenkins-ci.org.key'
  	}
##sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  	apt::source { 'jenkinsci':
  		location => 'http://pkg.jenkins-ci.org/debian',
      release => 'binary/',
      require => Apt::Key['jenkinsci']
	}
}