#!/usr/bin/env bash

#Manager
ssh -i "polis_key.pem" ubuntu@ec2-18-191-130-115.us-east-2.compute.amazonaws.com
ssh -i "polis_key.pem" ubuntu@ec2-18-191-130-115.us-east-2.compute.amazonaws.com

#Worker
ssh -i "polis_key.pem" ubuntu@ec2-52-14-237-98.us-east-2.compute.amazonaws.com
ssh -i "polis_key.pem" ubuntu@ec2-18-218-65-186.us-east-2.compute.amazonaws.com
ssh -i "polis_key.pem" ubuntu@ec2-52-15-75-8.us-east-2.compute.amazonaws.com

ssh -i "polis_key.pem" ubuntu@ec2-13-59-64-43.us-east-2.compute.amazonaws.com

