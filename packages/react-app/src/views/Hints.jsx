import { Select } from "antd";
import React, { useState } from "react";
import { utils } from "ethers";

import { useTokenList } from "eth-hooks/dapps/dex";
import { Address, AddressInput } from "../components";
import { Input, Button } from "antd";
import { parseEther, formatEther } from "@ethersproject/units";
const { ethers } = require("ethers");
const { Option } = Select;

export default function Hints({ yourLocalBalance, mainnetProvider, price, address, readContracts, writeContracts }) {
  // Get a list of tokens from a tokenlist -> see tokenlists.org!
  const [selectedToken, setSelectedToken] = useState("Pick a token!");
  const listOfTokens = useTokenList(
    "https://raw.githubusercontent.com/SetProtocol/uniswap-tokenlist/main/set.tokenlist.json",
  );

  const [contrifirst, setcontrifirst] = useState([]);
  const [contrisecond, setcontrisecond] = useState([]);
  let arrfirst = [];
  let arrsecond = [];

  return (
    <div>
      <h1>Input Individual Contributions </h1>
      <div style={{ border: "1px solid #bbbbbb", width: 400, margin: "auto", padding: 10, position: "left" }}>
        <p>Now insert the contributions in the 2 projects .</p>
        <h2>Project 1 </h2>
        <Input
          placeholder="10,100,500"
          value={contrifirst}
          onChange={e => {
            setcontrifirst(e.target.value);
            console.log(contrifirst);
          }}
        ></Input>

        <Button
          onClick={async () => {
            let a = contrifirst.split(",");
            console.log(a);
            console.log(typeof a);
            console.log(a.length);
            console.log(a[1]);
            for (let i = 0; i < a.length; i++) {
              arrfirst.push(a[i]);
            }
            console.log(arrfirst);
            console.log(typeof arrfirst);
            const Bigintarr = arrfirst.map(item => item);
            console.log(typeof Bigintarr);
            console.log(Bigintarr);
            await writeContracts["YourContract"].calculatorP1(Bigintarr);
          }}
        >
          Click
        </Button>
      </div>
      <div style={{ border: "1px solid #bbbbbb", width: 400, margin: "auto", padding: 10, position: "right" }}>
        <h2>Project 2 </h2>

        <Input
          placeholder="10,5,500,2,15"
          value={contrisecond}
          onChange={e => {
            setcontrisecond(e.target.value);
            console.log(contrisecond);
          }}
        ></Input>

        <Button
          onClick={async () => {
            let a = contrisecond.split(",");
            console.log(a);
            console.log(typeof a);
            console.log(a.length);
            console.log(a[1]);
            for (let i = 0; i < a.length; i++) {
              arrsecond.push(a[i]);
            }
            console.log(arrsecond);
            console.log(typeof arrsecond);
            const arrint = arrsecond.map(item => item);
            console.log(typeof arrint);
            console.log(arrint);
            await writeContracts["YourContract"].calculatorP2(arrint);
          }}
        >
          Click
        </Button>
      </div>
    </div>
  );
}
