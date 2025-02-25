#!/usr/bin/env bash

HELM=${HELM:-helm}
VERSION=${VERSION:-2.0.0-rc1}
"$HELM" pull oci://quay.io/skupper/helm/network-observer --version "$VERSION"

operator-sdk init \
	--plugins helm \
	--domain skupper.io \
	--group observability \
	--version v2alpha1 \
	--kind NetworkObserver \
	--helm-chart "network-observer-${VERSION}.tgz";
