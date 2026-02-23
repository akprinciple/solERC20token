import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const{ LISK_SEPOLIA_URL, PRIVATE_KEY } = process.env;

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    lisk_sepolia: {
      url: `${LISK_SEPOLIA_URL}`,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
};

export default config;
