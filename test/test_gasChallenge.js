const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Deploy Gas Challenge Contract", () => {
  let gas_contract;

  beforeEach(async () => {
    const gasChallengeContract = await ethers.getContractFactory("gasChallenge");
    gas_contract = await gasChallengeContract.deploy();
  });

  describe("Compute Gas", () => {
    it("Should return lower gas", async () => {
      await gas_contract.notOptimizedFunction();
      await gas_contract.optimizedFunction();
    });
  });

  describe("Check Sum Of Array", () => {
    it("Should return 0", async () => {
      // Call the optimized function to set all elements of the array to 0
      await gas_contract.optimizedFunction();

      // Call the getSumAfterOptimization function to get the sum of the array after optimization
      const sumAfterOptimization = await gas_contract.getSumAfterOptimization();

      // Assert that the sum of the array is equal to 0
      expect(sumAfterOptimization).to.equal(0);
    });
  });
});