cwlVersion: v1.2
class: CommandLineTool

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.location)

requirements:
  WorkReuse:
    enableReuse: false
  DockerRequirement:
    dockerPull: gitlab.lcsb.uni.lu:4567/luca.bolzani/iderha-test-deployment/edc-client

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