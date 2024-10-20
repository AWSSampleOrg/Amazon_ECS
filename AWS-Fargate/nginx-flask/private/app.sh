#!/usr/bin/env bash
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text --profile default)
AWS_REGION=$(aws configure get region --profile default)
APPLICATION_IMAGE_NAME="app:latest"
WEB_IMAGE_NAME="web:latest"

SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-0}) && pwd)
cd ${SOURCE_DIR}

case "$1" in
"build")
    cd ${SOURCE_DIR}/Fargate/app && docker image build --platform linux/amd64 -t ${APPLICATION_IMAGE_NAME} .
    cd ${SOURCE_DIR}/Fargate/web && docker image build --platform linux/amd64 -t ${WEB_IMAGE_NAME} .
    ;;
"exec") docker container exec -it $2 sh ;;
"login") aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com ;;
"push")
    docker image push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/app
    docker image push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/web
    ;;
"rmi") docker image ls -aq | xargs docker image rm -f ;;
"tag")
    docker image tag ${APPLICATION_IMAGE_NAME} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/app
    docker image tag ${WEB_IMAGE_NAME} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/web
    ;;
*) echo "pass me args" ;;
esac
