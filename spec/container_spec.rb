require_relative 'spec_helper'

describe 'Container' do
  describe file('/etc/alpine-release') do
    its(:content) { is_expected.to match(/3.9/) }
  end

  describe 'node' do
    describe command('node -v') do
      its(:stdout) { is_expected.to match(/12.6/) }
    end
  end

  describe file('/usr/local/bin/newman') do
    it { is_expected.to be_file }
    it { is_expected.to be_executable }
  end
end
