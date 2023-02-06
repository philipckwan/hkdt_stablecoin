# hkdt_stablecoin

A project with solidity smart contracts on a ERC-20 token, HKDT for Hong Kong Dollar Stablecoin.

## Prerequisite for development setup

1. Install [Node.js](https://nodejs.org/en/) as this project requires "npm" and "npx" commands

2. Install [Truffle](https://trufflesuite.com/) as this project requires "truffle", "truffle console" and "truffle dashboard" commands 

3. Install [Git](https://git-scm.com/downloads) as this project is stored in github, it requires "git" command to pull the source code easily

Run the following command.

```bash
git clone https://github.com/philipckwan/hkdt_stablecoin.git
cd hkdt_stablecoin
```

## Development setup

### 1. Install Dependencies

Run the following command to install the node.js dependencies.

```bash
npm install
```

### 2. Compile Smart Contracts

Run the following command to compile the HKDT smart contract, located under contracts/

```bash
truffle compile
```

### 3. Start the Truffle Dashboard

Run the "truffle dashboard" to start a dashboard server at localhost:24012.

```bash
truffle dashboard
```

It will open a browser page that points to "localhost:24012". You will be able to connect your browser wallet (i.e. Metamask) to it.<br/>
Ensure you pick the right network (i.e. Ethereum Goerli) and use the right account when making the connection.

### 4. Run Truffle Console to connect to the Truffle Dashboard

On another terminal session, run the "truffle console" to open a truffle console session, that can connect to the truffle dashboard setup in the previous step.

```bash
truffle console --network dashboard
```

## Compile and Deploy cycle

Once you have successfully done the above setup, you can perform the development cycle where you compile and deploy the smart contract.<br/>
Using the Truffle Console that was started in the previous step:

```bash
truffle(dashboard)> compile
...
truffle(dashboard)> deploy <-- this requires you to go to the Truffle Dashboard to confirm and sign the transaction
...
truffle(dashboard)> hkdt = await HKDT.deployed()
```

If you want to load a previous deployed smart contract, given its address

```bash
truffle(dashboard)> hkdt = new HKDT("0x83a9250121b87ffa80851d8b776b336d74c54f39")
```

## Testing the deployed smart contract

Here list a few commands that you can try and test the contract deployed.<br/>
For more examples, see notes/notes.txt

This command call the view function "name" to get the name of the token.

```bash
truffle(dashboard)> hkdt.name()
'Hong Kong Dollar Stablecoin'
```

This command call the view function "getMessage" to get the message in the token.

```bash
truffle(dashboard)> hkdt.getMessage()
'this is HKDT v0.13'
```

## Example Contract

https://goerli.etherscan.io/address/0x83a9250121b87ffa80851d8b776b336d74c54f39
