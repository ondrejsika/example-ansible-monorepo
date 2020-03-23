#!/bin/sh

pipenv run ansible-playbook -i env/dev/hosts --extra-vars @env/dev/values.yml site.yml
