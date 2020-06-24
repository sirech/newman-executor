require_relative 'spec_helper'

describe 'Container' do
  describe file('/etc/alpine-release') do
    its(:content) { is_expected.to match(/3.11/) }
  end

  describe 'node' do
    describe command('node -v') do
      its(:stdout) { is_expected.to match(/13.6/) }
    end
  end

  [
    '/bin/bash',
    '/usr/bin/envsubst',
    '/usr/local/bin/newman',
    '/usr/bin/git'
  ].each do |executable|
    describe file(executable) do
      it { is_expected.to be_file }
      it { is_expected.to be_executable }
    end
  end
end
