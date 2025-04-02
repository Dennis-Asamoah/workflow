cwlVersion: v1.2
class: CommandLineTool

requirements:
  DockerRequirement:
    dockerPull: localhost:5000/curl:8.8.0
  WorkReuse:
    enableReuse: false

hints:
  - class: RemoteLocationRequirement
    nodeUri: $(inputs.nodeId)

inputs:
  policyFile:
    type: File

  darId:
    type: string

  nodeId:
    type: string

  userId:
    type: string

outputs:
  out:
    type:
      type: record
      fields:
        filename:
          type: string
          outputBinding:
            outputEval: $(inputs.policyFile.basename)
        status:
          type: string
          outputBinding:
            glob: response.txt
            loadContents: true
            outputEval: $(self[0].contents)

baseCommand: curl
arguments:
  - -F
  - file=@$(inputs.policyFile.path)
  - -F
  - userId="$(inputs.userId)"
  - -F
  - policyId="$(inputs.darId)"
  - -o
  - nope.txt
  - -s
  - -w
  - "%{http_code}"
  - --retry
  - "2"
  - --retry-delay
  - "10"
  - http://policy-issuer:1919/api/v1/file/upload

stdout: response.txt