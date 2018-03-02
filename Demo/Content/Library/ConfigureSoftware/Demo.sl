namespace: ConfigureSoftware
flow:
  name: Demo
  inputs:
    - HostPassword:
        default: Solutions@2016
        sensitive: true
    - Hostname: pm-hcmdemo-svc.americas.hpqcorp.net
    - HostUsername: root
    - Command: 'echo host.name=jbossdev.americas.com >> /tmp/suite_sw_configure.yaml;cat /tmp/suite_sw_configure.yaml'
  workflow:
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${Hostname}'
            - command: '${Command}'
            - username: '${HostUsername}'
            - password:
                value: '${HostPassword}'
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
        x: 415
        y: 133
        navigate:
          7a15e6d1-9eed-5132-44a9-3310753c4027:
            targetId: f5a3c7f8-47f0-2cd5-3abe-9f9f5f45e470
            port: SUCCESS
          0808eca3-9b9f-5bcd-40db-375cb6892f03:
            targetId: 32723ddc-ade8-7122-df97-18e4e69a90ed
            port: FAILURE
            vertices:
              - x: 354
                y: 266
    results:
      FAILURE:
        32723ddc-ade8-7122-df97-18e4e69a90ed:
          x: 258
          y: 329
      SUCCESS:
        f5a3c7f8-47f0-2cd5-3abe-9f9f5f45e470:
          x: 600
          y: 336
