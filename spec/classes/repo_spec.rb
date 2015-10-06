require 'spec_helper'

describe "jenkins::install::repo" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

	it do
		should contain_apt_key('jenkinsci').with({
			:id  =>  '0x9B7D32F2D50582E6',
			:source  => 'http://jenkins-ci.org/debian/jenkins-ci.org.key',
		})

		should contain_apt__source('jenkinsci').with({
			:location => 'http://pkg.jenkins-ci.org/debian',
			:release => 'binary/',
			:repos => '',
			:require => 'Apt::Key[jenkinsci]',
		})
	end
end
