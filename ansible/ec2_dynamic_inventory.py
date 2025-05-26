#!/usr/bin/env python3
import boto3
import json
import os
def get_ec2_instances():
    #please complete the function to fetch ec2 instances from aws.
    # it should contain two arguments --list and --host
    # # --list should return all instances in json format
    # # --host should return the details of a specific instance in json format.