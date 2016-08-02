require 'spec_helper'

describe docker_container('datastore') do
  it { should exist }
end

describe docker_image('dockerrails5_datastore:latest') do
  it { should exist }
  its(['ContainerConfig.Volumes']) { should include '/data' }
  its(['ContainerConfig.Volumes']) { should include '/myapp/log' }
  its(['ContainerConfig.Volumes']) { should include '/myapp/public' }
  its(['ContainerConfig.Volumes']) { should include '/var/lib/mysql' }
  its(['ContainerConfig.Volumes']) { should include '/var/log/nginx' }
  its(['Architecture']) { should eq 'amd64' }
  its(['Os']) { should eq 'linux' }
end
