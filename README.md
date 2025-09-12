# Simple 2D Game with LÖVE Framework

This project is a simple 2D game developed using the LÖVE 2D framework. The game features basic gameplay mechanics where players control a character, shoot bullets at enemies, and manage health points to survive as long as possible.

## Key Features

1. **Game Structure**:
   - Object-oriented design with classes for entities like Player, Enemy, Bullet.
   - State Machine manages different states of the game (Main Menu, Hero Selection, Gameplay, Game Result).

2. **Entities**:
   - `Player`: Controlled by the user; can move left and right, shoot bullets, and has health points.
   - `Enemy`: Non-player characters that move towards the player and have their own health points.
   - `Bullet`: Projectiles fired by the player to hit enemies.

3. **Gameplay Mechanics**:
   - Players can select a hero before starting the game (Pudge or Viper).
   - The player moves left and right using arrow keys and shoots bullets with the space key.
   - Bullets decrease an enemy's health when they collide, and enemies increase their speed as they take damage.

4. **State Machine**:
   - Manages transitions between different states like Main Menu, Hero Selection, Gameplay, and Game Result.
   - Handles input events and updates the game state accordingly.

5. **Sound & Music**:
   - Background music and sound effects are played for various actions like shooting, impacts, etc.

6. **Game Configuration**:
   - Configuration data for heroes and general game settings are stored in separate modules.

7. **Game Result**:
   - Displays the result of the match based on health scores of player and enemy entities.
   - Announces whether the player or enemy wins and shows their respective health points.

## Files Overview

- `main.lua`: The entry point of the game, initializing the state machine and background.
- `background/background.lua`: Manages the background elements like stars and comets.
- `game/*`: Contains modules for entities (Player, Enemy, Bullet) and game configuration.
- `stateMachine/*`: Modules for managing different states of the game and handling transitions.
- `music.lua`: Handles loading and playing sound effects.

## Getting Started

To run this project, you need to have the LÖVE 2D framework installed on your system. You can download it from [love2d.org](https://love2d.org/).

1. Clone or download this repository.
2. Place the game files in a folder.
3. Drag and drop the folder onto the LÖVE executable, or use the command line to run `love <path-to-game-folder>`.

## Controls

- Arrow keys: Move left and right
- Space key: Shoot bullets

## License

This project is licensed under the License. See the [LICENSE](LICENSE) file for details.