require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('nginx') do
	it { should be_installed }
end

describe service('nginx') do
	it { should be_running }
	it { should be_enabled }
end

describe port(80) do
	it { should be_listening }
end

describe file('/etc/nginx/sites-available/default') do
  it { should exist }
end

describe package('nodejs') do
	it { should be_installed }
end

describe package('pm2') do
	it { should be_installed.by('nodejs::nodejs_from_package') }
end

# describe package('npm') do
# 	it { should be_installed }
# end

describe command('node -v') do
	its (:stdout) { should match /6\.10\.0/ }
end

describe command('git --version') do
	its (:stdout) { should match /2\.7\.4/ }
end


