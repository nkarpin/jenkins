require 'spec_helper'

describe "jenkins::init" do
  it { should create_class('jenkins::install')}
  it { should create_class('jenkins::config')}
  it { should create_class('jenkins::service')}
end
