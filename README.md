# JoshiToken

JoshiToken is an ERC20 token created for educational purposes. This token demonstrates the basic functionalities of minting, burning, and transferring tokens using a smart contract deployed on the Ethereum blockchain.

## Description

JoshiToken is a simple ERC20 token built with Solidity and deployed on the Ethereum blockchain. The smart contract allows the owner to mint new tokens, while any user can burn their own tokens or transfer tokens to others. The token is built using OpenZeppelin's ERC20 standard implementation.

## Getting Started

### Installing

1. **Open Remix IDE:**
   Navigate to [Remix IDE](https://remix.ethereum.org/).

2. **Create a New File:**
   In the file explorer, create a new file named `JoshiToken.sol`.

3. **Copy the Smart Contract Code:**
   Copy and paste the following code into `JoshiToken.sol`:

   ```solidity
   // SPDX-License-Identifier: MIT
   pragma solidity ^0.8.0;

   import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

   contract JoshiToken is ERC20 {
       address public owner;

       constructor() ERC20("JoshiToken", "JSH") {
           owner = msg.sender;
       }

       modifier onlyOwner() {
           require(msg.sender == owner, "Only the contract owner can call this function");
           _;
       }

       function mint(address to, uint256 amount) external onlyOwner {
           _mint(to, amount);
       }

       function burn(uint256 amount) external {
           _burn(msg.sender, amount);
       }
   }

### Executing program
1. **Compile the Contract:**

Select the appropriate compiler version (0.8.0 or higher).
Click on the "Solidity Compiler" tab and then click "Compile JoshiToken.sol".

2. **Deploy the Contract:**

Go to the "Deploy & Run Transactions" tab.
Select "Injected Web3" if using MetaMask or "Remix VM" for a local deployment.
Click "Deploy".

3. **Mint Tokens:**

Ensure you are the contract owner.
Use the mint function in the deployed contract interface to mint tokens.
Specify the recipient address and the amount to mint.

4. **Burn Tokens:**

Use the burn function to burn your tokens.
Specify the amount to burn.

## Authors

NTCIAN Josh
<br>
[Discord: @Range](https://discordapp.com/users/Range#4932)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
