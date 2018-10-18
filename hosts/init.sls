{%- set hosts = {} %}
{% set pillar_only = salt['pillar.get']('hosts:only', {}) %}
{% for ip, hostnames in pillar_only.items() %}
{{ ip }}-host-entry:
  host.only:
    - name: {{ ip }}
  {% if hostnames is string %}
    - hostnames:
      - {{ hostnames }}
  {% else %}
    - hostnames: {{ hostnames | json }}
  {% endif %}
{% endfor %}
