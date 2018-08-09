#!/usr/bin/env bash

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=nj-abc-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 > nj.txt 2>&1 &

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=nj-def-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=nj-ghi-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=pa-abc-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 > pa.txt 2>&1 &

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=pa-def-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=pa-ghi-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=ct-abc-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 > ct.txt 2>&1 &

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=ct-def-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=ct-ghi-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=ny-abc-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 > ny.txt 2>&1 &

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=ny-def-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 

python iot_simulator.py --project_id=iot-seang --cloud_region=us-central1 --registry_id=iot-seang --device_id=ny-ghi-1 --private_key_file=rsa_private.pem --message_type=event --algorithm=RS256 
