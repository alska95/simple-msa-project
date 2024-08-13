#!/bin/bash

COMMAND=$1

# Docker Swarm 파일의 경로를 입력합니다.
SERVICE_FILE_PATH=docker-swarm-simple-service.yml
STACK_NAME=base-stack

# 명령에 따라 동작을 수행합니다.
case $COMMAND in
  "start")
    # Docker Swarm에서 서비스를 시작합니다.
    echo "Deploying all services to the stack..."
    docker-compose -f $SERVICE_FILE_PATH build
    docker-compose -f $SERVICE_FILE_PATH push
    docker stack deploy -c $SERVICE_FILE_PATH $STACK_NAME
    ;;
  "stop")
    # 전체 스택을 중지합니다.
    echo "Removing all services from the stack..."
    docker stack rm $STACK_NAME
    ;;
  *)
    echo "Invalid command. Please use 'start', or 'stop'."
    ;;
esac
