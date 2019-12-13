#!/bin/bash

VERSION="version-1"

docker build -t "ozlevka/amazon-deploy:$VERSION" .
docker push "ozlevka/amazon-deploy:$VERSION"

cd application
docker build -t "ozlevka/test-imb-app:$VERSION" .
docker push "ozlevka/test-imb-app:$VERSION"