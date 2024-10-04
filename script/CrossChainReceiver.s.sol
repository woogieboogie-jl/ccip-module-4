// script/CrossChainReceiver.s.sol 
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {CrossChainReceiver} from "../src/CrossChainReceiver.sol";

contract DeployCrossChainReceiver is Script {
  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);

    address sepoliaRouterAddress = 0x0BF3dE8c5D3e8A2B34D2BEeB17ABfCeBaf363A59;
    address sepoliaCometAddress = 0xAec1F48e02Cfb822Be958B68C7957156EB3F0b6e; 
    address sepoliaSwapTestnetUsdcAddress = 0xE5746cC6D2a122Fa0086969f4cEb6E7A6A00127f;

    CrossChainReceiver receiver = new CrossChainReceiver(
      sepoliaRouterAddress,
      sepoliaCometAddress,
      sepoliaSwapTestnetUsdcAddress
    );

    console.log(
      "CrossChainReceiver deployed to ", 
      address(receiver)
    );

    vm.stopBroadcast();
  } 
}
