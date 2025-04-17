cwlVersion: v1.0
class: CommandLineTool
doc: Running exploratory analysis with NVidia Flare
requirements:
  DockerRequirement:
    dockerPull: localhost:5000/nvflare-admin

inputs:
  data_files:
    type:
      type: array
      items: File
      inputBinding:
        valueFrom: $(self.location)
    inputBinding:
      position: 1

outputs:
  logs:
    type: stdout
  output_file:
    type: File
    outputBinding:
      glob: "image_statistics.json"

stdout: nvflare.log

baseCommand: ["/app/run_job.sh"]
