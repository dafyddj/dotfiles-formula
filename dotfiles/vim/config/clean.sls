# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import dotfiles with context %}

{%- set home_dir = dotfiles.home_dir ~ '/' ~ dotfiles.user %}

dotfiles-vim-config-clean-file-absent:
  file.absent:
    - name: {{ home_dir ~ '/' ~ dotfiles.vim.config }}
