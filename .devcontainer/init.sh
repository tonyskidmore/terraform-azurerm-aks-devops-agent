#!/bin/bash

owner=$(stat -c '%U' "$HOME/.pre-commit")

if [[ "$owner" == "root" ]]
then
  sudo chown vscode:vscode "$HOME/.pre-commit"
  pre-commit install
  pre-commit install-hooks
  terrascan init
fi

pip install --upgrade pip
pip install --upgrade setuptools
pip install -r ../tests/requirements.txt
