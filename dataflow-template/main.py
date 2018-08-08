import csv
import time

import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions

GCS_BUCKET = 'function-sg'
PROJECT = 'iot-seang'
JOB_NAME = 'gcstobq'

BQ_DATESET = 'iot_seang'
BQ_OUTPUT_TABLE = 'product_quality'
BQ_OUTPUT_SCHEME = 'timestamp:STRING,location:STRING,product:STRING,condition:STRING,age:INTEGER,start_weight:INTEGER,end_weight:INTEGER'


class CSVtoDict(beam.DoFn):
    """Converts line into dictionary"""

    def process(self, element, headers):
        rec = ""
        element = element.encode('utf-8')
        try:
            for line in csv.reader([element]):
                rec = line

            if len(rec) == len(headers):
                data = {header.strip(): val.strip() for header, val in zip(headers, rec)}
                return [data]
            else:
                print "bad: {}".format(rec)
        except Exception:
            pass


def dataflow(run_locally=False):
    pipeline_options = {
        'project': PROJECT,
        'staging_location': 'gs://' + GCS_BUCKET + '/staging',
        'runner': 'DataflowRunner',
        # 'runner': 'DirectRunner',
        # 'setup_file': './setup.py',
        'job_name': '{}-{}'.format(JOB_NAME, int(time.time())),
        'max_num_workers': 0,
        # 'num_workers': 15,
        'disk_size_gb': 60,
        'temp_location': 'gs://' + GCS_BUCKET + '/temp',
        # 'requirements_file': 'requirements.txt',
        # 'save_main_session': True
    }

    if run_locally:
        input_file_path = 'sample.csv'
    else:
        input_file_path = 'gs://{BUCKET}/csv_dump/sample.csv'.format(BUCKET=GCS_BUCKET)

    if run_locally:
        pipeline_options['runner'] = 'DirectRunner'

    options = PipelineOptions.from_dictionary(pipeline_options)
    p = beam.Pipeline(options=options)

    with beam.Pipeline(options=options) as p:
        (p | 'Reading input file' >> beam.io.ReadFromText(input_file_path)
         | 'Converting from csv to dict' >> beam.ParDo(CSVtoDict(),
                                                       ['timestamp', 'location', 'product', 'condition', 'age',
                                                        'start_weight', 'end_weight'])
         | 'Write data to BigQuery' >> beam.io.WriteToBigQuery(project=PROJECT, dataset=BQ_DATESET,
                                                               table=BQ_OUTPUT_TABLE,
                                                               create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED,
                                                               write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
                                                               #write_disposition=beam.io.BigQueryDisposition.WRITE_TRUNCATE,
                                                               schema=BQ_OUTPUT_SCHEME
                                                               )
         )


if __name__ == '__main__':
    run_locally = False
    dataflow(run_locally)
