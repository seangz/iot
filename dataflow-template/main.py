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


class TemplatedOptions(PipelineOptions):
    @classmethod
    def _add_argparse_args(cls, parser):
        parser.add_value_provider_argument(
            '--input',
            # required=True,
            # default='gs://adventures-on-gcp/sampe.csv',
            help='Path of the file to read from')


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
        'template_location': 'gs://{}/templates/csv2bq_template'.format(GCS_BUCKET),
        # 'requirements_file': 'requirements.txt',
        'save_main_session': True
    }

    if run_locally:
        pipeline_options['runner'] = 'DirectRunner'

    options = PipelineOptions.from_dictionary(pipeline_options)
    custom_options = options.view_as(TemplatedOptions)

    with beam.Pipeline(options=options) as p:
        (p | 'Reading input file' >> beam.io.ReadFromText(custom_options.input)
         | 'Converting from csv to dict' >> beam.ParDo(CSVtoDict(),
                                                       ['timestamp', 'location', 'product', 'condition', 'age',
                                                        'start_weight', 'end_weight'])
         | 'Write data to BigQuery' >> beam.io.WriteToBigQuery(project=PROJECT, dataset=BQ_DATESET,
                                                               table=BQ_OUTPUT_TABLE,
                                                               create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED,
                                                               write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND,
                                                               # write_disposition=beam.io.BigQueryDisposition.WRITE_TRUNCATE,
                                                               schema=BQ_OUTPUT_SCHEME
                                                               )
         )


if __name__ == '__main__':
    run_locally = False
    dataflow(run_locally)
