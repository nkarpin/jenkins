require 'spec_helper'

describe "jenkins::install" do
	let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

	it { should contain_class('jenkins::install::repo') }
	it { should contain_class('jenkins::install::java') }

	it { should contain_exec('apt-get update') }
	it { should contain_package('jenkins') }


end  