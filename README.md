# zksync-precompile
For report bug only

# zkSync Hardhat project template

This project was scaffolded with [zksync-cli](https://github.com/matter-labs/zksync-cli).

## Project Layout

- `/contracts`: Contains solidity smart contracts.
- `/deploy`: Scripts for contract deployment and interaction.
- `/script`: Scripts for contract deployment and interaction.
- `hardhat.config.ts`: Configuration settings.

## How to Use
- `cp .env.example .env`: Config rich wallet
- `yarn install`: Install package.
- `yarn compile`: Compiles contracts.
- `npx hardhat node-zksync`: run inmemory zksync node.
- `npx ts-node scripts/DKG.s.ts`: Deploying and call `addPKCommittee` function that emit error on precompile contract 0x05.
- `npx ts-node scripts/Withdraw.s.ts`: Deploying and call `verify proof` function that return fail cause precompile contract 0x08.

### Environment Settings

To keep private keys safe, this project pulls in environment variables from `.env` files. Primarily, it fetches the wallet's private key.

Rename `.env.example` to `.env` and fill in your private key:

```
WALLET_PRIVATE_KEY=your_private_key_here...
```

### Network Support

`hardhat.config.ts` comes with a list of networks to deploy and test contracts. Add more by adjusting the `networks` section in the `hardhat.config.ts`. To make a network the default, set the `defaultNetwork` to its name. You can also override the default using the `--network` option, like: `hardhat test --network dockerizedNode`.

## Useful Links

- [Docs](https://era.zksync.io/docs/dev/)
- [Official Site](https://zksync.io/)
- [GitHub](https://github.com/matter-labs)
- [Twitter](https://twitter.com/zksync)
- [Discord](https://join.zksync.dev/)

## Reason 
The current error found in precompile contracts 0x05 (expmod) and 0x08 (ecPairing) are due to zkSync not yet supporting these two precompile contracts. Contract 0x05 can be easily wrapped with Solidity code, but contract 0x08 is more complex