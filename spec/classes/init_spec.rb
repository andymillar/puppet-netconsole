require 'spec_helper'
describe 'netconsole' do

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
    it { should contain_class('netconsole') }
  end

  context 'should fail with a sane warning on !RedHat' do
    let (:facts){
      {
        :puppetversion          => ENV['PUPPET_VERSION'],
        :facterversion          => ENV['FACTER_VERSION'],
        :osfamily               => 'debian',
        :operatingsystem        => 'debian',
        :operatingsystemrelease => '1',
        :concat_basedir         => '/dnf',
      }
    }

    it do
      expect {
        should compile
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /This module only supports RedHat/)
    end
  end

  context 'too low localport' do
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

    let(:params) { { :localport => 0 } }
    it do
      expect {
        should compile
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /Expected 0 to be greater or equal to 1/)
    end
  end

  context 'too high localport' do
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

    let(:params) { { :localport => 100000 } }
    it do
      expect {
        should compile
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /Expected 100000 to be smaller or equal to 65535/)
    end
  end

  context 'valid localport' do
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

    let(:params) { { :localport => 512 } }

    it { should contain_class('netconsole') }
  end


  context 'too low syslogport' do
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

    let(:params) { { :syslogport => 0 } }
    it do
      expect {
        should compile
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /Expected 0 to be greater or equal to 1/)
    end
  end

  context 'too high syslogport' do
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

    let(:params) { { :syslogport => 100000 } }
    it do
      expect {
        should compile
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /Expected 100000 to be smaller or equal to 65535/)
    end
  end

  context 'valid syslogport' do
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

    let(:params) { { :syslogport => 512 } }

    it { should contain_class('netconsole') }
  end

  context 'valid dev' do
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

    let(:params) { { :dev => "em1" } }

    it { should contain_class('netconsole') }
  end

  context 'valid syslogaddr' do
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

    let(:params) { { :syslogaddr => "syslog.example.com" } }

    it { should contain_class('netconsole') }
  end

  context 'valid syslogmacaddr' do
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

    let(:params) { { :syslogmacaddr => "10:10:10:10:10:10" } }

    it { should contain_class('netconsole') }
  end


end
