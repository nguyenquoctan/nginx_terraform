# Build and Deploy Nginx to show dynamic content while building

## Requirements

Terraform
Pre-commit tools requirements
Docker
Minikube

## Usage

Running script nginx_setup.sh

## Notice

 * If you want to run the build stack manually, you have to change the docker provider host to minikube IP/Port
 * Better html output on http://{minikube_ip}:32100

### Options
1) Build and Deploy : Build docker image, store in minikube images then deploy on minikubes
2) Build only : Build docker image only
3) Deploy only : Deploy the image
4) Destroy build image : Destroy build images
5) Destroy deployment : Destroy deployment config
6) Destroy ALL : Destroy build and deployment config
7) Quit