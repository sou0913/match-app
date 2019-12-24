[
  {
    "name": "unicorn-container",
    "image": "486463126616.dkr.ecr.ap-northeast-1.amazonaws.com/sample-image:unicorn-latest",
    "cpu": 333,
    "memoryReservation": 600,
    "essential": true,
    "portMappings": [
      {
        "hostPort": 3000,
        "protocol": "tcp",
        "containerPort": 3000
      }
    ],
    "command": ["unicorn", "-c", "/app/config/unicorn.rb"],
    "environment": [
      {
        "name": "RAILS_ENV",
        "value": "production"
      }
    ],
    "secrets": [
      {
        "name": "DB_HOST",
        "valueFrom": "DB_HOST"
      },
      {
        "name": "DB_USER",
        "valueFrom": "DB_USER"
      },
      {
        "name": "DB_PASSWORD",
        "valueFrom": "DB_PASSWORD"
      },
      {
        "name": "RACK_ENV",
        "valueFrom": "RACK_ENV"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sample-service",
        "awslogs-region": "ap-northeast-1",
        "awslogs-stream-prefix": "unicorn"
      }
    }
  },
  {
    "name": "nginx-container",
    "image": "486463126616.dkr.ecr.ap-northeast-1.amazonaws.com/sample-image:nginx-latest",
    "cpu": 333,
    "memoryReservation": 600,
    "essential": true,
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": 80
      }
    ],
    "command": ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sample-service",
        "awslogs-region": "ap-northeast-1",
        "awslogs-stream-prefix": "nginx"
      }
    }
  }
]