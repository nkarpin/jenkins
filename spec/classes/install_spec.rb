require 'spec_helper'

describe "jenkins::install" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

	it do
		should contain_class('jenkins::install::repo')
		should contain_class('jenkins::install::java')
		
		should contain_exec('apt-get update')
		
		should contain_package('jenkins').with({
			:ensure => 'installed',
		})
	end	
end  