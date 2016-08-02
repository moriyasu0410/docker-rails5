require 'spec_helper'

describe docker_container('rails') do
  it { should exist }
  it { should be_running }
end

describe docker_image('dockerrails5_rails:latest') do
  it { should exist }
  its(['ContainerConfig.Env']) { should include 'RUBY_VERSION=2.3.1' }
  its(['ContainerConfig.ExposedPorts']) { include eq '3000/tcp' }
  its(['Architecture']) { should eq 'amd64' }
  its(['Os']) { should eq 'linux' }
end
