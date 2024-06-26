
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
#   But line 4 is commented-out in table_utils.py!

# 3. Most dependency import are unsuccessful (e.g. in table_utils.py, import "pandas" cannot be resolved)

# 4. Running tests: 
    # 4.1. "json.normalize" not defined, which led to lots of breakdown (e.g. test_table_utils.py line 20)
    # 4.2. reading "master.yaml" file generates failure
    
#     @pytest.fixture # macro to set up a fixture that will be used in other functions.
#     def menu():
#         d = config.yaml("tests/data/cfg.yaml")
#         conf = config.Config(**d)
    
#         #if sys.platform == 'darwin':
#         #    file_name = 'master_osx.yaml'
#         #else:
#         #    file_name = 'master_linux.yaml'
    
#         file_name = 'master.yaml'
#         master = read_yaml(os.path.join(conf.git_local, file_name))
# >       menu = get_full_menu(master)

# tests/test_table_utils.py:18: 
# _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

# master = {'mnist': {'levels': {'other': [{'commands': ['wget -nv http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz', ...'accession': {'genbank': None, 'refseq': None}, 'category': 'genomics', 'common_name': 'mouse', 'custom': False, ...}}}

#     def get_full_menu(master):
#         """Reads yaml file and converts to a table format"""
    
#         #json normalize data (to expand dict to table)
# >       df = json_normalize(master).T.reset_index()
# E       NameError: name 'json_normalize' is not defined

# refchef/table_utils.py:20: NameError

