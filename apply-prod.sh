#!/bin/sh

pipenv run ansible-playbook -i env/prod/hosts -e @env/prod/values.yml site.yml
