# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import mapdata as dotfiles with context %}

include:
  - {{ sls_config_file }}

dotfiles-service-running-service-running:
  service.running:
    - name: {{ dotfiles.service.name }}
    - enable: True
    - require:
      - sls: {{ sls_config_file }}
