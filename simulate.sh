#!/usr/bin/env bash

python iot_simulator.py \
   --project_id=$PROJECT_ID \
   --cloud_region=$MY_REGION \
   --registry_id=iotlab-registry \
   --device_id=nj-facility-1 \
   --private_key_file=rsa_private.pem \
   --message_type=event \
   --algorithm=RS256 > nj-warehouse-1.txt 2>&1 &

python iot_simulator.py \
   --project_id=$PROJECT_ID \
   --cloud_region=$MY_REGION \
   --registry_id=iotlab-registry \
   --device_id=nj-facility-2 \
   --private_key_file=rsa_private.pem \
   --message_type=event \
   --algorithm=RS256 > nj-warehouse-2.txt 2>&1 &

   python iot_simulator.py \
      --project_id=$PROJECT_ID \
      --cloud_region=$MY_REGION \
      --registry_id=iotlab-registry \
      --device_id=nj-facility-2 \
      --private_key_file=rsa_private.pem \
      --message_type=event \
      --algorithm=RS256 > nj-warehouse-2.txt 2>&1 &
