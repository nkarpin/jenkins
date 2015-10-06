require 'spec_helper'

describe "jenkins::install" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

	it do
		should contain_class('jenkins::install::repo').with({
			:notify => 'Exec[apt-get update]',
		})
		
		should contain_exec('apt-get update').with({
			:command     => '/usr/bin/apt-get update',
	  		:refreshonly => 'true',			
			:notify => 'Class[Jenkins::Install::Java]',
		})

		should contain_class('jenkins::install::java').with({
			:notify => 'Package[jenkins]',
		})

		should contain_package('jenkins').with({
			:ensure => 'installed',
		})
	end	
end  