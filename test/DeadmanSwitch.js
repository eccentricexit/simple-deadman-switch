const { expect } = require("chai");

describe("DeadmanSwitch contract", function () {
  const triggerDuration = 60 * 60 * 24 * 30 // 1 month in seconds.
  beforeEach(async function () {
    DeadmanSwitch = await ethers.getContractFactory("DeadmanSwitch");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

    deadmanSwitch = await DeadmanSwitch.deploy(triggerDuration);
    await deadmanSwitch.deployed();
  });

  describe("Deployment", function () {
    it("Test permissions", async function () {
      // TODO.
    });
  });
});
