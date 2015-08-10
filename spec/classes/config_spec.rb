require 'spec_helper'
describe 'netconsole::config' do

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
    it { should contain_class('netconsole::config') }
    it { should contain_file('/etc/sysconfig/netconsole').with( {
      'ensure' => 'present',
      'mode'   => '0644',
      'owner'  => 'root',
      'group'  => 'root'
    } ) }
    it { should contain_file('/etc/sysconfig/netconsole').with_content(/^# LOCALPORT=6666$/) }
    it { should contain_file('/etc/sysconfig/netconsole').with_content(/^# DEV=$/) }
    it { should contain_file('/etc/sysconfig/netconsole').with_content(/^# SYSLOGADDR=$/) }
    it { should contain_file('/etc/sysconfig/netconsole').with_content(/^# SYSLOGPORT=514$/) }
    it { should contain_file('/etc/sysconfig/netconsole').with_content(/^# SYSLOGMACADDR=$/) }
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
      :localport     => '100',
      :dev           => 'dev',
      :syslogaddr    => 'syslogaddr',
      :syslogport    => '200',
      :syslogmacaddr => 'syslogmacaddr',
      :config_file   => '/tmp/config_file'
    } }

    it { should contain_class('netconsole::config') }
    it { should contain_file('/tmp/config_file').with( {
      'ensure' => 'present',
      'mode'   => '0644',
      'owner'  => 'root',
      'group'  => 'root'
    } ) }
    it { should contain_file('/tmp/config_file').with_content(/^LOCALPORT=100$/) }
    it { should contain_file('/tmp/config_file').with_content(/^DEV=dev$/) }
    it { should contain_file('/tmp/config_file').with_content(/^SYSLOGADDR=syslogaddr$/) }
    it { should contain_file('/tmp/config_file').with_content(/^SYSLOGPORT=200$/) }
    it { should contain_file('/tmp/config_file').with_content(/^SYSLOGMACADDR=syslogmacaddr$/) }
  end


end
