# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import dotfiles with context %}

dotfiles-service-clean-service-dead:
  service.dead:
    - name: {{ dotfiles.service.name }}
    - enable: False
