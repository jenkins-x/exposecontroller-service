#!/usr/bin/env bash

kubectl delete deploy exposecontroller-service
kubectl delete sa exposecontroller-service
kubectl delete rolebinding exposecontroller-service
kubectl delete role exposecontroller-service

kubectl get all | grep exposecontroller-service