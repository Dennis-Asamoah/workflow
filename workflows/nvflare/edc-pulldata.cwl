#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.2

doc: "Pulling data from EDC"

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.location)

requirements:
  WorkReuse:
    enableReuse: false
  DockerRequirement:
    dockerPull: localhost:5000/edc-client

inputs:
  location:
    type: string
  dataset:
    type: File
    inputBinding:
      position: 1

outputs:
  datasetLocation:
    type: File
    outputBinding:
      glob: output.txt

baseCommand: ["/app/edc_client.sh"]
