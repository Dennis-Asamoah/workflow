cwlVersion: v1.2
class: Workflow

inputs:
  datasetRequest:
    type: File
  location:
    type: string

outputs:
  dataset:
    type: File
    outputSource: cleanData/cleanedFile

steps:
  pullData:
    in:
      datasetRequest: datasetRequest
      location: location
    out: [datasetLocation]
    run: edc-pull-data.cwl

  cleanData:
    in:
      dataFile: pullData/datasetLocation
      location: location
    out: [cleanedFile]
    run: clean-edc-data.cwl
