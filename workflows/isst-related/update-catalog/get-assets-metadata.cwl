cwlVersion: v1.2
class: CommandLineTool

requirements:
  DockerRequirement:
    dockerPull: localhost:5000/iderha-mdc-management

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.location)

inputs:
  jsonTemplate:
    type: File

  location:
    type: string
    default: "http://tesk-api-node-1:8080/ga4gh/tes"

  providerId:
    type: string
    default: provider

outputs:
  assetsMetadata:
    type: File
    outputBinding:
      glob: output.json

baseCommand: sh
arguments:
  - -c
  - "python3 /app/get-assets-metadata.py $(inputs.jsonTemplate.path)"
