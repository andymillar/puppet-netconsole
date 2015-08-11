require 'spec_helper'
describe 'netconsole::install' do

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
    it { should contain_class('netconsole::install') }
    it { should contain_package('initscripts') }
  end

  context 'with settings for all parameters' do
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
      :package_list => 'foo',
    } }

    it { should contain_class('netconsole::install') }
    it { should contain_package('foo') }

  end


end
