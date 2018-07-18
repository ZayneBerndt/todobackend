#!/bin/bash
# Activate virtual environment
. /appenv/bin/activate 
# Install test.sh arguments
pip install -r requirments_test.txt
# Run test.sh arguments
exec $@



