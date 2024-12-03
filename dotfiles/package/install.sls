# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as dotfiles with context %}

dotfiles-package-install-pkg-installed:
  pkg.installed:
    - name: {{ dotfiles.pkg.name }}
