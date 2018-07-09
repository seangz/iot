#!/usr/bin/env bash

export PROJECT_ID=iot-seang
export MY_REGION=us-central1

gcloud beta iot devices create nj-facility-1 \
  --project=$PROJECT_ID \
  --region=$MY_REGION \
  --registry=iotlab-registry \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create nj-facility-2 \
  --project=$PROJECT_ID \
  --region=$MY_REGION \
  --registry=iotlab-registry \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create ny-facility-1 \
  --project=$PROJECT_ID \
  --region=$MY_REGION \
  --registry=iotlab-registry \
  --public-key path=rsa_cert.pem,type=rs256
