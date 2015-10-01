define jenkins::job ( 
	$dir_name = $title, 
	$description = 'created by puppet', 
	$disabled = 'false',
	$shell_builders=['echo Hello World!!!']
) {
    file {

        "/var/lib/jenkins/jobs/${dir_name}":
            ensure  => directory,
            mode    => '0755',
            owner   => 'jenkins',
            group   => 'jenkins';

        "/var/lib/jenkins/jobs/${dir_name}/builds":
            ensure  => directory,
            mode    => '0755',
            owner   => 'jenkins',
            group   => 'jenkins';

        "/var/lib/jenkins/jobs/${dir_name}/config.xml":
            ensure  => file,
            content => template('jenkins/job/job_default.erb'),
            mode    => '0644',
            owner   => 'jenkins',
            group   => 'jenkins';
    }
}
