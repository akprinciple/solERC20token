Question 1

Where are your structs, mappings and arrays stored?

Answer:

**Mappings are stored directly in storage, the persistent state of the Ethereum Virtual Mashine (EVM).** Each Key in a mapping is hashed to a unique position in the storage using keccak256. The hash of the key, combined with the storage slot of the mapping, determines where the value is stored. This guarantees uniqueness, even for different mappings with the same Keys.

**Structs**
The storage location of a struct depends on how and where it is used within the smart contract. The two primary data locations are storage and memory. 

1. 
State Variables: Structs declared as state variables at the contract level are automatically stored in storage. 
2. 
Structs declared as local variables within a function with the memory keyword are stored in memory.
3.
 Structs passed as function arguments or returned from functions can use the memory or calldata locations.

**Arrays**
Arrays can be stored in one of three data locations: storage, memory, or calldata. The location determines the array's persistence and how it can be used. 

**Question 2**
How do they behave when implemented or called?

**Answer:**
**Structs** act as custom, user-defined data types that group related variables into a single, organized unit to manage data efficiently and reduce gas costs. They are instantiated in storage or memory, can be passed to functions, and allow mapping complex data structures.

**Mappings** behave as hash tables that are virtually initialized to contain every possible key-value pair, with all values initially set to their type's default value. They are designed for highly efficient, constant-time lookup, storage, and retrieval of data. 

**Arrays** are indexed, typed collections that behave differently based on storage location. Storage arrays are persistent and mutable, while memory arrays are temporary and fixed-size during execution.

**Question 3**
Why don't you need to specify memory or storage with mappings.

**Answer**
This is because they are stored-only data structures that exclusively reside in the contract's state storage. Unlike arrays or structs, which can exist in memory or storage, mappings cannot be placed in memory
