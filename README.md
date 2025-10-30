# CI/CD Pipeline using Jenkins, Docker, and AWS EC2

## 📖 Overview
This project demonstrates an automated CI/CD pipeline that builds, pushes, and deploys a simple Python Flask application using Jenkins and Docker.

## ⚙️ Technologies
- Jenkins
- Docker
- AWS EC2
- Python (Flask)
- GitHub

## 🧩 Pipeline Stages
1. **Clone Repository** – Pulls code from GitHub.
2. **Build Docker Image** – Creates a container image.
3. **Push to DockerHub** – Publishes the image.
4. **Deploy to EC2** – Pulls and runs the container on AWS.

## 🚀 Run Locally
```bash
docker build -t flask-ci-cd .
docker run -p 5000:5000 flask-ci-cd
```

## Visit: 
```bash
http://localhost:5000
```

## Expected: Hello from CI/CD Pipeline via Jenkins and Docker !