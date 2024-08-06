#!/bin/bash
#Author:Akshat mishra
#date:2Aug24
#version: v1
#this script  will report aws resource usage

#AWS s3
#aws ec2
#aws lambda
#aws Iam user

set -x

#list s3 buckets 
echo "print list of s3 buckets "
aws s3 ls 

#list ec2 insctances
echo "print list of ec2 instances "
aws ec2 describe-instances | jq '.Reservations.[].Instances[].InstanceId'
#list lambda 
echo "list of lambda functions "
 aws lambda list-functions

