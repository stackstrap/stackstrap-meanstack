#
# Your StackStrap project specific states
#

include:
  - avahi
  - mongodb
  - nginx
  - nvmnode
  - supervisor

{% from "utils/users.sls" import skeleton -%}
{% from "nginx/macros.sls" import nginxsite -%}
{% from "supervisor/macros.sls" import supervise -%}

{% set short_name = pillar['project']['short_name'] -%}
{% set home = "/home/vagrant" -%}
{% set virtualenv = home + "/virtualenv" -%}
{% set project = home + "/domains/" + short_name -%}
{% set app_user = "vagrant" -%}
{% set app_group = "vagrant" -%}

{{ skeleton(app_user, 1000, 1000, remove_groups=False) }}

{{ nginxsite(short_name, app_user, app_group,
             template="salt://nginx/files/proxy-upstream.conf",
             server_name="_",
             create_root=False,
             defaults={
              'port': 3000,
              'try_files': 'try_files $uri @upstream'
             })
}}

{{ supervise(short_name, home, app_user, app_group, {
        "meanstack": {
            "command": "/home/vagrant/.nvm/v"+pillar["node_version"]+"/bin/node server 2>&1",
            "directory": project
        }
    }) 
}}

# vim: set ft=yaml et sw=2 ts=2 sts=2 :
