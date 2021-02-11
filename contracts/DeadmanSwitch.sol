//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.6;


contract DeadmanSwitch {

    address owner;
    uint lastCheckIn;
    uint triggerDuration;

    event CheckIn(); // Emitted when the owner checks in.

    /** @param _triggerDuration The number of seconds since the last check-in for the owner to be considered dead.
     */
    constructor(uint _triggerDuration) {
        owner = msg.sender;
        lastCheckIn = block.timestamp;
        triggerDuration = _triggerDuration;
    }

    /** @dev The function the owner must call periodically to prove they are alive.
     */
    function checkIn() external {
        require(msg.sender == owner, "Only the owner can check in.");
        lastCheckIn = block.timestamp;
        emit CheckIn();
    }

    /** @dev A function to let the owner switch addresses.
     *  @param _owner The new owner address.
     */
    function updateOwner(address _owner) external {
        require(msg.sender == owner);
        owner = _owner;
    }

    /** @return Whether the owner of the switch is dead or alive.
     */
    function isAlive() external returns (bool) {
        return block.timestamp - lastCheckIn < triggerDuration;
    }
}
