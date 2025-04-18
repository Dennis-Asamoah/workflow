cwlVersion: v1.2
class: CommandLineTool

requirements:
  WorkReuse:
    enableReuse: false
  DockerRequirement:
    dockerPull: gitlab.lcsb.uni.lu:4567/luca.bolzani/iderha-test-deployment/edc-client

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