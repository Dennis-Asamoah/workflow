cwlVersion: v1.2
class: Workflow

requirements:
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
  client:
    default:
      location: "http://tesk-api-node-1:8080/ga4gh/tes/"
    type:
      type: record
      fields:
        assetId:
          type: int?
        location:
          type: string

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
      client: client
      location:
        valueFrom: $(inputs.client.location)
      datasetId:
        valueFrom: $(inputs.client.assetId)
    out: [dataset]
    run: create_conditions.cwl
#  pullData:
#    in:
#      dataset: dataset
#    out: [dataset]
#    run: edc-pull-data-subworkflow.cwl
  getStats:
    hints:
      CentralStorageRequirement:
        centralStorage: true
    run: flareless-get-stats.cwl
    in:
      client: client
      location:
        valueFrom: $(inputs.client.location)
      data_files: pullData/dataset
    out: [ "logs" , "output_file" ]
