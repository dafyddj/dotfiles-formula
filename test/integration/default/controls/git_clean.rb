# frozen_string_literal: true

control 'dotfiles-git-clean' do
  title 'Git configuration files should NOT be installed'

  describe file('/home/kitchen/.config/git/config') do
    it { should_not exist }
  end
end
