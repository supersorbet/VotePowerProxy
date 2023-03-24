//SPDX-License-Identifier: Frensware
pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./IVotingPower.sol";

contract VotePowerProxy is Ownable {
    constructor() {}

    address public VotingPowerContract;

    event NewVotingPowerContract(address VotingPowerContract);

    function getCopeBalance(address _user) external view returns (uint256) {
        return IVotingPower(VotingPowerContract).getCopeBalance(_user);
    }

    function getCopeVaultBalance(address _user) external view returns (uint256) {
        return IVotingPower(VotingPowerContract).getCopeVaultBalance(_user);
    }


    function getCopePoolBalance(address _user) external view returns (uint256) {
        return IVotingPower(VotingPowerContract).getCopePoolBalance(_user);
    }

    function getCopeEthLpBalance(address _user) external view returns (uint256) {
        return IVotingPower(VotingPowerContract).getCopeBnbLpBalance(_user);
    }

    function getPoolsBalance(address _user, address[] memory _pools) external view returns (uint256) {
        return IVotingPower(VotingPowerContract).getPoolsBalance(_user, _pools);
    }

    function getVotingPowerWithoutPool(address _user) external view returns (uint256) {
        return IVotingPower(VotingPowerContract).getVotingPowerWithoutPool(_user);
    }

    function getVotingPower(address _user, address[] memory _pools) external view returns (uint256) {
        return IVotingPower(VotingPowerContract).getVotingPower(_user, _pools);
    }

    /**
     * @notice Set Voting Power Contract address
     * @dev Only callable by the contract owner.
     */
    function setVotingPowerContract(address _VotingPowerContract) external onlyOwner {
        require(_VotingPowerContract != address(0), "Cannot be zero address");
        VotingPowerContract = _VotingPowerContract;
        emit NewVotingPowerContract(VotingPowerContract);
    }
}