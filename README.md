# Demonstration of OneClickDesktop system
Demonstration of simple system created from one overseer and one virtualization server

Before you start remember about submodule initalization.

## Modules used in this demonstration
1. [Overseer](https://github.com/one-click-desktop/overseer)
2. [VirtualizationServer](https://github.com/one-click-desktop/virtualization-server)
3. [Administration panel](https://github.com/one-click-desktop/admin-panel)

Directory `configuration` is ansible structure to configure operating system before deploying OneClickDesktop.

# Running demo

This demo requires all software that every module of OneClickDesktop system requires and additionaly docker-compose must be installed.

To run this little demo:
1. Read configuration instruction at https://github.com/one-click-desktop/configuration.
2. Modify variables and playbooks at `configuration` in way that *overseer* and *virt-srv* are the same system on which you will be running this demo.
3. Configure your target system with `configuration/scripts/configure_all.sh`.
4. Build virtualization server runtime docker container with `modules/virtualization-server/runtime_container/build.sh` (it will take some time).
5. Build modules group with `docker-compose up --build` running at root of this repository.

After these steps there will be 5 containers:
1. *mqtt* - RabbitMQ message broker used as internal and external communication broker.
2. *openldap* - Active Directory storing users and their home directories.
3. *overseer* - Overseer controlling sample VirtualizationServer.
4. *virt-srv* - sample VirtualizationServer with 2 types of machines.
5. *admin-panel* - web server where admin-panel is provided.

## `build_and_run-demo.sh`

This simple script should automate steps from 3 to 5 from [Running demo](#Running demo) section.

## Configuration for modules

On docker-compose build containers have mounted configuration files from directory `configs`.
Every module has it's own folder with configurations.
Detailed describtion of every configuration file can be found at it's repository.
At this example administration panel `basePath` must be set as `http://demo-machine-address:5000`,
where `demo-machine-address` is address of machine where demo is running.
By default it is set to `http://localhost:5000`.

By default Overseer loads production configuration inside container and Virtualization Server loads docker-test configuration (folder).

# Using client application with demo

Client application you can find at https://github.com/one-click-desktop/client.
Details of client buildining and running can be found there.
Remeber about downloading version packed in archived when downloading from *Releases* section.
Before running client application set:
```
"basePath": "http://demo-machine-address:5000"
"rabbitPath": "amqp://demo-machine-address"
```
where `demo-machine-address` is address of machine where demo is running. Recommended test user is `vagrant` with password `vagrant`.


# Using Administration Panel

After running compose file admin panel should be available at http://demo-machine-address:4000,
where `demo-machine-address` is address of machine where demo is running. Default login is `admin1` and password `admin1_pass`
