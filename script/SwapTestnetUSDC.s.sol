// script/SwapTestnetUSDC.s.sol 
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {SwapTestnetUSDC} from "../src/SwapTestnetUSDC.sol";

contract DeploySwapTestnetUSDC is Script {
  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);
    address sepoliaUSDC = 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238;
    address sepoliaCompoundUSDC = 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238; 
    address sepoliaFauceteer = 0x68793eA49297eB75DFB4610B68e076D2A5c7646C;

    SwapTestnetUSDC swapper = new SwapTestnetUSDC(
      sepoliaUSDC,
      sepoliaCompoundUSDC,
      sepoliaFauceteer
    );

    console.log(
      "SwapTestnetUSDC deployed to ", 
      address(swapper)
    );

    vm.stopBroadcast();
  } 
}
