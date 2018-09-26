# Brown CBC's RefChef Manual

### Requirements

PyYAML::

	pip install pyyaml

### Syntax

RefChef will have two operating modes, 'local' and 'remote', each corresponding to one type of location the Master YAML is stored.  At the moment, only 'local' is implemented.

RefChef's local mode currenly has two arguments, one required and one optional::

	--master: REQUIRED - denotes the Master YAML file containing one or more references

	--new: OPTIONAL - denotes the New YAML file containing one or more references to be added to Master

	-e --execute: OPTIONAL - determines whether the YAML (New if it exists, Master if not) should be run

An example RefChef local command is::

	python newparser.py local --master master.yaml --new new.yaml --execute


### Notes

--execute changes its behavior based on the presence or absence of --new; if both --master and --new are passed as arguments, then the --new YAML will be executed.  If there is no --new and only a --master (which is always required), the --master will be executed instead.

Fine-grained control of the execution of these files is managed within the YAMLs themselves using the 'retrieve' option as described on the `Usage page <https://compbiocore.github.io/refchef/usage>`_.