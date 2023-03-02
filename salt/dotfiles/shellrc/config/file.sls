# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as dotfiles with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

dotfiles-shellrc-config-file-file-recurse:
  file.recurse:
    - name: {{ dotfiles.home_dir ~ '/' ~ dotfiles.shellrc.config_dir }}
    - source: salt://dotfiles/shellrc/config/files
    - file_mode: {{ dotfiles.mode }}
    - dir_mode: {{ dotfiles.dir_mode }}
    - user: {{ dotfiles.user }}
    - group: {{ dotfiles.group }}
    - template: jinja
    - context:
        dotfiles: {{ dotfiles | json }}

{%- for symlink in ['bashrc', 'bash_profile', 'zshrc', 'zlogin'] %}
dotfiles-shellrc-config-file-file-symlink-{{ symlink }}:
  file.symlink:
    - name: {{ dotfiles.home_dir ~ '/.' ~ symlink }}
    - target: .shellrc/{{ symlink }}
    - user: {{ dotfiles.user }}
    - group: {{ dotfiles.group }}
    - force: true
    - backupname: {{ symlink }}.old
{%- endfor %}
