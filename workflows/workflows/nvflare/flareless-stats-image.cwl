cwlVersion: v1.2
class: Workflow

doc: Workflow to build figure from federated analysis 
requirements:
  MultipleInputFeatureRequirement: {}
  SubworkflowFeatureRequirement: {}
  ScatterFeatureRequirement: {}

inputs:
  datasets:
    type:
      type: array
      items:
        type: record
        fields:
          assetId: int?
          location: string


  # Graph parameters
  legend:
    type: boolean?
  title:
    type: string?
  displayNum:
    type: int?
  colors:
    type: string[]?
  labels:
    type: string[]?


outputs:
  logs:
    type: File
    outputSource:
      mergeStats/logs

  output_stats:
    type: File
    outputSource:
      mergeStats/output_file

  stats_image:
    type: File
    outputSource:
      build_image/pic

steps:
  subworkflow:
    in:
      client: datasets
    out: ["logs" , "output_file"]
    scatter: client
    run: flareless-node-subworkflow.cwl


  mergeStats:
    run: flareless-merge.cwl
    in:
      dataFiles: subworkflow/output_file
      logs: subworkflow/logs
    out: ["logs", "output_file"]

  build_image:
    run: nvflare-build-graph.cwl
    in:
      stats:
        source: mergeStats/output_file
      legend:
        source: legend
      title:
        source: title
      displayNum:
        source: displayNum
      colors:
        source: colors
      labels:
        source: labels
    out: ["pic"]

