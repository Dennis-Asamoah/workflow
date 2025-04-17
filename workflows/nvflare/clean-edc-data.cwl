cwlVersion: v1.2
class: CommandLineTool

requirements:
  DockerRequirement:
    dockerPull: localhost:5000/omop-table-clean-header

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.location)

inputs:
  dataFile:
    type: File
    inputBinding:
      position: 1
  outputFile:
    type: string
    default: condition_era.csv
    inputBinding:
      position: 2
  location:
    type: string

outputs:
  cleanedFile:
    type: File
    outputBinding:
      glob: $(inputs.outputFile)

baseCommand: [clean_header]
