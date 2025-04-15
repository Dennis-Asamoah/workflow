cwlVersion: v1.2
class: CommandLineTool

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.location)

requirements:
  WorkReuse:
    enableReuse: false
  DockerRequirement:
    dockerPull: localhost:5000/edc-client

inputs:
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
