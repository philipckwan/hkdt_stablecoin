// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract HKDT is ERC20 {
  using SafeMath for uint256;

  string private constant _name = "Hong Kong Dollar Stablecoin";
  string private constant _symbol = "HKDT";
  string private constant _message = "this is HKDT v0.13"; 
  uint256 private constant USDC_TO_HKDT_RATE = 778;
  uint256 private constant USDC_TO_HKDT_DECIMALS = 100;
  address private _usdcAddress;
  ERC20 private _usdcContract;

  event Deposit(address indexed dst, uint wad);
  event Withdrawal(address indexed src, uint wad);

  constructor(address usdcAddress) ERC20(_name, _symbol) {
    _usdcAddress = usdcAddress;
    _usdcContract = ERC20(_usdcAddress);
  }

  function getUSDCAddress() public view returns(address) {
    return _usdcAddress;
  }

  function getBalanceOnUSDC() public view returns(uint256) {
    return _usdcContract.balanceOf(_msgSender());
  }

  function getUSDCDecimals() public view returns(uint8) {
    return _usdcContract.decimals();
  }

  function getMessage() public pure returns(string memory) {
    return _message;
  }

  function decimals() public pure override returns (uint8) {
    return 18;
  }

  function deposit(uint256 usdcAmount) public {
    _usdcContract.transferFrom(_msgSender(), address(this), usdcAmount);
    uint256 hkdtAmount = usdcAmount.mul(USDC_TO_HKDT_RATE).div(USDC_TO_HKDT_DECIMALS).mul(10 ** decimals()).div(10 ** _usdcContract.decimals());
    _mint(_msgSender(), hkdtAmount);
    emit Deposit(_msgSender(), usdcAmount);
  }

  function withdraw(uint256 hkdtAmount) public {
    uint256 usdcAmount = hkdtAmount.mul(USDC_TO_HKDT_DECIMALS).div(USDC_TO_HKDT_RATE).mul(10 ** _usdcContract.decimals()).div(10 ** decimals());
    _burn(_msgSender(), hkdtAmount);
    _usdcContract.transfer(_msgSender(), usdcAmount);
    emit Withdrawal(_msgSender(), hkdtAmount);
  }

}
