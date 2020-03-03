# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import dotfiles with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{%- set home_dir = dotfiles.home_dir ~ '/' ~ dotfiles.user %}

dotfiles-vim-config-file-file-managed:
  file.managed:
    - name: {{ home_dir ~ '/' ~ dotfiles.vim.config }}
    - source: {{ files_switch(['vimrc'],
                              lookup='dotfiles-vim-config-file-file-managed',
                              use_subpath=True
                 )
              }}
    - mode: {{ dotfiles.mode }}
    - user: {{ dotfiles.user }}
    - group: {{ dotfiles.group }}
    - makedirs: true
    - template: jinja
    - context:
        dotfiles: {{ dotfiles | json }}
