cwlVersion: v1.2
class: Workflow

inputs:
  datasetRequest:
    type: File

outputs:
  dataset:
    type: File
    outputSource: cleanData/cleanedFile

steps:
  pullData:
    in:
      datasetRequest: datasetRequest
    out: [datasetLocation]
    run: edc-pull-data.cwl

  cleanData:
    in:
      dataFile: pullData/datasetLocation
    out: [cleanedFile]
    run: clean-edc-data.cwl
