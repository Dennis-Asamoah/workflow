cwlVersion: v1.2
class: Workflow

requirements:
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
  datasetRequest:
    type: File

outputs:
  logs:
    type: File
    outputSource: [getStats/logs]
  output_file:
    type: File
    outputSource: [getStats/output_file]

steps:
  pullData:
    in:
      datasetRequest: datasetRequest
    out: [dataset]
    run: edc-pull-data-subworkflow.cwl

  getStats:
    hints:
      CentralStorageRequirement:
        centralStorage: true
    run: flareless-get-stats.cwl
    in:
      data_files: pullData/dataset
    out: [ "logs" , "output_file" ]
