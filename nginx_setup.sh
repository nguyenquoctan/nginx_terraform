#!/bin/bash

# check minikube status
function check_minikube {
	if command -v minikube >/dev/null 2>&1; then
		bin_path=$(command -v minikube)
		if [ "$(${bin_path} status | grep -c Running)" -gt 0 ]; then
			echo "Minikube is ready"
		else
			echo "ERROR: Minikube is not started yet"
			exit 1
		fi
	else
		echo "ERROR: Could not find minikube command"
		exit 1
	fi
}

function build_nginx {
	# Go to build stack
	cd ./stacks/build || echo "Could not find build directory" || exit 1
	# Using local minikube docker images
	mini_ip=$1
	docker_host='unix:///var/run/docker.sock'
	minikube_host="tcp://${minikube_ip}:2376"
	sed -i "s|$docker_host|$minikube_host|g" provider.tf
	# Running terraform
	terraform init
	terraform plan -out tfplan
	echo "Do you want to apply the change above? Please 1 for yes and 2 for no"
	select answer in yes no; do
		case $answer in
		"yes")
			terraform apply "tfplan"
			break
			;;
		"no")
			echo "Cancelled"
			break
			;;
		*)
			echo "invalid option"
			break
			;;
		esac
	done
	rm -rf tfplan
	# Point provider host back to local docker socket
	sed -i "s|$minikube_host|$docker_host|g" provider.tf
	# Back to script dir
	cd ../../ || echo "Could not find build directory" || exit 1
}

function deploy_nginx {
	# Go to deploy stack
	cd ./stacks/deploy || echo "Could not find build directory" || exit 1
	# Running terraform
	terraform init
	terraform plan -out tfplan
	echo "Do you want to apply the change above? Please 1 for yes and 2 for no"
	select answer in yes no; do
		case $answer in
		"yes")
			terraform apply "tfplan"
			break
			;;
		"no")
			echo "Cancelled"
			break
			;;
		*)
			echo "invalid option"
			break
			;;
		esac
	done
	rm -rf tfplan
	# Back to script dir
	cd ../../ || echo "Could not find build directory" || exit 1
}

function destroy_build_nginx {
	# Go to build stack
	cd ./stacks/build || echo "Could not find build directory" || exit 1
	# Using local minikube docker images
	mini_ip=$1
	docker_host='unix:///var/run/docker.sock'
	minikube_host="tcp://${minikube_ip}:2376"
	sed -i "s|$docker_host|$minikube_host|g" provider.tf
	# Running terraform
	terraform init
	terraform plan -destroy -out tfplan
	echo "Do you want to apply the change above? This is DESTROY PLAN ! Please 1 for yes and 2 for no"
	select answer in yes no; do
		case $answer in
		"yes")
			terraform apply "tfplan"
			break
			;;
		"no")
			echo "Cancelled"
			break
			;;
		*)
			echo "invalid option"
			break
			;;
		esac
	done
	rm -rf tfplan
	# Point provider host back to local docker socket
	sed -i "s|$minikube_host|$docker_host|g" provider.tf
	# Back to script dir
	cd ../../ || echo "Could not find build directory" || exit 1
}

function destroy_deploy_nginx {
	# Go to deploy stack
	cd ./stacks/deploy || echo "Could not find build directory" || exit 1
	# Running terraform
	terraform init
	terraform plan -destroy -out tfplan
	echo "Do you want to apply the change above? This is DESTROY PLAN ! Please 1 for yes and 2 for no"
	select answer in yes no; do
		case $answer in
		"yes")
			terraform apply "tfplan"
			break
			;;
		"no")
			echo "Cancelled"
			break
			;;
		*)
			echo "invalid option"
			break
			;;
		esac
	done
	rm -rf tfplan
	# Back to script dir
	cd ../../ || echo "Could not find build directory" || exit 1
}

function test_url {
	mini_ip=$1
	status_code=$(curl -s -o /dev/null -w "%{http_code}" http://"${mini_ip}":32100)
	if [ "${status_code}" == 200 ]; then
		curl -s http://"${mini_ip}":32100
	else
		echo "The URL is not working with return code ${status_code}"
		exit 1
	fi
}

check_minikube
minikube_ip=$(minikube ip)

echo "Please choose the action bellow by number"
options=("Build and Deploy" "Build only" "Deploy only" "Destroy build image" "Destroy deployment" "Destroy ALL" "Quit")
select opt in "${options[@]}"; do
	case $opt in
	"Build and Deploy")
		build_nginx "${minikube_ip}"
		deploy_nginx
		echo "Waiting for service ready ....."
		sleep 30s
		test_url "${minikube_ip}"
		break
		;;
	"Build only")
		build_nginx "${minikube_ip}"
		break
		;;
	"Deploy only")
		deploy_nginx
		echo "Waiting for service ready ....."
		sleep 30s
		test_url "${minikube_ip}"
		break
		;;
	"Destroy build image")
		destroy_build_nginx "${minikube_ip}"
		break
		;;
	"Destroy deployment")
		destroy_deploy_nginx
		break
		;;
	"Destroy ALL")
		destroy_deploy_nginx
		destroy_build_nginx "${minikube_ip}"
		break
		;;
	"Quit")
		echo "Thank you for using this script"
		exit 0
		break
		;;
	*)
		echo "invalid option"
		break
		;;
	esac
done
