// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Points is ERC20, Ownable {
    uint256 private constant ITEM_ID_CAP = 1;
    uint256 private constant ITEM_ID_SHIRT = 2;
    uint256 private constant ITEM_ID_HOODIE = 3;

    mapping(address => mapping(uint256 => bool)) private _playerRedeemed;
    mapping(uint256 => uint256) private _itemPrices;

    event RedeemItem(address indexed player, uint256 itemId);

    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 10000);

        _itemPrices[ITEM_ID_CAP] = 50;
        _itemPrices[ITEM_ID_SHIRT] = 100;
        _itemPrices[ITEM_ID_HOODIE] = 200;
    }
    function getRedeemableItems() external pure returns (uint256[] memory, string[] memory) {
        uint256[] memory itemIds = new uint256[](3);
        string[] memory itemNames = new string[](3);

        itemIds[0] = ITEM_ID_CAP;
        itemNames[0] = "Degen Cap";

        itemIds[1] = ITEM_ID_SHIRT;
        itemNames[1] = "Degen Shirt";

        itemIds[2] = ITEM_ID_HOODIE;
        itemNames[2] = "Degen Hoodie";

        return (itemIds, itemNames);
    }

    function redeem(uint256 itemId) external {
        require(itemId >= 1 && itemId <= 3, "Invalid item ID");
        require(!_playerRedeemed[msg.sender][itemId], "Item already redeemed");

        uint256 itemPrice = _itemPrices[itemId];

        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance for this item");

        _playerRedeemed[msg.sender][itemId] = true;
        _burn(msg.sender, itemPrice);

        emit RedeemItem(msg.sender, itemId);
    }

    // Function to check if an item has been redeemed by a player
    function hasRedeemedItem(address player, uint256 itemId) external view returns (bool) {
        return _playerRedeemed[player][itemId];
    }

    // Function to transfer tokens to a recipient
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    // Function to mint new tokens (only the owner can call this)
    function mint(address account, uint256 amount) external onlyOwner returns (bool) {
        _mint(account, amount);
        return true;
    }

    // Function to burn tokens
    function burn(uint256 amount) external returns (bool) {
        _burn(_msgSender(), amount);
        return true;
    }

    // Override the decimals property to set it to 0
    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}
