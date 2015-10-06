describe 'jenkins::job' do
	let :pre_condition do
		'class { "jenkins": }'
	end

	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

	let(:title) { 'test' }
	
	it { should contain_class('jenkins::params') }

	it do
		should contain_file('/var/lib/jenkins/jobs/test').with({
			:ensure  => 'directory',
			:mode    => '0755',
			:owner   => 'jenkins',
			:group   => 'jenkins',
			:subscribe => 'Class[Jenkins::Config]',	
		})
		should contain_file('/var/lib/jenkins/jobs/test/builds').with({
			:ensure  => 'directory',
			:mode    => '0755',
			:owner   => 'jenkins',
			:group   => 'jenkins',
		})
		should contain_file('/var/lib/jenkins/jobs/test/config.xml').with({
			:ensure  => 'file',
			:mode    => '0644',
			:owner   => 'jenkins',
			:group   => 'jenkins',
			:notify  => 'Class[Jenkins::Service]',
		})
	end
end