// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the OpenZeppelin ERC20 contract to create your own ERC20 token
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

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(recipient != address(0), "transfer: cannot transfer to the zero address");
        require(amount > 0, "transfer: transfer amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "transfer: sender does not have enough tokens");
        
        return super.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        require(sender != address(0), "transferFrom: transfer from the zero address");
        require(recipient != address(0), "transferFrom: transfer to the zero address");
        require(amount > 0, "transferFrom: transfer amount must be greater than zero");
        require(balanceOf(sender) >= amount, "transferFrom: sender does not have enough tokens");

        return super.transferFrom(sender, recipient, amount);
    }
}
