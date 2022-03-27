pragma solidity ^0.8.0;

/**  @author : Supernovahs.eth */
/** @dev : This contract is made to calculate funding allocation to 2 projects competing for funds.  */

contract YourContract {
    struct Projects {
        uint256 id;
        address Address;
    }

    struct Contributions {
        uint256 val;
    }

    uint256[] public finaleP1;
    uint256 public totalsP1;
    uint256 public squareP1;

    uint256[] public finaleP2;
    uint256 public totalsP2;
    uint256 public squareP2;

    uint256 public P1Allocation;
    uint256 public P2Allocation;

    uint256 public TotalMatchingFund;
    uint256 public NoOfContributors;

    Projects[] public projects;

    Contributions[] public contributions;

    mapping(uint256 => Contributions) public IdtoContri;

    mapping(address => uint256) public MatchingFundContributor;

    mapping(address => mapping(uint256 => uint256)) public AddressToIdToAmount;

    //**************** Square root function from Uniswap repo */

    function Sqrt(uint256 y) public pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }

    //*********** Calculates project 1 ratio */

    function calculatorP1(uint256[] memory values) public {
        for (uint256 i; i < values.length; i++) {
            uint256 root = Sqrt(values[i]);
            finaleP1.push(values[i]);
            totalsP1 += root;
        }

        squareP1 = totalsP1 * totalsP1;
    }

    //****************** Calculates Project 2 Ratio */

    function calculatorP2(uint256[] memory values) public {
        for (uint256 i; i < values.length; i++) {
            uint256 root = Sqrt(values[i]);
            finaleP2.push(values[i]);
            totalsP2 += root;
        }

        squareP2 = totalsP2 * totalsP2;
    }

    //*************** Contribute fund fo the matching pool */

    function MatchingPoolFund() public payable {
        MatchingFundContributor[msg.sender] += msg.value;
        TotalMatchingFund += msg.value;
    }

    //************** Calculates ALlocation of the 2 projects */

    function CalculateAllocation() public returns (uint256, uint256) {
        P1Allocation = (squareP1 * TotalMatchingFund) / (squareP1 + squareP2);
        P2Allocation = (squareP2 * TotalMatchingFund) / (squareP1 + squareP2);
        return (P1Allocation, P2Allocation);
    }
}
