### Ethererum

#### Tools
- Foundry (To debug smart contract)
    ```bash
    # Install
    curl -L https://foundry.paradigm.xyz | bash
    # To interact with the blockchain via RPC calls
    cast
    # To build, compile, debug, deploy your smart contracts
    forge 
    ```

#### Usage
- cast
    ```bash
    cast call $ADDR "totalSupply()(uint256)" --rpc-url $RPC
    cast send --private-key $PRIKEY $ADDR "attack(uint256)" 100 --rpc-url $RPC
    ```
- forge
    ```bash
    # Deploy contract
    forge create --private-key $PRIKEY --rpc-url $RPC --constructor-args "NonFun"  $CONTRACT_NAME
    ```

forge create src/Attacker.sol:Attacker --private-key "0xc705243f7e9610080b76d92f958728bfcac8e44e8df390252f27839a6f6ddb2d" --rpc-url http://94.237.54.48:53568/rpc --constructor-args "0xB6a0900AE83A627Ebb2BdD6Ca59b06Cde63D59fE" 

cast send --private-key 0x50dd339a4b872c146e4b0590ee4535d68a5b878b8c0c7bf70321af8e5e15f6af 0xd49634737f20b2430a58794Bcd6002c958f4b2B6 "loot()" --rpc-url http://94.237.54.48:53568/rpc

cast call "0xd49634737f20b2430a58794Bcd6002c958f4b2B6" "lifePoints()" --rpc-url http://94.237.54.48:53568/rpc
cast storage 0xa8a39A2B9e81c74D8378570EEb0E4eD97105d2b0 0 --rpc-url http://94.237.54.48:53568/rpc

forge create src/Attacker.sol:Attacker --private-key "0x50dd339a4b872c146e4b0590ee4535d68a5b878b8c0c7bf70321af8e5e15f6af" --rpc-url http://94.237.54.48:53568/rpc --constructor-args "0xd49634737f20b2430a58794Bcd6002c958f4b2B6"

0x4760b324e0db7F86c1DE1d376BcBefDF03b2168E