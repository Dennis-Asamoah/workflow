cwlVersion: v1.2
class: CommandLineTool
doc: Running exploratory analysis without Nvidia Flare
requirements:
  DockerRequirement:
    dockerPull: localhost:5000/flareless-analysis
  WorkReuse:
    enableReuse: false

hints:
  RemoteLocationRequirement:
    nodeUri: $(inputs.location)


inputs:
  location:
    type: string
    inputBinding:
      prefix: --location
  data_files:
    type: File
    inputBinding:
      prefix: -i
      position: 1

outputs:
  logs:
    type: stdout
  output_file:
    type: File
    outputBinding:
      glob: "image_statistics.json"

stdout: nvflare.log

baseCommand: ["python3"]
arguments:
  - /app/flareless_analysis.py
