#!/bin/sh

pipenv run ansible-playbook -i values/prod/hosts --extra-vars @values/prod/values.yml site.yml
