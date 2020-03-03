# frozen_string_literal: true

control 'dotfiles-vim-config' do
  title 'Vim configuration should match desired lines'

  describe file('/home/kitchen/.vimrc') do
    it { should be_file }
    it { should be_owned_by 'kitchen' }
    it { should be_grouped_into 'kitchen' }
    its('mode') { should cmp '0644' }
    its('content') do
      should include(
        'set nocompatible'
      )
    end
  end
end
