class jenkins::params {
    
	$gpg_key_id = '0x9B7D32F2D50582E6'
	$gpg_key_source = 'http://jenkins-ci.org/debian/jenkins-ci.org.key'
	$pkg_location = 'http://pkg.jenkins-ci.org/debian'
	$pkg_release = 'binary/'
	$pkg_repo=''
	$java = 'openjdk-7-jre'
	$http_port  = '8080'
	$service = 'jenkins'
	$user = 'jenkins'
	$home_path = '/var/lib'

}