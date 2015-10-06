require 'spec_helper'

describe "jenkins" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }


	it do
		should contain_class('jenkins::install').with({
			:notify => 'Class[Jenkins::Config]',
			})
		
		should contain_class('jenkins::config').with({
			:notify => 'Class[Jenkins::Service]',
			})
		
		should contain_class('jenkins::service')
	end

end  