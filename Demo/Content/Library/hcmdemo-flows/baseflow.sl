namespace: hcmdemo-flows
flow:
  name: baseflow
  workflow:
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: pm-hcmdemo-svc.americas.hpqcorp.net
            - command: ls /
            - username: root
            - password:
                value: Solutions@2016
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: FAILURE
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      ssh_command:
        x: 450
        y: 118.60000610351562
        navigate:
          078865b4-a0f1-1069-4f98-84e7f4a828e5:
            targetId: 7377a5e4-1cb8-17c4-ebb7-8458cb199efb
            port: FAILURE
          89c1304f-05d1-7dc2-2667-9f4c052c8d87:
            targetId: 01b3ddda-dda3-d63d-b921-01b94866e739
            port: SUCCESS
    results:
      FAILURE:
        7377a5e4-1cb8-17c4-ebb7-8458cb199efb:
          x: 356
          y: 287
      SUCCESS:
        01b3ddda-dda3-d63d-b921-01b94866e739:
          x: 554
          y: 289
