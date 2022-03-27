import { useContractReader } from "eth-hooks";
import React from "react";
import { Link } from "react-router-dom";
import { Button } from "antd";
import { EtherInput } from "../components";
import { useState } from "react";
import { parseEther, formatEther } from "@ethersproject/units";
const { ethers } = require("ethers");

/**
 * web3 props can be passed from '../App.jsx' into your local view component for use
 * @param {*} yourLocalBalance balance on current network
 * @param {*} readContracts contracts from current chain already pre-loaded using ethers contract module. More here https://docs.ethers.io/v5/api/contract/contract/
 * @returns react component
 **/
function Home({ yourLocalBalance, readContracts, writeContracts, price }) {
  const [Amount, setAmount] = useState();

  return (
    <div>
      <h1 style={{ color: "yellowgreen" }}>Matching Fund Contribution</h1>
      <p>Send some kovan Eth for the Matching fund . </p>
      <div style={{ border: "1px solid #ccccc", margin: "auto", padding: 10, width: 400 }}>
        <EtherInput
          price={price}
          onChange={value => {
            setAmount(value);
          }}
        />

        <Button
          onClick={async () => {
            await writeContracts["YourContract"].MatchingPoolFund({
              value: parseEther("" + parseFloat(Amount).toFixed(12)),
            });
          }}
        >
          Fund{" "}
        </Button>
      </div>
    </div>
  );
}

export default Home;
