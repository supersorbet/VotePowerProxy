//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVotingPower {
    function getCopeBalance(address _user) external view returns (uint256);

    function getCopeVaultBalance(address _user) external pure returns (uint256);

    function getCopePoolBalance(address _user) external view returns (uint256);

    function getCopeEthLpBalance(address _user) external view returns (uint256);

    function getPoolsBalance(address _user, address[] memory _pools) external view returns (uint256);

    function getVotingPowerWithoutPool(address _user) external view returns (uint256);

    function getVotingPower(address _user, address[] memory _pools) external view returns (uint256);
}