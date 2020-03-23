#!/bin/sh

pipenv run ansible-playbook -i values/dev/hosts --extra-vars @values/dev/values.yml site.yml
