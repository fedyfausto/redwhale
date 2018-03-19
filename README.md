# RedWhale – Multi Node DevStack on Docker

## RedWhale

Tool to deploy a multi node infrastructure of OpenStack using Docker technology.  
It creates a core image named "RedWhale-core" used to deploy a single controller node and multiple compute nodes.

![scheme](http://i67.tinypic.com/24mujvp.png "RedWhale Scheme")

## Objective

Redwhale aims to organize the infrastructure in multiple Docker containers, each for single node.  
Controller node is the main node able to control compute nodes.

## Usage

First of all you have to build the Redwhale-core image:  
>$ ./redwhale --install  

This operation takes about 10/15 minutes.  
  
After core image is built, you can proceed to create controller node:  
>$ ./redwhale --add controller  

and compute nodes (provide names to specify different compute nodes):
>$ ./redwhale --add compute [name]

Controller creation takes about 30/40 minutes, while compute creation takes about 15/20 minutes.  

For futher details about RedWhale type:
>$ ./redwhale --help

## Supported nodes
1. Nova [[1]]
2. Keystone [[2]]
3. Neutron [[3]]
4. Zun [[4]]
5. Horizon [[5]]

## Reference
RedWhale is meant to be created to provide an OpenStack infrastructure with Docker containers, but the original idea is from another GitHub user [[6]] 



[1]: https://docs.openstack.org/nova/latest/
[2]: https://docs.openstack.org/keystone/latest/
[3]: https://docs.openstack.org/neutron/latest/
[4]: https://docs.openstack.org/zun/latest/
[5]: https://docs.openstack.org/horizon/latest/
[6]: https://github.com/janmattfeld/DockStack
