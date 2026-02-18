Question

Where are your structs, mappings and arrays stored?

Answer:

Mappings in Solidity are similar to hash tables or dictionaries in other programming languages. A mapping consists of two primary components:
**Key**: These are unique identifiers used to look up values.
Values: These are the data associated with the keys.

The Syntax for a mapping is:
mapping(KeyType => ValueType) public mappingName

**Mappings are stored directly in storage, the persistent state of the Ethereum Virtual Mashine (EVM).** Each Key in a mapping is hashed to a unique position in the storage using keccak256. The hash of the key, combined with the storage slot of the mapping, determines where the value is stored. This guarantees uniqueness, even for different mappings with the same Keys.

**Structs**
The storage location of a struct depends on how and where it is used within the smart contract. The two primary data locations are storage and memory. 

1. storage
State Variables: Structs declared as state variables at the contract level are automatically stored in storage. 

2. Memory
Structs declared as local variables within a function with the memory keyword are stored in memory.
3.
 Structs passed as function arguments or returned from functions can use the memory or calldata locations.

**Arrays**
Arrays can be stored in one of three data locations: storage, memory, or calldata. The location determines the array's persistence and how it can be used. 
