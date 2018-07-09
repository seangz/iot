#!/usr/bin/env bash

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iotlab-registry --device_id=nj-facility-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 > nj-facility-1.txt 2>&1 &

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iotlab-registry --device_id=nj-facility-2 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 > nj-facility-2.txt 2>&1 &

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iotlab-registry --device_id=nj-facility-3 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 > nj-facility-3.txt 2>&1 &
