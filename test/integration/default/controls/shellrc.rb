# frozen_string_literal: true

control 'dotfiles-shellrc-setup' do
  title 'Shellrc files should be installed and setup correctly'

  describe os_env('VAGRANT_HOME') do
    its('content') { should cmp '/home/kitchen/.vagrant.d' }
  end

  describe file('/home/kitchen/.shellrc') do
    it { should be_directory }
    its('mode') { should cmp '0755' }
  end

  describe file('/home/kitchen/.shellrc/rc.d/vagrant.sh') do
    it { should be_file }
    it { should be_owned_by 'kitchen' }
    it { should be_grouped_into 'kitchen' }
    its('mode') { should cmp '0644' }
    its('content') do
      should include(
        'export VAGRANT_HOME='
      )
    end
  end

  %w[bashrc bash_profile zshrc zlogin].each do |symlink|
    describe file("/home/kitchen/.#{symlink}") do
      it { should be_symlink }
      it { should be_owned_by 'kitchen' }
      it { should be_grouped_into 'kitchen' }
    end

    describe file(file("/home/kitchen/.#{symlink}").shallow_link_path) do
      it { should be_file }
    end
  end
end
