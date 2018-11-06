import pytest
import os
import subprocess
import yaml
from collections import OrderedDict, defaultdict
import yamlloader

from refchef.references import *
from refchef.utils import *

def test_references():
	data = ordered_load(open("tests/data/test_master.yaml"))
	rootDirectory = "tests/data/"
	referenceKeys = list(data.keys())
	run = referenceHandler(errorBehavior = False)
	for k in range(0, len(referenceKeys)):
		run.processEntry(rootDirectory, data.get(referenceKeys[k]))
	assert os.path.isfile("tests/data/ucsc_mm9_chr1/primary/final_checksums.md5")


def test_new_append():
	f1 = "tests/data/test_master.yaml"
	f2 = "tests/data/example.yml"
	new_append(f1,f2)
