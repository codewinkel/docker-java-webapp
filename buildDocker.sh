#!/bin/sh

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SERVIVE_VERSION=$1
SERVICE_NAME=$2

# copy content for docker build
pushd ${SCRIPT_DIR}
if [ ${PWD##*/} = 'docker' ]; then # in docker folder because we will rm something
    rm -rvf content/*.jar
    cp -av ../../target/${SERVICE_NAME}*.jar files/
fi
popd

DOCKER_REGISTRY=localhost:5000
DOCKER_IMAGE_NAME=${SERVICE_NAME}
DOCKER_IMAGE="${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}"
DOCKER_IMAGE_VERSIONED="${DOCKER_IMAGE}:${SERVIVE_VERSION}"

echo "Building docker image '${DOCKER_IMAGE_VERSIONED}'..."
docker build --rm=true --tag="${DOCKER_IMAGE_VERSIONED}" ${SCRIPT_DIR}

# TODO push in docker registry
# echo "Push image in registry..."
# docker push "${DOCKER_IMAGE}:latest"
# if [ ! -z ${VERSION} ]; then
#  echo "Re-tagging and pushing image as '${VERSION}'..."
#  docker tag  "${DOCKER_IMAGE}":latest "${DOCKER_IMAGE}":${VERSION}
#  docker push "${DOCKER_IMAGE}":${VERSION}
#  docker rmi  "${DOCKER_IMAGE}":${VERSION}
#fi
echo "Done."
