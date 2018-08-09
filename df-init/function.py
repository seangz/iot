import os
import time
import logging

from googleapiclient.discovery import build
import google.auth


def init_df(event, context):
    """Triggered by a change to a Cloud Storage bucket.
    Args:
         event (dict): Event payload.
         context (google.cloud.functions.Context): Metadata for the event.
    """
    credentials, _project = google.auth.default()
    service = build('dataflow', 'v1b3', credentials=credentials,cache_discovery=False)

    PROJECT = 'iot-seang'
    BUCKET = 'function-sg'
    TEMPLATE = 'csv2bq_template'
    GCSPATH = "gs://{bucket}/templates/{template}".format(bucket=BUCKET, template=TEMPLATE)
    JOBNAME = 'df_functions_{}'.format(int(time.time()))
    filename = event['name']
    input_bucket = event['bucket']
    full_path = os.path.join(input_bucket, filename)
    logging.info(full_path)
    BODY = {
        "jobName": "{jobname}".format(jobname=JOBNAME),
        "parameters": {
            "input": "gs://{}".format(full_path),
        },
        "environment": {
            "tempLocation": "gs://{bucket}/temp".format(bucket=BUCKET),
        }
    }

    request = service.projects().templates().launch(projectId=PROJECT, gcsPath=GCSPATH, body=BODY)
    response = request.execute()

    logging.info(response)
