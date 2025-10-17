# Tank Royale Hackathon - Setup Guide

Welcome to the AI-Powered Tank Royale Hackathon! This guide will help you set up everything you need to build and battle your robot tank.

## What is Tank Royale?

Tank Royale is a programming game where you code a robot tank to battle against other tanks in a virtual arena. Your bot will move, scan for enemies, and fire autonomously - you write the strategy, then watch it fight!

## Prerequisites

### 1. Install Java

Tank Royale requires Java 11 or newer.

**Check if you have Java:**
```bash
java -version
```

**If you don't have Java, install it:**

**macOS (with Homebrew):**
```bash
# Install Java
brew install openjdk@21

# Add Java to your PATH permanently
echo 'export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"' >> ~/.zshrc

# Apply changes to current terminal (or restart terminal)
source ~/.zshrc

# Verify installation
java -version
```

**macOS (without Homebrew):**
Download from: https://adoptium.net/

**Windows:**
Download from: https://adoptium.net/

**Linux:**
```bash
sudo apt update
sudo apt install openjdk-21-jdk
```

### 2. Download Tank Royale

1. Create a directory for Tank Royale:
   ```bash
   mkdir tank-royale
   cd tank-royale
   ```

2. Download the GUI (v0.33.1):
   ```bash
   curl -L -O https://github.com/robocode-dev/tank-royale/releases/download/v0.33.1/robocode-tankroyale-gui-0.33.1.jar
   ```

3. Download Java sample bots:
   ```bash
   curl -L -O https://github.com/robocode-dev/tank-royale/releases/download/v0.33.1/sample-bots-java-0.33.1.zip
   unzip sample-bots-java-0.33.1.zip
   ```

### 3. Launch Tank Royale

```bash
java -jar robocode-tankroyale-gui-0.33.1.jar
```

A GUI window should appear with "Robocode Tank Royale" title.

### 4. Configure Bot Directory

1. In the GUI, go to **Config → Bot Root Directories**
2. Click **Add** and select your `tank-royale` directory
3. Click **OK**

### 5. Test Your Setup

1. Go to **Battle → Start Battle**
2. Select 3-5 bots from the list (try: MyFirstBot, SpinBot, Walls, Fire, Corners)
3. Click **Start Battle**
4. Watch the battle! If you see tanks fighting, you're all set! 🎉

## Creating Your First Bot

### Bot Structure

Each bot needs 3 files in its own directory:

1. **YourBot.java** - Your bot's code
2. **YourBot.json** - Bot metadata
3. **YourBot.sh** - Launch script (also create .cmd for Windows compatibility)

### Starter Template

Create a directory `MyBot` in your `tank-royale` folder with these files:

**MyBot.java:**
```java
import dev.robocode.tankroyale.botapi.*;
import dev.robocode.tankroyale.botapi.events.*;

public class MyBot extends Bot {

    public static void main(String[] args) {
        new MyBot().start();
    }

    @Override
    public void run() {
        while (isRunning()) {
            forward(100);
            turnGunRight(360);
            back(100);
            turnGunRight(360);
        }
    }

    @Override
    public void onScannedBot(ScannedBotEvent e) {
        fire(1);
    }

    @Override
    public void onHitByBullet(HitByBulletEvent e) {
        turnRight(90);
        forward(50);
    }
}
```

**MyBot.json:**
```json
{
  "name": "My Bot",
  "version": "1.0",
  "authors": ["Your Name"],
  "description": "My awesome tank bot",
  "countryCodes": ["no"],
  "platform": "JVM",
  "programmingLang": "Java 11"
}
```

**MyBot.sh:**
```bash
#!/bin/sh
java -cp ../lib/robocode-tankroyale-bot-api-0.33.1.jar MyBot.java
```

**MyBot.cmd:**
```cmd
java -cp ../lib/robocode-tankroyale-bot-api-0.33.1.jar MyBot.java
```

Make the shell script executable:
```bash
chmod +x MyBot.sh
```

## Using AI Tools (Claude Code / GitHub Copilot)

### Helpful Prompts

**Getting started:**
- "Help me create a Tank Royale bot that circles around the arena while scanning for enemies"
- "Improve my bot's targeting by calculating bullet travel time"
- "Add defensive movement when my bot is hit"

**Strategy improvements:**
- "Implement predictive targeting based on enemy velocity"
- "Add wall avoidance to prevent getting stuck"
- "Create a state machine for different battle phases"

**Debugging:**
- "My bot keeps hitting walls, can you help fix the movement logic?"
- "Why isn't my bot firing at enemies?"

### Bot API Key Methods

**Movement:**
- `forward(distance)` - Move forward
- `back(distance)` - Move backward
- `turnLeft(degrees)` / `turnRight(degrees)` - Turn tank
- `turnGunLeft(degrees)` / `turnGunRight(degrees)` - Turn gun
- `turnRadarLeft(degrees)` / `turnRadarRight(degrees)` - Turn radar

**Combat:**
- `fire(power)` - Fire bullet (power: 0.1 to 3.0)

**Information:**
- `getX()` / `getY()` - Your position
- `getDirection()` - Your heading
- `getGunDirection()` / `getRadarDirection()` - Gun/radar heading
- `getEnergy()` - Your energy level

**Event Handlers (override these):**
- `onScannedBot(ScannedBotEvent e)` - When you scan an enemy
- `onHitByBullet(HitByBulletEvent e)` - When hit by a bullet
- `onHitWall(HitWallEvent e)` - When you hit a wall
- `onHitBot(HitBotEvent e)` - When you collide with another bot

## Strategy Ideas

1. **Corners Bot** - Stay in corners for protection
2. **Spinner** - Spin in place while scanning and firing
3. **Wall Hugger** - Follow walls around the arena
4. **Predictive Shooter** - Calculate where enemies will be
5. **Dodger** - Move erratically to avoid bullets
6. **Ramming Bot** - Chase and ram enemies
7. **Sniper** - Stay far away and pick off enemies

## Troubleshooting

**"Could not find or load main class"**
- Check that your .sh/.cmd script uses the correct JAR path
- Make sure you're using the explicit JAR name, not wildcards

**Bot not appearing in GUI**
- Verify the bot directory is added in Config → Bot Root Directories
- Check that all three files (.java, .json, .sh) exist
- Make sure the .sh script is executable (`chmod +x YourBot.sh`)

**Compilation errors**
- Read the error message carefully - Java errors are descriptive
- Check your imports: `import dev.robocode.tankroyale.botapi.*;`
- Make sure your class name matches your filename

**Bot doesn't move/fire**
- Check that your `run()` method has a `while(isRunning())` loop
- Verify you're calling movement/fire methods
- Make sure event handlers are annotated with `@Override`

## Resources

- **Tank Royale Documentation:** https://robocode-dev.github.io/tank-royale/
- **API Reference:** https://robocode-dev.github.io/tank-royale/api/java/
- **Sample Bots:** Look in the extracted sample-bots folders for examples
- **GitHub Repository:** https://github.com/robocode-dev/tank-royale

## Hackathon Day

### Before You Arrive
- ✅ Java installed and working
- ✅ Tank Royale GUI launches successfully
- ✅ You can run a test battle with sample bots
- ✅ You've created and tested a simple bot

### What to Bring
- Laptop with everything installed
- Charger
- Your creativity and competitive spirit!

### Schedule
- **0:00-0:15** - Welcome, rules, and quick demo
- **0:15-3:30** - Bot development time
- **3:30-4:00** - Tournament finals and awards

Good luck, and may your bot reign supreme! 🤖⚔️🏆
