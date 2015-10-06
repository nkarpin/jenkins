require 'spec_helper'

describe "jenkins::install::java" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

	it do
		should contain_package('openjdk-7-jre').with({
			:ensure => 'installed',
		})
	end
end