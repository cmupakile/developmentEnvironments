#
# Cookbook:: node-server
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'node-server::default' do #decribes all of the tests that should be ran when you run node server default
  context 'When all attributes are default, on an Ubuntu 16.04' do #packages groups of test together
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe) #just loks at all the actions your taking
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should install nginx' do
      expect(chef_run).to install_package 'nginx'
    end

    it 'enables the nginx service' do
      expect(chef_run).to enable_service 'nginx'
    end

    it 'starts the nginx service' do
      expect(chef_run).to start_service 'nginx'
    end

    it 'creates a template' do
    expect(chef_run).to create_template('/etc/nginx/sites-available/default')
    end


    it 'checks the reload' do
      template = chef_run.template('/etc/nginx/sites-available/default')
        expect(template).to notify('service[nginx]').to(:reload) 
    end

  it 'includes the `nodejs` recipe' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
  end

   it 'includes the `pm2` recipe' do
    expect(chef_run).to include_recipe('nodejs')
  end

   it 'includes the `npm` recipe' do
    expect(chef_run).to include_recipe('nodejs::npm')
  end

  it 'includes the `git` recipe' do
    expect(chef_run).to include_recipe('git')
  end

  end
end
