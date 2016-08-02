require 'spec_helper'

describe docker_container('nginx') do
  it { should exist }
  it { should be_running }
end

describe docker_image('dockerrails5_nginx:latest') do
  it { should exist }
  its(['ContainerConfig.Env']) { should include 'NGINX_VERSION=1.10.1-1~jessie' }
  its(['ContainerConfig.ExposedPorts']) { include eq '443/tcp' }
  its(['ContainerConfig.ExposedPorts']) { include eq '80/tcp' }
  its(['Architecture']) { should eq 'amd64' }
  its(['Os']) { should eq 'linux' }
end
