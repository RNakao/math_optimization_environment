#!/bin/bash

# http://cvxopt.org/install/index.html
git clone https://github.com/DrTimothyAldenDavis/SuiteSparse.git
pushd SuiteSparse
git checkout v5.6.0
popd
export CVXOPT_SUITESPARSE_SRC_DIR=$(pwd)/SuiteSparse
git clone https://github.com/cvxopt/cvxopt.git
cd cvxopt
git checkout `git describe --abbrev=0 --tags`
export CVXOPT_BUILD_DSDP=1    # optional
export CVXOPT_BUILD_FFTW=1    # optional
export CVXOPT_BUILD_GLPK=1    # optional
export CVXOPT_BUILD_GSL=1     # optional
python setup.py install
cd ..
