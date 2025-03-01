--------------------------------------------------------------------------------
# pyenv

# install
```
https://github.com/pyenv/pyenv
curl https://pyenv.run | bash
```

## add to .bashrc
```
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

## uninstall
```
rm -rf ~/.pyenv
```

## update
```
pyenv update
```

## manage python environments
```
pyenv install --list
pyenv install {version}
pyenv versions
python --version
pyenv uninstall {version}
```

## set environment
```
pyenv global {version}
pyenv local {version}
pyenv shell {version}
```

## fix issues
```
pyenv rehash
```

--------------------------------------------------------------------------------
# virtual environment

## setup
```
python -m venv env
```

## use custom prompt prefix to differentiate projects
```
python -m venv --prompt project-name env
```

## activate virtual environment
```
source env/bin/activate
```

## deactivate virtual environment
```
deactivate
```

## uninstall virtual environment
```
rm -rf env
```

--------------------------------------------------------------------------------
# pip

```
pip install -r requirements.txt
pip install FooBar==1.2.3
pip freeze > requirements.txt
```

## pip-tools
https://github.com/jazzband/pip-tools

```
pip-compile requirements.in
pip-sync
```

--------------------------------------------------------------------------------
# pipx - global packages
https://pypi.org/project/pipx/

## install
```
pip install pipx
pipx ensurepath
pipx completions
```

## uninstall
```
pip uninstall pipx
pip uninstall argcomplete
```

## add to .bashrc
```
eval "$(register-python-argcomplete pipx)"
```

## manage packages
```
pipx list
pipx install {package}
pipx uninstall {package}
```

--------------------------------------------------------------------------------
# cookiecutter - project templates
https://cookiecutter.readthedocs.io/

## install
```
pip install cookiecutter
```

## usage
```
cookiecutter {package}
cookiecutter gh:{github repo}
```

## custom template
[tutorial](https://cookiecutter.readthedocs.io/en/1.7.2/tutorial2.html)
[talkpython](https://training.talkpython.fm/courses/explore_cookiecutter_course/using-and-mastering-cookiecutter-templates-for-project-creation)

--------------------------------------------------------------------------------
# poetry
https://python-poetry.org/

## install
```
pip install poetry
```

## usage
```
poetry new foobar-demo
poetry add pytest
poetry install
poetry run django-admin startproject foobarsite
```

## publish package
```
poetry build
poetry publish
```

--------------------------------------------------------------------------------
# black
https://black.readthedocs.io/en/stable/

## install
```
pip install black
```

## usage
```
black {file|directory}
black . --check --verbose --diff --color
```

--------------------------------------------------------------------------------
# pylint
https://www.pylint.org/

## install
```
pip install pylint
```

## usage
```
pylint {file|directory}
```

--------------------------------------------------------------------------------
# flake8
https://flake8.pycqa.org/en/latest/

## install
```
pip install flake8
```

## usage 
```
flake8 {file|directory}
flake8 --extend-ignore=E203 --max-line-length=100 .
flake8 --extend-ignore=E203,E501,W503 --max-line-length=100 .
flake8 --disable-noqa
flake8 --statistics
```

--------------------------------------------------------------------------------
# mypy - static type checker
http://mypy-lang.org/

## install
```
pip install mypy
```

--------------------------------------------------------------------------------
# bandit - security issues
https://pypi.org/project/bandit/

## install
```
pip install bandit
```

## usage
```
bandit -r {directory}
bandit examples/*.py -n 3 -lll
bandit examples/*.py -p ShellInjection
```

--------------------------------------------------------------------------------
# vulture - dead code
https://pypi.org/project/vulture/

## install
```
pip install vulture
```

## usage
```
vulture {file|directory}
vulture {file|directory} --min-confidence 100
vulture {directory} --make-whitelist > whitelist.py
```

--------------------------------------------------------------------------------
# ipython
https://ipython.org/
[Sebastian Witowski - Wait, IPython can do that?!](https://www.youtube.com/watch?v=3i6db5zX3Rw)

## install
```
pip install ipython
```

## config
```
ipython locate profile
ipython profile create {profilename}
```

--------------------------------------------------------------------------------
# pytest
https://docs.pytest.org/

## install
```
pip install pytest
```

## usage
```
pytest {file|directory}
pytest test_foo.py::test_bar
```

## run tests that match expression
```
pytest -k {expression}
pytest -k "not {expression}"
```

## run test that match `@pytest.mark.type`
```
pytest -m type
pytest -m "not type"

@pytest.mark.usefixtures
@pytest.mark.filterwarnings
@pytest.mark.skip
@pytest.mark.skipif
@pytest.mark.xfail
@pytest.mark.parametrize
```

## stop running on first failure;  or start up pdb
```
pytest -x
pytest --pdb
```

## re-run failing tests; or run failed tests first than others
```
pytest --lf
pytest --ff
```

## check documentation is out of date
```python
"""
blah blah
>>> add(1, 2)
4
"""
```
```
pytest --doctest-modules {file|directory}
```
