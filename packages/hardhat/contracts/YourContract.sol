pragma solidity ^0.8.0;

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

    uint256 public a;
    uint256 public b;

    // *********** Add projects *********//

    // function AddProject(address _ProjectAddress) public {
    //     Projects memory project;
    //     project.id = projects.length;
    //     project.Address = _ProjectAddress;
    //     projects.push(project);
    // }

    // function contribute(uint256 _id) public payable {
    //     AddressToIdToAmount[msg.sender][_id] = msg.value;
    //     contributions.push(Contributions(msg.value));

    //     NoOfContributors++;
    // }

    function calculatorP1(uint256[] memory values) public {
        for (uint256 i; i < values.length; i++) {
            uint256 root = Sqrt(values[i]);
            finaleP1.push(values[i]);
            totalsP1 += root;
        }

        squareP1 = totalsP1 * totalsP1;
    }

    function calculatorP2(uint256[] memory values) public {
        for (uint256 i; i < values.length; i++) {
            uint256 root = Sqrt(values[i]);
            finaleP2.push(values[i]);
            totalsP2 += root;
        }

        squareP2 = totalsP2 * totalsP2;
    }

    function MatchingPoolFund() public payable {
        MatchingFundContributor[msg.sender] += msg.value;
        TotalMatchingFund += msg.value;
    }

    function CalculateAllocation() public returns (uint256, uint256) {
        P1Allocation = (squareP1 * TotalMatchingFund) / (squareP1 + squareP2);
        P2Allocation = (squareP2 * TotalMatchingFund) / (squareP1 + squareP2);
        return (P1Allocation, P2Allocation);
    }
}
