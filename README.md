Got it! Here's the revised `README.md` reflecting the volume setup within the MongoDB StatefulSet:

---

# Flask Application and MongoDB Deployment on Minikube

## Overview

This guide details the steps to deploy a Python Flask application connected to MongoDB on a Minikube Kubernetes cluster. It covers application setup, Docker image building, Kubernetes deployment, and scaling.

## 1. **Application Setup**

- **Create Flask Application:**
  - Implement endpoints:
    - `/`: Returns "Welcome to the Flask app! The current time is: <Date and Time>"
    - `/data`: Supports POST requests to insert data into MongoDB and GET requests to retrieve data.
  - Ensure the application is prepared for deployment with at least 2 replicas.

## 2. **Build Docker Image**

- **Build the Docker Image:**
  - Use the Dockerfile to create an image for the Flask application.

  ```bash
  docker build -t ravishankar119/flask-mongo-app:latest .
  ```

- **Push the Docker Image to Docker Hub:**

  ```bash
  docker push ravishankar119/flask-mongo-app:latest
  ```

## 3. **Kubernetes Setup**

- **Start Minikube:**

  ```bash
  minikube start
  ```

## 4. **Pod Deployment**

- **Flask Application Deployment:**
  - Create a Deployment with at least 2 replicas.

  ```bash
  kubectl apply -f flask-deployment.yaml
  ```

- **MongoDB StatefulSet:**
  - Deploy MongoDB as a StatefulSet with authentication enabled and configure Persistent Volumes and Claims within the StatefulSet.

  ```bash
  kubectl apply -f mongo-statefulset.yaml
  ```

## 5. **Services**

- **Service for Flask:**
  - Create a NodePort Service to expose the Flask application.

  ```bash
  kubectl apply -f flask-service.yaml
  ```

- **Service for MongoDB:**
  - Create a ClusterIP Service to allow internal communication with MongoDB.

  ```bash
  kubectl apply -f mongo-service.yaml
  ```

## 6. **Autoscaling**

- **Horizontal Pod Autoscaler (HPA):**
  - Set up HPA for the Flask application to scale based on CPU usage.

  ```bash
  kubectl apply -f hpa.yaml
  ```

## 7. **DNS Resolution**

- **Explanation:**
  - Kubernetes handles DNS resolution for inter-pod communication through its internal DNS service. Services are accessible by their names within the cluster. The Flask application connects to MongoDB using the MongoDB service name.

## 8. **Resource Management**

- **Resource Requests and Limits:**
  - Configure resource requests and limits for Flask and MongoDB pods.

  ```yaml
  resources:
    requests:
      memory: "250Mi"
      cpu: "0.2"
    limits:
      memory: "500Mi"
      cpu: "0.5"
  ```

## Summary

This guide provides a step-by-step approach to deploying a Flask application with MongoDB on Minikube. It includes setting up the application, building and pushing the Docker image, configuring Kubernetes deployments, and managing resources.

---
