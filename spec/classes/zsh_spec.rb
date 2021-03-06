require 'spec_helper'

describe 'zsh' do
  let(:facts) do 
    {
      :luser      => 'wfarr',
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_package('zsh').with({
      :ensure => 'present'
    })

    should contain_file_line('add zsh to /etc/shells').with({
      :path    => '/etc/shells',
      :line    => "#{facts[:boxen_home]}/homebrew/bin/zsh",
      :require => 'Package[zsh]'
    })

    should contain_osx_chsh('wfarr').with({
      :shell   => "#{facts[:boxen_home]}/homebrew/bin/zsh",
      :require => 'File_line[add zsh to /etc/shells]'
    })
  end

  context "ensure is latest" do
    let(:params) {
      { :ensure => "latest" }
    }
    it { should contain_package('zsh').with({
      :ensure => 'latest'
    }) }
  end
end
