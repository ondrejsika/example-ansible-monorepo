#!/bin/sh

pipenv run ansible-playbook -i env/prod/hosts --extra-vars @env/prod/values.yml site.yml
