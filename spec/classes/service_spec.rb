require 'spec_helper'
describe 'netconsole::service' do

  context 'with defaults for all parameters' do
    let (:facts){
      {
        :puppetversion          => ENV['PUPPET_VERSION'],
        :facterversion          => ENV['FACTER_VERSION'],
        :osfamily               => 'redhat',
        :operatingsystem        => 'centos',
        :operatingsystemrelease => '6.6',
        :concat_basedir         => '/dnf',
      }
    }
    it { should contain_class('netconsole::service') }
    it { should contain_service('netconsole') }
    it { should contain_service('netconsole').with( {
      'enable' => 'true',
      'ensure' => 'running',
    } ) }
  end

  context 'with settings for service_name parameters' do
    let (:facts){
      {
        :puppetversion          => ENV['PUPPET_VERSION'],
        :facterversion          => ENV['FACTER_VERSION'],
        :osfamily               => 'redhat',
        :operatingsystem        => 'centos',
        :operatingsystemrelease => '6.6',
        :concat_basedir         => '/dnf',
      }
    }
    let(:params) { { 
      :service_name   => 'foo'
    } }

    it { should contain_class('netconsole::service') }
    it { should contain_service('foo') }
  end

  context 'with settings with enabled service parameters' do
    let (:facts){
      {
        :puppetversion          => ENV['PUPPET_VERSION'],
        :facterversion          => ENV['FACTER_VERSION'],
        :osfamily               => 'redhat',
        :operatingsystem        => 'centos',
        :operatingsystemrelease => '6.6',
        :concat_basedir         => '/dnf',
      }
    }
    let(:params) { { 
      :enable   => 'true'
    } }

    it { should contain_class('netconsole::service') }
    it { should contain_service('netconsole') }
    it { should contain_service('netconsole').with( {
      'enable' => 'true',
      'ensure' => 'running',
    } ) }

  end

  context 'with settings with disabled service parameters' do
    let (:facts){
      {
        :puppetversion          => ENV['PUPPET_VERSION'],
        :facterversion          => ENV['FACTER_VERSION'],
        :osfamily               => 'redhat',
        :operatingsystem        => 'centos',
        :operatingsystemrelease => '6.6',
        :concat_basedir         => '/dnf',
      }
    }
    let(:params) { { 
      :enable   => 'false'
    } }

    it { should contain_class('netconsole::service') }
    it { should contain_service('netconsole') }
    it { should contain_service('netconsole').with( {
      'enable' => 'false',
      'ensure' => 'stopped',
    } ) }

  end


end
