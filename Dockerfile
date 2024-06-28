
FROM python:3.8.19
COPY . /app/
WORKDIR /app

# Copied all the dependencies listed in setup.py in the requirement.txt file
# Setting up dependencies turns out successful
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install git+https://github.com/compbiocore/refchef.git

CMD ["python", "/refchef/__init__.py"]


# 1. Running tests: 
    # 1.1. "json.normalize" not defined, which led to lots of breakdown (e.g. test_table_utils.py line 20)
    # 2.2. reading "master.yaml" file generates failure
    
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

