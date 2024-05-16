// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Create your own ERC20 token

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
