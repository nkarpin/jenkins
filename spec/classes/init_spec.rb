require 'spec_helper'

describe "jenkins" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }


	it do
		should contain_class('jenkins::install').only_with({
			:name   => 'Jenkins::Install',
			:notify => 'Class[Jenkins::Config]',
		})
		
		should contain_class('jenkins::config').only_with({
			:name   => 'Jenkins::Config',
			:notify => 'Class[Jenkins::Service]',
			})
		
		should contain_class('jenkins::service')
	end

end  