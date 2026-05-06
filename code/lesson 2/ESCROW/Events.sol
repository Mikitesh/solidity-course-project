contract Escrow {
    
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint256 amount);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(msg.sender == arbiter, "Not arbiter");

        uint256 amount = address(this).balance;

        payable(beneficiary).transfer(amount);

        emit Approved(amount);
    }
}