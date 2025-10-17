# GitHub Copilot Instructions - Host Workspace

This workspace is for **hosting** a Tank Royale AI Hackathon. You're helping organize and run the event, not developing bots for competition.

## Workspace Overview

**Current Directory:** `ai_hackaton_2025/` - Host preparation workspace
**Participant Repository:** `tank-royale-hackathon/` - What participants will clone

### What's in This Workspace

```
ai_hackaton_2025/                    # You are here (host workspace)
├── HOST_NOTES.md                    # Event day guide
├── PARTICIPANT_REPO_STATUS.md       # Participant repo status
├── SETUP_LOG.md                     # Setup journey
├── IMPROVEMENTS.md                  # Future ideas
└── tank-royale-hackathon/          # Participant repository (complete)
```

## Common Tasks

### Event Planning
- **File:** `HOST_NOTES.md`
- Update event details (date, location, hosts)
- Refine timeline and checklists
- Adjust scoring rules

### Participant Repository Management
- **File:** `PARTICIPANT_REPO_STATUS.md`
- Review what's included for participants
- Verify completeness before publishing

### Future Planning
- **File:** `IMPROVEMENTS.md`
- Add lessons learned
- Document ideas for next event

## Tank Royale Quick Reference

### Java Requirements
- Java 11+ required
- Tested with OpenJDK 21
- Install via Homebrew on macOS: `brew install openjdk@21`

### Bot Structure
Each bot needs 3 files:
1. `BotName.java` - Code (extends `Bot` class)
2. `BotName.json` - Metadata
3. `BotName.sh` - Launch script

### Critical: Launch Script Format

```bash
# ✅ CORRECT (use explicit JAR path):
java -cp ../lib/robocode-tankroyale-bot-api-0.33.1.jar BotName.java

# ❌ WRONG (don't use wildcard):
java -cp ../lib/* BotName.java
```

### Bot Development Basics

```java
import dev.robocode.tankroyale.botapi.*;
import dev.robocode.tankroyale.botapi.events.*;

public class YourBot extends Bot {
    public static void main(String[] args) {
        new YourBot().start();
    }

    @Override
    public void run() {
        while (isRunning()) {
            forward(100);
            turnGunRight(360);
        }
    }

    @Override
    public void onScannedBot(ScannedBotEvent e) {
        fire(2);  // Power: 0.1 to 3.0
    }

    @Override
    public void onHitByBullet(HitByBulletEvent e) {
        turnRight(90);
        forward(100);
    }
}
```

## Event Timeline

**Total Duration:** 4 hours

- **0:00-0:15** - Introduction and demo
- **0:15-3:30** - Development time (3h 15m)
- **3:30-3:45** - Bot submission (15m)
- **3:45-4:00** - Tournament (15m)

## Scoring System

Per battle placement:
- 1st: 3 points
- 2nd: 2 points
- 3rd: 1 point
- 4th: 0 points

## Publishing Participant Repository

When ready to share with participants:

```bash
cd tank-royale-hackathon
git init
git add .
git commit -m "Initial Tank Royale Hackathon setup"
git remote add origin [repo-url]
git push -u origin main
```

## Key API Methods

**Movement:**
- `forward(distance)`, `back(distance)`
- `turnLeft(degrees)`, `turnRight(degrees)`
- `turnGunLeft(degrees)`, `turnGunRight(degrees)`
- `turnRadarLeft(degrees)`, `turnRadarRight(degrees)`

**Combat:**
- `fire(power)` - Power: 0.1 (weak, fast) to 3.0 (strong, slow)

**Information:**
- `getX()`, `getY()` - Position
- `getDirection()` - Heading (0-360°)
- `getEnergy()` - Current energy (0-100)
- `getEnemyCount()` - Enemies remaining

**Event Handlers:**
- `onScannedBot(ScannedBotEvent e)` - Enemy detected
- `onHitByBullet(HitByBulletEvent e)` - Hit by bullet
- `onHitWall(HitWallEvent e)` - Wall collision
- `onHitBot(HitBotEvent e)` - Bot collision

## Testing Setup

```bash
# From participant repo
cd tank-royale-hackathon

# Verify setup
./scripts/verify-setup.sh

# Launch GUI
./scripts/start-gui.sh

# Create test bot
./scripts/create-bot.sh TestBot
```

## Resources

**For Hosts:**
- HOST_NOTES.md - Complete event guide
- https://robocode-dev.github.io/tank-royale/

**For Participants (in their repo):**
- SETUP.md - Installation
- RULES.md - Competition rules
- docs/STRATEGIES.md - Strategy patterns
- docs/API_QUICK_REFERENCE.md - Full API reference
- docs/TROUBLESHOOTING.md - Common issues

## Important Notes

1. **This is the host workspace** - Don't confuse with participant repository
2. **Participant repo is in `tank-royale-hackathon/`** - That's what gets published
3. **Tank Royale v0.33.1** - Modern version, not classic Robocode
4. **Java 11+ required** - OpenJDK 21 recommended
5. **Launch scripts need explicit JAR paths** - No wildcards!

## Status

✅ Participant repository ready to publish
✅ All documentation complete
✅ Helper scripts functional
✅ Sample bots verified

Ready to host! 🚀
