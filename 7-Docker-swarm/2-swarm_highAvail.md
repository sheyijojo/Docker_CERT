### Swarm High Availability 

```md
Manager node is known for managing the worker state. H
Havimg multiple manager nodes is recommended for fault tolerance 
 
## conflict of interest, a leader is used to make management decisions 
Other managers need to be aware of the application state called Distributed consensus-. Hence, then implementing the RAFT consensus algorithm. 

RAFT - Decides who is going to become the leader among the three manager nodes. 

It uses a timer notification for a node to become a leader as a manager 

If it fails, there will be no manager to manage the cluster.



## The RAFT concept is just about a random timer concept 

## How manager vs nodes 

Docker recommends no more than 7 managers nodes for a swarm .


```
## Continuation 

```md
## Every manager has a copy of the database
A leader manager with decisions to add a new worker node to the cluster has to inform other managers of its decision. 

It gets response from at least one of the worker to reach quorum and commit the changes to the database on all master nodes.

This means that any changes made by any of the managwer is with consensus from majority of the managers in the cluster. 

```
![quorum](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/quorum.png)?raw=true)
```md
Quorum is defined as the min num of members in an assembly that must be present at any of its meetings to make the proceedings of the meeting valid.

```