// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '../BaseTest.t.sol';

contract LiquidityHubTest is BaseTest {
  function setUp() public override {
    super.setUp();

    // Add dai
    hub.addReserve(
      LiquidityHub.ReserveConfig({
        borrowModule: address(0),
        lt: 0,
        lb: 0,
        rf: 0,
        decimals: 18,
        active: true,
        borrowable: false,
        supplyCap: type(uint256).max,
        borrowCap: type(uint256).max
      }),
      address(dai)
    );
  }

  function testSupply() public {
    deal(address(dai), USER1, 100e18);
    vm.startPrank(USER1);

    dai.approve(address(hub), 100e18);
    uint256 assetId = 0; // TODO: Add getter of asset id based on address
    hub.supply(assetId, 100e18);
  }
}
