require 'spec_helper'

describe "jenkins::service" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

	it do
		should contain_service('jenkins').with({
			:ensure      => 'running',
	        :enable      => 'true',
	        :require     => 'Class[Jenkins::Config]',
		})
	end
end  