#!/usr/bin/env bash

gcloud beta iot devices create nj-abc-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create nj-def-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256


gcloud beta iot devices create nj-ghi-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create pa-abc-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create pa-def-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create pa-ghi-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256


gcloud beta iot devices create ct-abc-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create ct-def-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create ct-ghi-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create ny-abc-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create ny-def-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256

gcloud beta iot devices create ny-ghi-1 \
  --project=iot-seang \
  --region=us-central1 \
  --registry=iot-seang \
  --public-key path=rsa_cert.pem,type=rs256