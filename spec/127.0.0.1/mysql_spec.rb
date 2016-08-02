require 'spec_helper'

describe docker_container('mysql') do
  it { should exist }
  it { should be_running }
end

describe docker_image('mysql:5.6.32') do
  it { should exist }
  its(['ContainerConfig.Env']) { should include 'MYSQL_VERSION=5.6.32-1debian8' }
  its(['ContainerConfig.ExposedPorts']) { include eq '3306/tcp' }
  its(['Architecture']) { should eq 'amd64' }
  its(['Os']) { should eq 'linux' }
end
