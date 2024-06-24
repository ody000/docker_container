
FROM python:3.8.19
COPY . /app/
WORKDIR /app

# Copied all the dependencies listed in setup.py in the requirement.txt file
# Setting up dependencies turns out successful
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install refchef

# Question: what should I fill into the second argument?
CMD ["python", "/refchef/__init__.py"]

# Other issues
# 1. cannot run "docker build -t <name>" at the terminal when in the docker_container folder. 
#    Instead can only use "docker buildx build ." as the command.

# 2. When running "refchef-cook -h" at root (ERROR):
    # Traceback (most recent call last):
    #     File "/usr/local/bin/refchef-menu", line 12, in <module>
    #       from refchef.table_utils import *
    #     File "/usr/local/lib/python3.8/site-packages/refchef/table_utils.py", line 4, in <module>
    #       from pandas.io.json import json_normalize
    #   ImportError: cannot import name 'json_normalize' from 'pandas.io.json' (/usr/local/lib/python3.8/site-packages/pandas/io/json/__init__.py)
#   What I interpret is that refchef-cook tries to open table_utils.py, which tries to import pandas and its json_normalize,
#   But the json package is not avaliable. Guess it's due to version problems?

# 3. Cannot run "python3 setup.py test" in terminal as 
