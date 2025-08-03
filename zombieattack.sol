#This is for licence
pragma solidity ^0.8.0;

// Import the base zombie factory contract which defines the zombie structure and creation logic
import "./zombiefactory.sol";

// This contract adds the attack functionality to zombies by inheriting from the ZombieFactory contract
contract ZombieAttack is ZombieFactory {

    // A nonce (number used once) to help with generating more random values
    uint randNonce = 0;

    // Probability (in percent) that a zombie wins a battle; 70 means 70% win chance
    uint attackVictoryProbability = 70;

    // Internal function to generate a pseudo-random number based on inputs
    // `_modulus` sets the range (i.e., `randMod(100)` gives 0–99)
    function randMod(uint _modulus) internal returns(uint) {
        // Increase the nonce to make each hash unique
        randNonce++;

        // Generate a pseudo-random hash and convert it to a uint
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % _modulus;
    }

    // External function that lets a zombie attack another zombie
    // `onlyOwnerOf(_zombieId)` ensures that only the owner can command the attack
    function attack(uint _zombieId, uint _targetId) external onlyOwnerOf(_zombieId) {
        // Fetch the attacking zombie's storage reference
        Zombie storage myZombie = zombies[_zombieId];

        // Fetch the target zombie's storage reference
        Zombie storage enemyZombie = zombies[_targetId];

        // Generate a random number between 0 and 99
        uint rand = randMod(100);

        // If the random number is less than or equal to 70 (70% chance), the attack is successful
        if (rand <= attackVictoryProbability) {
            // Attacker gains a win and levels up
            myZombie.winCount++;
            myZombie.level++;

            // Enemy gains a loss
            enemyZombie.lossCount++;

            // The attacker gets to "feed" on the enemy's DNA and possibly create a new zombie
            feedAndMultiply(_zombieId, enemyZombie.dna);
        } else {
            // If the attack fails, attacker gains a loss
            myZombie.lossCount++;

            // Enemy gains a win
            enemyZombie.winCount++;
        }
    }
}
