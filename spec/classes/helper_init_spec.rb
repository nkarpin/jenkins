require 'spec_helper'

describe "jenkins" do
  let(:facts) { { :lsbdistid => 'Ubuntu', :osfamily => 'Debian', :lsbdistcodename => 'trusty', :puppetversion   => Puppet.version} }

  it { should contain_class('jenkins::install') }
  it { should contain_class('jenkins::config') }
  it { should contain_class('jenkins::service') }

end  