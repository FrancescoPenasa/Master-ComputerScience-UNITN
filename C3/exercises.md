
## Computability
### Recursive and recursively enumerable sets
**Why is every finite set recursive?**
Because there are only a limited number of items in a set that need to be checked, when we checked all the elements in the finite set we know that we will not find any more elements that respect the properties of the set.

**Try to prove that if a set is recursive, then its complement is recursive too.**
If we are able to pove that a set is recursive with a TM that decides 1 if the element is in the set and 0 if it is not. Then we are able to prove the recursiveness of the complement set using a TM that decides 0 if the element is in the previous set and 1 if it is not in such set. We simply define a TM that takes in input the previous TM and if it returns 0 then return 1 and if it returns 1 then return 0, due to the fact that we know that the first set is recursive then its complement will be too.


**Let $S$ be a recursively enumerable set, and let algorithm $A$ enumerate all elements in $S$. Prove that, if $A$ lists the elements of $S$ in increasing order, then $S$ is recursive.**
If we use the diagonal method to list the elements of S, if A lists such elements in order it means that all the elements needs the same number of steps to be reached. Then we know how many steps are necessary to understand if the number is in the set or not and if the number exceed the number of steps for sure is not in the set. This gives us an algorithm that will stop in a finite amount of steps.

`reference:https://en.wikipedia.org/wiki/Recursive_set`


### Turing machines 
**Why do we require a TM's alphabet $\sigma$ and state set $Q$ to be finite, while we accept the tape to be infinite?**
- ;l
- -

**What is the minimum size of the alphabet to have a useful TM? What about the state set?**
- Alphabet : 2, because with 2 symbols we are able to emulate any turing machine -> theorem 2 page 10
- State: 1, we just need a halting state 

**Try writing machines that perform simple computations or accepts simply defined strings.**
>drawings.

## Computational complexity
### Definitions
**Why introduce non-deterministic Turing machines, if they are not practical computational models?**

**Why do we require reductions to carry out in polynomial time?**
Suppose we use a reduction to carry out in more than polynomial time, then for sure we can say that  

**Am I familiar with Boolean logic and combinational Boolean circuits?**
Yes.
[]: https://en.wikipedia.org/wiki/Recursive_set#References
