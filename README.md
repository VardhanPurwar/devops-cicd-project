# AWS CI/CD Pipeline Project

## Overview

This project demonstrates a complete CI/CD (Continuous Integration & Continuous Deployment) pipeline using AWS services to automatically deploy a Python Flask application on an EC2 instance.

Whenever code is pushed to GitHub, the pipeline is triggered and the application is deployed automatically without manual intervention.

## Tech Stack

- Python (Flask)
- AWS CodePipeline
- AWS CodeDeploy
- Amazon EC2
- GitHub

## Architecture Diagram
```
Developer 
    │ 
    ▼ 
GitHub Repository 
    │ 
    ▼ 
AWS CodePipeline 
    │ 
    ▼ 
AWS CodeDeploy 
    │ 
    ▼ 
Amazon EC2 
    │ 
    ▼
Flask Application
```

## Project Structure

```
├── app.py # Main Flask application 
├── requirements.txt # Python dependencies 
├── appspec.yml # CodeDeploy configuration file 
├── scripts/ # Deployment scripts 
│   ├── install.sh # Install dependencies 
│   ├── start.sh # Start application 
│   └── stop.sh # Stop running application
```

## Learning Outcomes
Through this project, I gained hands-on experience in:
- Designing and implementing a complete CI/CD pipeline using AWS services.
- Understanding how AWS CodePipeline automates build and deployment workflows.
- Working with AWS CodeDeploy lifecycle hooks and deployment strategies.
- Deploying and managing applications on Amazon EC2.
- 
