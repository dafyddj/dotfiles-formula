# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as dotfiles with context %}

{%- set home_dir = dotfiles.home_dir ~ '/' ~ dotfiles.user %}

{%- for shellrc_file in ['bashrc', 'bash_profile', 'zshrc', 'zlogin', 'shellrc'] %}
dotfiles-shellrc-config-clean-file-absent-{{ shellrc_file }}:
  file.absent:
    - name: {{ home_dir ~ '/.' ~ shellrc_file }}
{%- endfor -%}
