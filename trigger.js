const {google} = require('googleapis');
const project = "iot-seang"

exports.launchDataflowTemplate = (req, res) => {
    let result;
    google.auth.getApplicationDefault(function(err, authClient, projectId) {
            if (err) {
                throw err;
            }
            if (authClient.createScopedRequired && authClient.createScopedRequired()) {
                authClient = authClient.createScoped([
                    'https://www.googleapis.com/auth/cloud-platform',
                    'https://www.googleapis.com/auth/compute',
                    'https://www.googleapis.com/auth/compute.readonly',
                    'https://www.googleapis.com/auth/userinfo.email'
                ]);
            }
            var dataflow = google.dataflow({
                version: "v1b3",
                auth: authClient
            });

            var launchParams = {
                "javascriptTextTransformFunctionName": "iot-seang-data",
                "inputFilePattern": "gs://function-sg/csv_dump/sample.csv",
                "JSONPath": "gs://function-sg/gstobqfunction.json"
                "javascriptTextTransformGcsPath": "gs://function-sg/js-udf/transform.js"
                "outputTable": "iot-seang:iot_seang.prod_quality"
                "bigQueryLoadingTemporaryDirectory": "gs://function-sg/tmp"

            };

            var env = {
               "tempLocation": "gs://function-sg/temp",
               "zone": "us-central1-f"
            }


            var opts = {
                projectId: project,
                gcsPath: "gs://dataflow-templates/latest/GCS_Text_to_BigQuery",
                resource: {
                    parameters: launchParams,
                    environment: env
                }
            };

            dataflow.projects.templates.launch(opts, (err, result) => {
                if (err) {
                    throw err;
                }
                res.send(result.data);
            });
    });
};