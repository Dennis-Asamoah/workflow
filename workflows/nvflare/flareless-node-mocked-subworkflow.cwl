cwlVersion: v1.2
class: Workflow

requirements:
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.datasetRequest.location)

inputs:
  datasetRequest:
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
      client: datasetRequest
      datasetId:
        valueFrom: $(inputs.client.assetId)
    out: [dataset]
    run: create_conditions.cwl

  getStats:
    hints:
      CentralStorageRequirement:
        centralStorage: true
    run: flareless-get-stats.cwl
    in:
      data_files: pullData/dataset
    out: [ "logs" , "output_file" ]
