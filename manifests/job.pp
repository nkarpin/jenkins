define jenkins::job ( 
	$description = 'created by puppet', 
	$disabled = 'false',
	$shell_builders = ['echo Hello World!!!', 'uptime']

) {

    include jenkins::params

    file {
        "${jenkins::params::home_path}/jenkins/jobs/${title}":
            ensure  => directory,
            mode    => '0755',
            owner   => 'jenkins',
            group   => 'jenkins',
            subscibe => Class['jenkins::service'];


        "${jenkins::params::home_path}/jenkins/jobs/${title}/builds":
            ensure  => directory,
            mode    => '0755',
            owner   => 'jenkins',
            group   => 'jenkins';

        "${jenkins::params::home_path}/jenkins/jobs/${title}/config.xml":
            ensure  => file,
            content => template('jenkins/job/job_default.erb'),
            mode    => '0644',
            owner   => 'jenkins',
            group   => 'jenkins',
            notify  => Class['jenkins::service'];
    }
}
