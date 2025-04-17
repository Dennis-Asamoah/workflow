cwlVersion: v1.2
class: CommandLineTool

requirements:
  WorkReuse:
    enableReuse: false
  DockerRequirement:
    dockerPull: localhost:5000/edc-client

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.location)

inputs:
  datasetRequest:
    type: File
    inputBinding:
      position: 1
  location:
    type: string

outputs:
  datasetLocation:
    type: File
    outputBinding:
      glob: output.txt

baseCommand: ["/app/edc_client.sh"]
