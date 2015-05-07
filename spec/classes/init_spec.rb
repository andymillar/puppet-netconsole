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
end
