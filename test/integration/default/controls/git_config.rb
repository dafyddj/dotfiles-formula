# frozen_string_literal: true

control 'dotfiles-git-config' do
  title 'Git configuration should match desired lines'

  describe file('/home/kitchen/.gitconfig') do
    it { should be_file }
    it { should be_owned_by 'kitchen' }
    it { should be_grouped_into 'kitchen' }
    its('mode') { should cmp '0644' }
    its('content') do
      should include(
        'email = you@example.com'
      )
    end
    its('content') do
      should include(
        'st = status'
      )
    end
  end
end
