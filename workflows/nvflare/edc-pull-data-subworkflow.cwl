cwlVersion: v1.2
class: Workflow

inputs:
  dataset:
    type: File


outputs:
  dataset:
    type: File
    outputSource: cleanData/cleanedFile

steps:
  pullData:
    in:
      dataset: dataset
    out: [datasetLocation]
    run: edc-pull-data.cwl

  cleanData:
    in:
      dataset: pullData/datasetLocation
    out: [cleanedFile]
    run: clean-edc-data.cwl
