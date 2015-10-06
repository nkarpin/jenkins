require 'spec_helper'

describe "jenkins::config" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

    it do 
  		should contain_file('/etc/default/jenkins').with({
  			:ensure  => 'file',
  		})

  		should contain_file('/var/lib/jenkins/jobs').with({
			:ensure  => 'directory',
			:mode    => '0755',
			:owner   => 'jenkins',
  		})
  	end
end  