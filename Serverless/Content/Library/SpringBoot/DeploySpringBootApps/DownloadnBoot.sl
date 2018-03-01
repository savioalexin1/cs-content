########################################################################################################################
#!!
#! @input hostname: Hostname where the source code should be downloaded
#! @input username: Username of the host
#! @input password: Password of the host
#! @input privateKey: Private Key of the host
#! @input githubLocation: GitHub location to download the source code
#! @input sourceCodeDir: Name of the directory where the source code should be downloaded
#! @input springbootCmdOptions: SpringBoot command and options
#!!#
########################################################################################################################
namespace: SpringBoot.DeploySpringBootApps
flow:
  name: DownloadnBoot
  inputs:
    - hostname
    - username
    - password
    - privateKey
    - githubLocation
    - sourceCodeDir
    - springbootCmdOptions
  workflow:
    - GitClone:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: 'https://github.com/spring-petclinic/spring-petclinic-rest.git'
        navigate:
          - SUCCESS: springboot
          - FAILURE: FAILURE
    - springboot:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: 16.10.3.3123
            - command: 'mvnw spring-boot:run'
            - username: ubuntu
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GitClone:
        x: 382
        y: 202
        navigate:
          9ec623d1-0f31-3043-8be8-dfc15aa3abe5:
            targetId: 45dc1b72-4db1-da1b-8149-c5383fe4e73d
            port: FAILURE
      springboot:
        x: 589
        y: 199
        navigate:
          203a3910-a060-8205-e89e-28f382cba975:
            targetId: abbab1cc-9c06-faf4-6de5-6390b9324db0
            port: SUCCESS
    results:
      SUCCESS:
        abbab1cc-9c06-faf4-6de5-6390b9324db0:
          x: 586
          y: 395
      FAILURE:
        45dc1b72-4db1-da1b-8149-c5383fe4e73d:
          x: 375
          y: 395
