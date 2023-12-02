// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    string public redeem_shop;
    string internal error_m = "Only 3 items available in the shop";

    constructor() ERC20("Degen", "DGN") {
        redeem_shop = "You have the folllowing items in your shop which you are able to redeem: 1.Pan, 2.Ceramic Bowl, 3.Ladder";
    }

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
        }

        function redeem(uint256 item_serial) public {
        
        if(item_serial > 0 && item_serial < 4){
            revert(error_m);
        }
        require(balanceOf(msg.sender) >= 5);
        _burn(msg.sender, item_serial + 10);
        }

        function OwnerAdvantage(address target) public onlyOwner {
            assert(balanceOf(target) >5);
            _burn(target, 5);
        }

}