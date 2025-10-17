# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a preparation workspace for an AI-powered Tank Royale hackathon. The goal is to host a 4-hour coding competition where 12 participants (in 4 teams of 3) use AI tools (Claude Code/GitHub Copilot) to build competitive robot tank bots that battle autonomously.

## Project Structure

```
ai_hackaton_2025/
├── SETUP_LOG.md              # Complete setup verification log
├── PARTICIPANT_SETUP_GUIDE.md # Guide for hackathon participants
└── tank-royale/               # Tank Royale installation
    ├── robocode-tankroyale-gui-0.33.1.jar  # GUI application
    ├── lib/                   # Bot API JAR
    │   └── robocode-tankroyale-bot-api-0.33.1.jar
    ├── HackatonBot/           # Example custom bot
    └── [Sample bots]/         # MyFirstBot, SpinBot, Walls, etc.
```

## Tank Royale Bot Development

### Bot Structure
Each bot requires 3 files in its own directory:

1. **BotName.java** - Bot logic (extends `Bot` class)
2. **BotName.json** - Metadata (name, version, authors, etc.)
3. **BotName.sh** / **BotName.cmd** - Launch scripts

### Creating a New Bot

```bash
# 1. Create bot directory in tank-royale/
mkdir tank-royale/YourBotName

# 2. Create Java file with basic structure
# 3. Create JSON metadata file
# 4. Create launch scripts (.sh and .cmd)
chmod +x tank-royale/YourBotName/YourBotName.sh
```

### Bot Java Template

```java
import dev.robocode.tankroyale.botapi.*;
import dev.robocode.tankroyale.botapi.events.*;

public class YourBotName extends Bot {
    public static void main(String[] args) {
        new YourBotName().start();
    }

    @Override
    public void run() {
        while (isRunning()) {
            // Main bot loop
        }
    }

    @Override
    public void onScannedBot(ScannedBotEvent e) {
        // React to enemy detection
    }

    @Override
    public void onHitByBullet(HitByBulletEvent e) {
        // React to being hit
    }
}
```

### Launch Script Format

**Important:** Use explicit JAR path, not wildcards. The wildcard pattern `../lib/*` causes issues with the GUI's script interpreter.

**Correct:**
```bash
#!/bin/sh
java -cp ../lib/robocode-tankroyale-bot-api-0.33.1.jar YourBotName.java
```

**Incorrect:**
```bash
#!/bin/sh
java -cp ../lib/* YourBotName.java  # Don't use wildcard
```

### Testing Bots

**Launch GUI:**
```bash
cd tank-royale
java -jar robocode-tankroyale-gui-0.33.1.jar
```

**Configure bot directory in GUI:**
1. Config → Bot Root Directories
2. Add the `tank-royale` directory
3. Bots will appear in Battle → Start Battle

**Run a bot manually (for debugging):**
```bash
cd tank-royale/YourBotName
java -cp ../lib/robocode-tankroyale-bot-api-0.33.1.jar YourBotName.java
```

Note: Manual runs will fail with "ClassNotFoundException" if the Tank Royale server isn't running - this is expected. Use the GUI for actual battles.

## Key Tank Royale API Methods

**Movement:**
- `forward(distance)`, `back(distance)`
- `turnLeft(degrees)`, `turnRight(degrees)`
- `turnGunLeft(degrees)`, `turnGunRight(degrees)`
- `turnRadarLeft(degrees)`, `turnRadarRight(degrees)`

**Combat:**
- `fire(power)` - Power range: 0.1 to 3.0

**Information:**
- `getX()`, `getY()` - Current position
- `getDirection()` - Tank heading (0-360)
- `getEnergy()` - Current energy level

**Event Handlers (override in Bot subclass):**
- `onScannedBot(ScannedBotEvent e)` - Enemy detected by radar
- `onHitByBullet(HitByBulletEvent e)` - Bot hit by enemy bullet
- `onHitWall(HitWallEvent e)` - Bot collided with wall
- `onHitBot(HitBotEvent e)` - Bot collided with another bot

## Architecture Notes

### Tank Royale vs Original Robocode

This project uses **Tank Royale v0.33.1** (not original Robocode):
- Modern network-based architecture (WebSocket communication)
- Multi-language support (Java, Kotlin, C#, Python)
- More actively maintained
- Repository: https://github.com/robocode-dev/tank-royale

### Bot Compilation

Tank Royale uses Java's source-file execution mode (Java 11+), which automatically compiles `.java` files when run. No separate build step is needed.

### Sample Bots Reference

Review existing sample bots for strategy examples:
- **MyFirstBot** - Basic movement and shooting
- **Walls** - Wall-following strategy (strong performer)
- **SpinBot** - Spinning strategy
- **Corners** - Corner-camping strategy
- **Fire, RamFire, TrackFire** - Different targeting approaches
- **PaintingBot** - Demonstrates graphics API usage

## Hackathon Context

**Participants:** 12 people (4 teams of 3)
**Duration:** 4 hours total
- 0:00-0:15: Intro and rules
- 0:15-3:30: Development time
- 3:30-4:00: Tournament

**Prerequisites:** Participants should have Java 11+ and Tank Royale installed before the event (see PARTICIPANT_SETUP_GUIDE.md).

## Common Issues

1. **Bot not appearing in GUI:** Verify bot directory is configured, all 3 files exist, and .sh script is executable
2. **Launch script errors:** Use explicit JAR path, not `../lib/*` wildcard
3. **Compilation errors:** Check imports (`import dev.robocode.tankroyale.botapi.*;`) and that class name matches filename
4. **Bot doesn't move:** Ensure `run()` method has `while(isRunning())` loop

## Resources

- **Tank Royale Docs:** https://robocode-dev.github.io/tank-royale/
- **Java API Reference:** https://robocode-dev.github.io/tank-royale/api/java/
- **GitHub Repo:** https://github.com/robocode-dev/tank-royale
