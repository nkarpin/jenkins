define jenkins::job ( 
	$dir_name = $title, 
	$description = 'created by puppet', 
	$disabled = 'false',
	$shell_builders=['echo Hello World!!!']
) {
	file {

	    '${dir_name}':
	        ensure  => directory,
	        path    => '/var/lib/jenkins/jobs/',
	        mode    => '0755',
	        owner   => 'jenkins',
	        group   => 'jenkins';

	    'builds':
	        ensure  => directory,
	        path    => '/var/lib/jenkins/jobs/',
	        mode    => '0755',
	        owner   => 'jenkins',
	        group   => 'jenkins';
	    
	    'config.xml':
	        ensure  => file,
	        path    => '/var/lib/jenkins/jobs/${dir_name}',
	        content => template('jenkins/job/job_default.erb'),
	        mode    => '0644',
	        owner   => 'jenkins',
	        group   => 'jenkins';
	}

}
