## Swarm High Availability 

```md
Manager node is nknown for managing the worker state. Havimg multiple manager nodes is recommended for fault tolerance 

## conflict of interest, a leader is used to make management decisions 
Other managers need to be ware of the application state called Distributed consesys-. Hence implementing the RAFT consensus

It uses a timer notification for a node to become a leader as a manager 
```
