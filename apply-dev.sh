#!/bin/sh

pipenv run ansible-playbook -i env/dev/hosts -e @env/dev/values.yml site.yml
