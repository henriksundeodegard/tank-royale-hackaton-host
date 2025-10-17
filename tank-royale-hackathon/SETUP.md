# Tank Royale Hackathon - Setup Guide

Welcome to the AI-Powered Tank Royale Hackathon! This guide will help you set up everything you need to build and battle your robot tank.

## What is Tank Royale?

Tank Royale is a programming game where you code a robot tank to battle against other tanks in a virtual arena. Your bot will move, scan for enemies, and fire autonomously - you write the strategy, then watch it fight!

## Recommended Setup Method

**🤖 Best way to get started:** Simply say **"Help"** or **"Get started"** to your AI assistant (Claude Code or GitHub Copilot)!

Your AI assistant will guide you through:
1. **Team setup** - Pick team number, name, and bot colors
2. **Java verification** - Check if Java is installed
3. **GUI learning** - Run your first battle with sample bots
4. **Bot creation** - Generate your team's bot

**This is the easiest and most interactive way to get started!**

## Manual Setup (If Preferred)

### Prerequisites Summary

✅ **Java 11+** installed
✅ **This repository** cloned (you should already have it!)
✅ **10 minutes** for setup verification

**That's it!** Everything else (Tank Royale GUI, sample bots, sound files, documentation) is already included in this repository.

### Quick Setup (5 Steps)

### 1. Install Java

Tank Royale requires **Java 11 or newer**.

**Check if you have Java:**
```bash
java -version
```

**If you see Java 11+ (like "11.0.x", "17.0.x", or "21.0.x"), you're good! Skip to step 2.**

**If you need to install Java:**

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

### 2. Clone This Repository

You should already have this repository! If not:

```bash
git clone [repository-url]
cd tank-royale-hackathon
```

**What's included:**
- ✅ Tank Royale GUI (4.4 MB)
- ✅ Bot API JAR (800 KB)
- ✅ 14 sample bots
- ✅ Sound files
- ✅ Helper scripts
- ✅ All documentation

Everything is ready to go - no manual downloads needed!

### 3. Verify Your Setup

Run the verification script:

```bash
./scripts/verify-setup.sh
```

This checks:
- ✅ Java is installed and correct version
- ✅ Tank Royale files are present
- ✅ Scripts are executable

### 4. Launch Tank Royale

```bash
./scripts/start-gui.sh
```

A GUI window should appear with "Robocode Tank Royale" title.

### 5. Test Your Setup

**Bot directories are pre-configured!** The GUI automatically knows where to find:
- Sample bots (14 examples in `tank-royale/sample-bots/`)
- Team workspaces (`tank-royale/teams/team1-4/`)

No manual configuration needed!

**Run your first battle:**

1. Go to **Battle → Start Battle**
2. **Boot bots** (Row 2 of dialog):
   - In "Bot Directories (local only)" section, select 3-5 bots
   - Try: MyFirstBot, SpinBot, Walls, Fire, Corners
   - Click the **→** button to boot them
   - They will appear in "Booted Bots" on the right
3. **Select battle participants** (Row 3 of dialog):
   - In "Joined Bots (local/remote)" section, select the booted bots you want to fight
   - Click the **→** button to add them to "Selected Bots (battle participants)"
4. Click **Start Battle** button at the bottom
5. Watch the battle! If you see tanks fighting, you're all set! 🎉

## Creating Your First Bot

### Quick Bot Generation

Use the helper script to create a bot with all required files:

```bash
./scripts/create-bot.sh YourTeamName
```

This automatically creates:
- ✅ All 3 required files (`.java`, `.json`, `.sh`, `.cmd`)
- ✅ Correct file structure
- ✅ Executable permissions set
- ✅ Ready to customize and test

### Bot Structure

Each bot needs exactly 3 files in its own directory:

1. **YourBot.java** - Your bot's code
2. **YourBot.json** - Bot metadata
3. **YourBot.sh** (and `.cmd` for Windows) - Launch script

### Manual Bot Creation (Optional)

If you prefer to create files manually, here's a template.

Create a directory `MyBot` in your `tank-royale/teams/teamN/` folder with these files:

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
