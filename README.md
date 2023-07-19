# Points Contract

Points is an ERC-20 token contract developed on the Ethereum blockchain using the Solidity programming language. The contract provides functionality for players to redeem items in exchange for tokens. Players can earn tokens as rewards and then use them to purchase items from the in-game store.

## Redeemable Items

The contract offers the following redeemable items in the in-game store:

1. Degen Cap (Item ID: 1) - Cost: 50 tokens
2. Degen Shirt (Item ID: 2) - Cost: 100 tokens
3. Degen Hoodie (Item ID: 3) - Cost: 200 tokens

## Functions

### `getRedeemableItems()`

```solidity
function getRedeemableItems() external pure returns (uint256[] memory, string[] memory)
```

This function allows users to retrieve the list of redeemable items available in the in-game store. It returns two arrays - one containing the item IDs and the other containing the item names.

### `redeem(uint256 itemId)`

```solidity
function redeem(uint256 itemId) external
```

Players can use this function to redeem items from the in-game store by providing the item's ID as an argument. The function checks if the player has enough tokens to make the purchase and ensures that the item has not been redeemed before. If all conditions are met, the player can redeem the item, and the corresponding tokens will be deducted from their balance.

### `hasRedeemedItem(address player, uint256 itemId)`

```solidity
function hasRedeemedItem(address player, uint256 itemId) external view returns (bool)
```

This function allows anyone to check if a specific player has already redeemed a particular item. It returns a boolean indicating whether the player has already redeemed the item.

### `transfer(address recipient, uint256 amount)`

```solidity
function transfer(address recipient, uint256 amount) public override returns (bool)
```

The standard ERC-20 transfer function is implemented to allow players to transfer tokens to other addresses.

### `mint(address account, uint256 amount)`

```solidity
function mint(address account, uint256 amount) external onlyOwner returns (bool)
```

This function allows the contract owner to mint new tokens and distribute them to specific accounts.

### `burn(uint256 amount)`

```solidity
function burn(uint256 amount) external returns (bool)
```

Players can use this function to burn (destroy) a specific number of their own tokens.

## Token Information

- Name: Degen
- Symbol: DGN
- Decimals: 0

The contract initializes with a total supply of 10,000 tokens, which are minted to the contract deployer (owner) upon deployment.

---
**Note:** The contract uses the [OpenZeppelin](https://openzeppelin.com/) library for ERC-20 token functionality and the Ownable contract to manage ownership permissions.

# Deploying Points Token Contract

This script deploys the "Points" ERC-20 token contract on the Ethereum blockchain using Hardhat. The "Points" token will be used for the in-game store of the Degen Gaming platform.

## Prerequisites

- [Node.js](https://nodejs.org/) and npm installed
- Hardhat installed (`npm install --save-dev hardhat`)

## Deployment Steps

1. Install Dependencies: Make sure you have installed the required dependencies by running `npm install`.

2. Configure Hardhat: Ensure that Hardhat is properly configured with the necessary network settings in the `hardhat.config.js` file.

3. Deployment Script: The deployment script is provided in the `deploy.js` file. It will handle the deployment of the "Points" token contract.

4. Run the Deployment Script: Execute the deployment script by running the following command:

```bash
node ./scripts/deploy.js
```

5. Verify Deployment: The script will display the contract address once the deployment is successful. You can verify the deployment on the Ethereum blockchain using the Etherscan block explorer or any other Ethereum blockchain explorer.

## Script Explanation

1. Import Hardhat: The script imports the `hardhat` module to interact with the Hardhat framework.

2. Main Function: The main function `main()` is an asynchronous function that handles the deployment process.

3. Get the Points Contract Factory: It uses the `ethers.getContractFactory()` method to obtain the contract factory for the "Points" token.

4. Deploy the Contract: The script deploys the contract using the `Points.deploy()` method. The deployed contract instance is stored in the `points` variable.

5. Wait for Deployment: The script waits for the deployment to be completed before proceeding. This ensures that the contract address is available for use.

6. Display Contract Address: The script prints the contract address to the console using `console.log()`. This address can be used to interact with the deployed "Points" token contract.

7. Error Handling: The script uses the `catch()` method to handle any errors that occur during the deployment process.

## Deployment Completion

Upon successful execution, the script will display the contract address, indicating that the "Points" token contract has been deployed to the specified Ethereum network. The contract is now ready to be used for the in-game store and other functionalities in the Degen Gaming platform.
