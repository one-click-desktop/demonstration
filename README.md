# Demonstration of OneClickDesktop system
Demonstration of simple system created from one overseer and one virtualization server

Before you start remember about submodule initalization.

## Modules used in this demonstration
1. [Overseer](https://github.com/one-click-desktop/overseer)
2. [VirtualizationServer](https://github.com/one-click-desktop/virtualization-server)
3. [Administration panel](https://github.com/one-click-desktop/admin-panel)

# Running demo

This demo requires all software that every module of OneClickDesktop system requires and additionaly docker-compose must be installed.

To run this little demo:
1. Read configuration instruction at https://github.com/one-click-desktop/configuration.
2. Modify variables and playbooks at `configuration` in way that *overseer* and *virt-srv* are the same system on which you will be running this demo.
3. Configure your target system with `configuration/scripts/configure_all.sh`.
4. Build virtualization server runtime docker container with `modules/virtualization-server/runtime_container/build.sh` (it will take some time).
5. Build modules group with `docker-compose up --build` running at root of this repository.

After these steps there will be 4 containers:
1. *mqtt* - RabbitMQ message broker used as internal and external communication broker.
2. *overseer* - Overseer controlling sample VirtualizationServer.
3. *virt-srv* - sample VirtualizationServer with 2 types of machines.
4. *admin-panel* - web server where admin-panel is provided.

## `build_and_run-demo.sh`

This simple script should automate steps from 3 to 5 from [Running demo](#Running demo) section.

# Using client application with demo

Client application you can find at https://github.com/one-click-desktop/client.
Details of client buildining and running can be found there.
Remeber about downloading version packed in archived when downloading from *Releases* section.
Before running client application set:
```
"basePath": "http://demo-machine-address:5000"
"rabbitPath": "amqp://demo-machine-address"
```
where `demo-machine-address` is addres of machine where demo is running.


# Using admin panel

After running compose file admin panel should be available at http://demo-machine-address:4000,
where `demo-machine-address` is addres of machine where demo is running.



