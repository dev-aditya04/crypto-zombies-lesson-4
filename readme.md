# 🧠 CryptoZombies - Lesson 4: Zombie Battles (Student Project) 🧠

Hi! 👋 I'm a student learning Solidity and smart contract development, and this project is part of my journey through the [CryptoZombies](https://cryptozombies.io/) interactive course.

This repo contains all the Solidity code I wrote while completing **Lesson 4**, where I learned to implement **battle logic** for zombies on the Ethereum blockchain.

---

## 📚 What I Learned in Lesson 4

This lesson was about making the zombie game more interactive by allowing zombies to fight each other. It was my first time writing Solidity functions that use:

- Random number generation using `keccak256`
- State-changing functions with conditionals (`if`, `else`)
- Using storage references for structs (`Zombie storage`)
- Writing modifiers like `onlyOwnerOf()`
- Game mechanics like win/loss tracking

---

## 💡 Project Summary

In the earlier lessons, I created zombies and added logic for feeding, leveling up, and ownership. In **Lesson 4**, I added a new file called `zombieattack.sol` where:

- Zombies can attack other zombies.
- The winner is chosen randomly based on a 70% win chance.
- Winning increases zombie level and lets them multiply using the opponent's DNA.
- Losing just adds to the loss count (no punishment otherwise).

---

## Folder Structure

```bash
contracts/
├── zombiefactory.sol         # Creates zombies and handles basic logic (Lesson 1)
├── zombiefeeding.sol         # Adds DNA feeding and mutation (Lesson 2)
├── zombiehelper.sol          # Adds helper functions like level-up (Lesson 3)
├── zombieownership.sol       # ERC721 token logic for trading zombies (Lesson 3)
└── zombieattack.sol          # 🧟 Adds battle logic (Lesson 4)
