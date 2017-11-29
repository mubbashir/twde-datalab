#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

sudo yum -y update

sudo yum -y install python36 python36-virtualenv python36-pip

sudo python36 -m pip install boto3
sudo python36 -m pip install pandas
sudo python36 -m pip install s3fs
sudo python36 -m pip install numpy

aws s3 cp s3://twde-datalab/%%JOBNAME%%/%%JOBNAME%%.py .

python36 %%JOBNAME%%.py