import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import hre from "hardhat";

describe("ERC20", function () {
 
  async function deployERC20() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await hre.ethers.getSigners();

    const ERC20 = await hre.ethers.getContractFactory("ERC20");
    const erc20 = await ERC20.deploy("Ark", "ARK", 1000); 

    return { erc20, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should mention the name of the token", async function () {
      const { erc20, owner } = await loadFixture(deployERC20);
      let name = await erc20.name();
      expect(name).to.equal("Ark");
    });
    it("Should mention the symbol of the token", async function () {
      const { erc20, owner } = await loadFixture(deployERC20);
      let symbol = await erc20.symbol();
      expect(symbol).to.equal("ARK");
    });
     
     it("Should mention the total supply of the token", async function () {
      const { erc20, owner } = await loadFixture(deployERC20);
      let totalSupply = await erc20.totalSupply();
      expect(totalSupply).to.equal(1000);
    });
  });
    
});