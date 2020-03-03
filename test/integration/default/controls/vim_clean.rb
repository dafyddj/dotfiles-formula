# frozen_string_literal: true

control 'dotfiles-vim-clean' do
  title 'Vim configuration files should NOT be installed'

  describe file('/home/kitchen/.vimrc') do
    it { should_not exist }
  end
end
