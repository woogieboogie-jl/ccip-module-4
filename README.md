# CCIP Moude 4 Certification Course


## Example 1

### Deploy TransferUSDC.sol on avalancheFuji /script/transferUSDC.s.sol: 0x63CdaCB22420901332B4ae4992eF2473a010C1b4
````forge script ./script/TransferUSDC.s.sol --rpc-url avalancheFuji --broadcast -vvvv````

### call allowlistDestinationChain(uint64, bool) on TransferUSDC on avalancheFuji
````cast send 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 --rpc-url avalancheFuji --private-key $PRIVATE_KEY "allowlistDestinationChain(uint64, bool)" 16015286601757825753 true````

### call approve(address uint256) of 0x5425890298aed601595a70AB815c96711a31Bc65 (USDC contract on avalancheFuji) 
````cast send 0x5425890298aed601595a70AB815c96711a31Bc65 --rpc-url avalancheFuji --private-key $PRIVATE_KEY "approve(address, uint256)" 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 1000000````

### Execute the transferUSDC function on avalancheFUji 
````cast send 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 --rpc-url avalancheFuji --private-key $PRIVATE_KEY "transferUsdc(uint64, address, uint256, uint64)" 16015286601757825753 0xE3085765a3C228768957B434fb309291CB5d31aa 1000000 0````



## Example 2
*TransferUSDC.sol: 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 on avalancheFuji*

### Make sure allowlistDestinationChain already enabled ethereumSepolia
````cast send 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 --rpc-url avalancheFuji --private-key $PRIVATE_KEY "allowlistDestinationChain(uint64, bool)" 16015286601757825753 true````

### Deploy via script: SwapTestnetUSDC.s.sol on ethereumSepolia: 0xE5746cC6D2a122Fa0086969f4cEb6E7A6A00127f
````forge script ./script/SwapTestnetUSDC.s.sol --rpc-url ethereumSepolia --broadcast -vvvv````

### Deploy via script: CrossChainReceiver.s.sol on ethereumSepolia 0xE0419D5115199dC41616e96d0c5ed3448B18baee
````forge script ./script/CrossChainReceiver.s.sol --rpc-url ethereumSepolia --broadcast -vvvv````

### On ethereumSepolia, call allowlistSourceChain(uint64, bool) function
````cast send 0xE0419D5115199dC41616e96d0c5ed3448B18baee --rpc-url ethereumSepolia --private-key $PRIVATE_KEY "allowlistSourceChain(uint64, bool)" 14767482510784806043 true````

### On ethereumSepolia, call allowlistSender(address, bool) function 
````cast send 0xE0419D5115199dC41616e96d0c5ed3448B18baee --rpc-url ethereumSepolia --private-key $PRIVATE_KEY "allowlistSender(address, bool)" 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 true````

### Approve USDC.sol’s approve function on your behalf, on avalancheFuji for TransferUSDC contract
````cast send 0x5425890298aed601595a70AB815c96711a31Bc65 --rpc-url avalancheFuji --private-key $PRIVATE_KEY "approve(address, uint256)" 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 10000000````

### Execute the transferUSDC function on avalancheFUji 
````cast send 0x63CdaCB22420901332B4ae4992eF2473a010C1b4 --rpc-url avalancheFuji --private-key $PRIVATE_KEY "transferUsdc(uint64, address, uint256, uint64)" 16015286601757825753 0xE0419D5115199dC41616e96d0c5ed3448B18baee 10000000 500000````
