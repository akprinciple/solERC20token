**Project Overview**
- **Purpose**: Learning and experimentation with Solidity smart contracts using Hardhat.
- **Main Target**: `ERC-20.sol` — a simple ERC‑20 token implementation located at [day/contracts/ERC-20.sol](day/contracts/ERC-20.sol).

**Repository Layout**
- **Contracts**: [day/contracts](day/contracts) — contains `ERC-20.sol`, `Lock.sol`, `Todo.sol`, and other examples.


**Getting Started**
- **Prerequisites**: Install Node.js (16+ recommended) and npm.
- **Install & Build**:
```bash
cd day
npm install
npx hardhat compile
```
- **Run Tests**:
```bash
npx hardhat test
```

**About `ERC-20.sol`**
- **Location**: [day/contracts/ERC-20.sol](day/contracts/ERC-20.sol)
- **Description**: This file provides a straightforward ERC‑20 token contract intended as the primary learning target in this repository. It demonstrates the typical ERC‑20 interface (balance management, transfers, allowances) and is suitable for compiling, deploying, and writing unit tests against in Hardhat.
- **How to interact**:
  - Compile the project (see Getting Started).
  - Use the Hardhat console or write a deployment script. 


**Deployment**
- You can deploy using Hardhat scripts or the console. Example (run a local node first):
```bash
npx hardhat node
npx hardhat run --network localhost scripts/deploy.js
```
- Replace `scripts/deploy.js` with your deployment script; none is included by default.

**Contributing**
- **Add tests**: Follow patterns in [test/Lock.ts](test/Lock.ts).
- **Create deployment scripts**: Place them under `day/scripts` and reference `hardhat.config.ts`.


