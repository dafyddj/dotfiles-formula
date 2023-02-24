# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import dotfiles with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

dotfiles-git-config-file-file-managed:
  file.managed:
    - name: {{ dotfiles.git.config }}
    - source: {{ files_switch(['config','config.jinja'],
                              lookup='dotfiles-git-config-file-file-managed',
                              use_subpath=True
                 )
              }}
    - mode: 644
    - user: {{ dotfiles.user }}
    - group: {{ dotfiles.group }}
    - makedirs: True
    - template: jinja
    - context:
        dotfiles: {{ dotfiles | json }}
