# frozen_string_literal: true

control 'dotfiles-shellrc-clean' do
  title 'Shellrc files should NOT be installed'

  %w[bashrc bash_profile zshrc zlogin shellrc].each do |shellrc_file|
    describe file("/home/kitchen/.#{shellrc_file}") do
      it { should_not exist }
    end
  end
end
