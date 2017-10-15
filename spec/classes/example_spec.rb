require 'spec_helper'

describe 'harden' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "harden class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('harden::params') }
          it { is_expected.to contain_class('harden::install').that_comes_before('harden::config') }
          it { is_expected.to contain_class('harden::config') }
          it { is_expected.to contain_class('harden::service').that_subscribes_to('harden::config') }

          it { is_expected.to contain_service('harden') }
          it { is_expected.to contain_package('harden').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'harden class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('harden') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
