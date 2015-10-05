require 'spec_helper'

describe "jenkins::config" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }
  	it { should contain_file('/etc/default/jenkins') }
	#it { should contain_file("${jenkins::home_path}/jenkins/jobs") }


end  