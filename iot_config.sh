#!/usr/bin/env bash

gcloud beta iot devices create nj-facility-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iotlab-registry \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create nj-facility-2 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iotlab-registry \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create nj-facility-3 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iotlab-registry \
  --public-key path=rsa_cert.pem,type=rs256
