require_relative 'spec_helper'

describe 'Container' do
  describe file('/etc/alpine-release') do
    its(:content) { is_expected.to match(/3.17/) }
  end

  describe 'node' do
    describe command('node -v') do
      its(:stdout) { is_expected.to match(/19.3/) }
    end
  end

  [
    '/bin/bash',
    '/usr/bin/envsubst',
    '/usr/local/bin/newman',
    '/usr/bin/git',
    '/usr/bin/ssh',
    '/usr/bin/jq'
  ].each do |executable|
    describe file(executable) do
      it { is_expected.to be_file }
      it { is_expected.to be_executable }
    end
  end
end
