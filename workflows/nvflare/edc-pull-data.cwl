cwlVersion: v1.2
class: CommandLineTool

requirements:
  WorkReuse:
    enableReuse: false
  DockerRequirement:
    dockerPull: localhost:5000/edc-client

inputs:
  datasetRequest:
    type: File
    inputBinding:
      position: 1

outputs:
  datasetLocation:
    type: File
    outputBinding:
      glob: output.txt

baseCommand: ["/app/edc_client.sh"]