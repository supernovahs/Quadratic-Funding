# Quadratic Funding 

 ## @Author : Supernovahs
 Feel free to PR or Fork this . Waiting for your Suggestions . Thanks 

This project is inspired by [vitalik's article](https://vitalik.ca/general/2019/12/07/quadratic.html) on Quadratic Funding and how it is better than other forms of funding which involves better chances of good selection. 

## Front end link : [Here](https://quadraticfunding.surge.sh/)

## How does Quadratic funding work ?

Let's Assume there are 2 Projects looking for Funding from a specific sponsor. The sponsor funds 1000 $ and now anyone can vote for any project by simply voting in some way.
I am pasting Vitalik's words from his article as I can't explain it better. 

_The goal is that option A gets chosen if in total people like A more, and option B gets chosen if in total people like B more. With simple voting ("one person one vote"), the distinction between stronger vs weaker preferences gets ignored, so on issues where one side is of very high value to a few people and the other side is of low value to more people, simple voting is likely to give wrong answers.___

 _With a private-goods market mechanism where people can buy as many votes as they want at the same price per vote, the individual with the strongest preference (or the wealthiest) carries everything. Quadratic voting, where you can make n votes in either direction at a cost of n2, is right in the middle between these two extremes, and creates the perfect balance.__________

![Screenshot from 2022-03-28 00-38-38](https://user-images.githubusercontent.com/91280922/160297036-2527bfde-60e0-4225-b048-10d7aba610d7.png)

### How to calculate funding ?
In the Home  Menu, Send some Test Eth to the contract as a Matching Fund. 

#### Tip: To get the best Accurate Result, in the Calculate Allocation Tab, Enter values as uint because Solidity does not have decimals and inserting big values will result a more accurate square root of the contributions . Thus making the allocation result more Accurate . 

In the calculate Allocation Tab, Enter the assumed contribution values that you want to test . 
Example : 
Project 1 : 100000, 300000 , 500000 , 50000, 100000, 190000 , 210000
Project 2 : 1000000,1000000


Now lastly, In the results tab , click on get results and Boom , You get the Matching fund allocation to each project. 

## Instructions : 

```
git clone https://github.com/supernovahs/Quadratic-Funding.git
```
### To reproduce the code in your Local Environment

```
cd Quadratic-Funding
```

```
yarn install
```
```
yarn chain
```
```
yarn deploy
```

```
yarn start
```





