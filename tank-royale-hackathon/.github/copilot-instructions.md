# GitHub Copilot Instructions - Tank Royale Hackathon

This file provides guidance to GitHub Copilot when working with code in this repository.

## Repository Purpose

This is the **participant repository** for an AI-powered Tank Royale hackathon. You're helping a participant build a competitive robot tank bot for a 4-hour coding competition.

**Important:** This is the participant workspace, not the host workspace. Focus on bot development and strategy.

## AI Assistant Onboarding Workflow

When participants first engage with you, they may not have configured their team yet. Your role is to guide them through an interactive onboarding experience.

### Step 0: Detect Operating System

**First, detect the participant's OS:**
- Run `uname -s` or check for Windows environment
- **macOS** = Darwin
- **Linux** = Linux
- **Windows** = use Git Bash or WSL for scripts
- Provide platform-specific commands throughout

### Step 1: Initial Engagement

When a participant says "Help", "Get started", or similar, first detect OS, then check if `.team-config` exists and has valid configuration.

**If team is NOT configured:**
1. Welcome them to the hackathon
2. Explain you'll help them set up their team
3. Ask which team they are (1, 2, 3, or 4)
4. Brainstorm a team name with them (have fun with it!)
5. Discuss color preferences for their bot
6. Run the setup command with their choices

**Example conversation:**
- User: "Help"
- You: "Welcome to Tank Royale! Let's set up your team. Which team number are you? (1-4)"
- User: "Team 2"
- You: "Great! Let's pick a team name. Here are some ideas: FireStorm, CodeCrusaders, BotBlasters... Or what vibe do you want?"
- User: "FireStorm sounds cool"
- You: "Perfect! Now for colors. I'll create a custom fiery HEX color scheme: Body: #FF4500 (OrangeRed), Turret: #FF6B00 (Blaze Orange), Radar: #FFD700 (Gold), Bullets: #FFFFFF (White). Sound good?"
- User: "Yes!"
- You: [Run: ./scripts/setup-team.sh 2 "FireStorm" "#FF4500" "#FF6B00" "#FFD700" "#FFFFFF"]

### Step 2: Running Team Setup

**Platform-specific commands:**

**macOS/Linux:**
```bash
./scripts/setup-team.sh <team_number> <team_name> [body_color] [turret_color] [radar_color] [bullet_color]
```

**Windows (Git Bash):**
```bash
bash scripts/setup-team.sh <team_number> <team_name> [body_color] [turret_color] [radar_color] [bullet_color]
```

**Examples:**
```bash
./scripts/setup-team.sh 1 "ThunderBots"
./scripts/setup-team.sh 2 "FireStorm" "#FF4500" "#FF6B00" "#FFD700" "#FFFFFF"
./scripts/setup-team.sh 3 "CodeNinjas" "#00C800" "#00A000" "#7FFF00" "#32CD32"
```

**Colors (PREFER HEX):**
- **HEX format (PREFERRED):** #RRGGBB (e.g., #FF4500, #1E90FF, #00C896)
- Named colors (basic): RED, BLUE, GREEN, YELLOW, ORANGE, PURPLE, CYAN, MAGENTA, WHITE, BLACK

**Windows Note:** If Git Bash not available, guide them to install Git for Windows.

### Step 3: Verify Setup

1. Run `./scripts/verify-setup.sh` to confirm
2. Celebrate success!
3. Explain next: learn to run battles (before creating bot)

### Step 4: GUI and First Battle (CRITICAL!)

**Before creating their bot, teach them to run battles.** This is essential for iterative testing.

**Guide them:**

1. **Explain why:**
   "Let's learn how to run battles first. You'll test your bot many times today, so let's practice with sample bots."

2. **Launch GUI:**
   - **macOS/Linux:** `./scripts/start-gui.sh`
   - **Windows (Git Bash):** `bash scripts/start-gui.sh`
   - **Windows (Direct):** `cd tank-royale && java -jar robocode-tankroyale-gui-0.33.1.jar`

3. **Walk through battle setup:**
   - Click "Battle → Start Battle"
   - Dialog has 4 rows:
     - Row 1: Setup Rules (leave defaults)
     - Row 2: Bot Directories / Booted Bots
     - Row 3: Joined Bots / Selected Bots
     - Row 4: Bot Info

4. **Boot and select bots:**
   - **Row 2:** Select 3-5 sample bots (Walls, Fire, SpinBot) → Click → to boot
   - **Row 3:** Select booted bots → Click → to add to battle
   - Click "Start Battle" button

5. **After battle:**
   - Point out different strategies (Walls is strong!)
   - Emphasize: "This is how you'll test your bot"
   - Explain the dev cycle:
     1. Edit code
     2. Battle → Start Battle
     3. Boot your bot
     4. Select opponents
     5. Start Battle

### Step 5: Create First Bot

**Now** create their bot:
1. "Now that you know how to test, let's create your bot!"
2. Discuss bot name
3. Run platform-specific command:
   - **macOS/Linux:** `./scripts/create-bot.sh <BotName>`
   - **Windows:** `bash scripts/create-bot.sh <BotName>`
4. Show location: `tank-royale/teams/team<N>/<BotName>/`
5. Explain testing:
   - **All platforms:** Best to test via GUI
   - **macOS/Linux:** Can also run `./<BotName>.sh` for compile check
6. Suggest immediate test: "Want to battle with your new bot?"

### Color Scheme Suggestions
**IMPORTANT:** Always prefer HEX color codes (#RRGGBB) over named colors!

**Team 1 - Cool/Tech:**
- ThunderBots: Body: #1E90FF, Turret: #4169E1, Radar: #00CED1, Bullets: #FFD700
- IceBreakers: Body: #00CED1, Turret: #E0FFFF, Radar: #87CEEB, Bullets: #FFFFFF

**Team 2 - Warm/Aggressive:**
- FireStorm: Body: #FF4500, Turret: #FF6B00, Radar: #FFD700, Bullets: #FFFFFF
- Inferno: Body: #FF8C00, Turret: #DC143C, Radar: #FFFF00, Bullets: #FF0000

**Team 3 - Nature/Stealth:**
- CodeNinjas: Body: #00C800, Turret: #00A000, Radar: #7FFF00, Bullets: #32CD32
- ForestForce: Body: #228B22, Turret: #006400, Radar: #9ACD32, Bullets: #ADFF2F

**Team 4 - Mystic/Royal:**
- VoidVikings: Body: #4B0082, Turret: #2F004F, Radar: #8A2BE2, Bullets: #00FFFF
- RoyalRobotics: Body: #6A0DAD, Turret: #9370DB, Radar: #DDA0DD, Bullets: #FFD700

### Important

- **Detect OS first** - Know their platform before giving commands
- **Platform-specific commands** - Adjust syntax for their OS
- **Prefer HEX color codes** - Always suggest HEX colors (#RRGGBB) instead of named colors for maximum customization
- **Never use interactive prompts** - Always provide script parameters
- **Be enthusiastic** - Make it fun!
- **Brainstorm together** - Team names and colors are part of the experience
- **Check `.team-config` first** - Don't repeat setup if already done
- **Windows needs Git Bash** - Guide them to install if missing

After setup, team configuration will be appended to this file.

## Repository Structure

```
tank-royale-hackathon/              # You are here (participant repo)
├── README.md                       # Quick start guide
├── SETUP.md                        # Setup instructions
├── RULES.md                        # Competition rules
├── SUBMISSION.md                   # Submission guide
├── CLAUDE.md                       # Claude Code context
├── .github/
│   └── copilot-instructions.md     # This file
├── scripts/
│   ├── start-gui.sh                # Launch Tank Royale GUI
│   ├── verify-setup.sh             # Verify setup
│   └── create-bot.sh               # Generate bot template
├── docs/
│   ├── STRATEGIES.md               # Strategy patterns
│   ├── API_QUICK_REFERENCE.md      # API reference
│   └── TROUBLESHOOTING.md          # Common issues
├── sounds/                         # Battle sound effects
└── tank-royale/
    ├── robocode-tankroyale-gui-0.33.1.jar  # GUI application
    ├── lib/
    │   └── robocode-tankroyale-bot-api-0.33.1.jar  # Bot API
    ├── sample-bots/                # 14 reference examples
    │   ├── MyFirstBot/             # Basic starter
    │   ├── SpinBot/                # Spinning strategy
    │   ├── Walls/                  # Wall-following (strong!)
    │   ├── Corners/                # Corner camping
    │   ├── Fire/                   # Basic combat
    │   ├── Crazy/                  # Random movement
    │   ├── RamFire/                # Aggressive ramming
    │   ├── TrackFire/              # Advanced tracking
    │   └── [6 more bots...]
    └── teams/                      # Participant workspaces
        ├── team1/
        ├── team2/
        ├── team3/
        └── team4/
```

## Tank Royale Bot Development

### Quick Bot Creation

Use the helper script to generate a complete bot:

```bash
./scripts/create-bot.sh YourTeamName
```

This creates all 3 required files with correct structure in an available team directory.

### Bot Structure

Each bot requires exactly 3 files in its own directory:

1. **BotName.java** - Bot logic (extends `Bot` class)
2. **BotName.json** - Metadata (name, version, authors, etc.)
3. **BotName.sh** / **BotName.cmd** - Launch scripts

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
            forward(100);
            turnGunRight(360);  // Scan for enemies
        }
    }

    @Override
    public void onScannedBot(ScannedBotEvent e) {
        // React to enemy detection
        fire(2);
    }

    @Override
    public void onHitByBullet(HitByBulletEvent e) {
        // React to being hit
        turnRight(90);
        forward(100);
    }
}
```

### Launch Script Format

**Critical:** Use explicit JAR path, not wildcards. The wildcard pattern `../lib/*` causes issues with Tank Royale's script interpreter.

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
./scripts/start-gui.sh
```

**Note:** Bot directories are automatically configured by `verify-setup.sh`. All sample bots and team workspaces will be available immediately - no manual configuration needed!

**Start a battle:**
1. Battle → Start Battle
2. **Boot bots:** In "Bot Directories (local only)", select bots → click → to boot them
3. **Select participants:** In "Joined Bots", select booted bots → click → to add to battle
4. Click "Start Battle" button at the bottom

**Important:** You must boot bots before you can select them for a battle!

**Test bot manually (for debugging):**
```bash
cd tank-royale/teams/teamN
./YourBotName.sh
```

Note: Manual runs will wait for Tank Royale server (from GUI). Use the GUI for actual battles.

## Key Tank Royale API Methods

**Movement:**
- `forward(distance)`, `back(distance)`
- `turnLeft(degrees)`, `turnRight(degrees)`
- `turnGunLeft(degrees)`, `turnGunRight(degrees)`
- `turnRadarLeft(degrees)`, `turnRadarRight(degrees)`

**Combat:**
- `fire(power)` - Power range: 0.1 to 3.0
  - Higher power = more damage, slower bullet
  - Lower power = less damage, faster bullet

**Information:**
- `getX()`, `getY()` - Current position
- `getDirection()` - Tank heading (0-360°)
- `getGunDirection()`, `getRadarDirection()` - Gun/radar heading
- `getEnergy()` - Current energy level (0-100)
- `getEnemyCount()` - Number of enemies remaining

**Event Handlers (override in Bot subclass):**
- `onScannedBot(ScannedBotEvent e)` - Enemy detected by radar
- `onHitByBullet(HitByBulletEvent e)` - Bot hit by enemy bullet
- `onHitWall(HitWallEvent e)` - Bot collided with wall
- `onHitBot(HitBotEvent e)` - Bot collided with another bot
- `onBulletHit(BulletHitEvent e)` - Your bullet hit an enemy
- `onBotDeath(BotDeathEvent e)` - An enemy died

## Strategy Development

### Basic Strategies (Good Starting Points)

**1. Spinner Bot:**
```java
@Override
public void run() {
    while (isRunning()) {
        turnGunRight(360);  // Continuous scan
    }
}

@Override
public void onScannedBot(ScannedBotEvent e) {
    fire(2);  // Fire when you see anyone
}
```

**2. Circle Mover:**
```java
@Override
public void run() {
    while (isRunning()) {
        forward(50);
        turnRight(10);  // Creates circular motion
        turnGunRight(360);  // Keep scanning
    }
}
```

**3. Wall Follower:**
```java
@Override
public void run() {
    while (isRunning()) {
        forward(100);
        turnRight(90);
    }
}
```

### Advanced Concepts

For more advanced strategies, see:
- **docs/STRATEGIES.md** - Complete strategy guide with code examples
- **docs/API_QUICK_REFERENCE.md** - Full API reference
- **tank-royale/sample-bots/** - 14 working examples

## Common Bot Development Tasks

### 1. Creating a New Bot

```bash
# Use the helper script
./scripts/create-bot.sh AwesomeBot

# Edit the generated file
# Located in: tank-royale/teams/teamN/AwesomeBot.java
```

### 2. Improving Targeting

```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    // Aim gun at enemy
    double bearing = getDirection() + e.getBearing();
    double gunTurn = normalizeAngle(bearing - getGunDirection());
    turnGunRight(gunTurn);

    // Fire with power based on distance
    double power = Math.min(3.0, 400.0 / e.getDistance());
    fire(power);
}
```

### 3. Adding Wall Avoidance

```java
@Override
public void run() {
    while (isRunning()) {
        // Check if near walls (assuming 800x600 arena)
        double margin = 50;
        if (getX() < margin || getX() > 800 - margin ||
            getY() < margin || getY() > 600 - margin) {
            back(20);
            turnRight(90);
        }
        forward(50);
    }
}
```

### 4. Dodging Bullets

```java
@Override
public void onHitByBullet(HitByBulletEvent e) {
    // Turn perpendicular to bullet direction
    double bearing = calcBearing(e.getBullet().getDirection());
    turnRight(90 - bearing);
    forward(100);
}
```

## Hackathon Context

**Competition Details:**
- **Teams:** 4 teams of 3 participants
- **Duration:** 4 hours total
  - 0:00-0:15: Introduction and rules
  - 0:15-3:30: Development time (3h 15m)
  - 3:30-3:45: Bot submission (15m)
  - 3:45-4:00: Tournament (15m)

**Scoring:**
- 1st place: 3 points
- 2nd place: 2 points
- 3rd place: 1 point
- 4th place: 0 points

**Rules:**
- One bot per team
- Max 1000 lines of code
- No external libraries
- Must compile without errors

See RULES.md for complete rules.

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
- **VelocityBot** - Predictive targeting
- **PaintingBot** - Demonstrates graphics API usage

All sample bots are in `tank-royale/sample-bots/`.

## Common Issues

1. **Bot not appearing in GUI**
   - Verify bot directory is configured: Config → Bot Root Directories
   - Check all 3 files exist (.java, .json, .sh)
   - Ensure .sh script is executable: `chmod +x YourBot.sh`

2. **Launch script errors**
   - Use explicit JAR path, not `../lib/*` wildcard
   - Correct: `../lib/robocode-tankroyale-bot-api-0.33.1.jar`

3. **Compilation errors**
   - Check imports: `import dev.robocode.tankroyale.botapi.*;`
   - Verify class name matches filename
   - Look at error message - Java errors are descriptive

4. **Bot doesn't move**
   - Ensure `run()` method has `while(isRunning())` loop
   - Check that movement commands are being called

5. **Bot hits walls constantly**
   - Add wall avoidance logic (see docs/STRATEGIES.md)
   - Use `onHitWall()` event handler

For more troubleshooting, see docs/TROUBLESHOOTING.md.

## Resources

**In This Repository:**
- **SETUP.md** - Setup instructions
- **RULES.md** - Competition rules
- **SUBMISSION.md** - How to submit
- **docs/STRATEGIES.md** - Strategy guide with code examples
- **docs/API_QUICK_REFERENCE.md** - Complete API reference
- **docs/TROUBLESHOOTING.md** - Common issues and fixes
- **tank-royale/sample-bots/** - 14 working examples

**External Resources:**
- **Tank Royale Docs:** https://robocode-dev.github.io/tank-royale/
- **Java API Reference:** https://robocode-dev.github.io/tank-royale/api/java/
- **Tutorial:** https://robocode-dev.github.io/tank-royale/tutorial/my-first-bot
- **GitHub Repo:** https://github.com/robocode-dev/tank-royale

## Tips for Success

1. **Start simple** - Get a working bot first, then improve
2. **Test frequently** - Run battles after each change
3. **Study sample bots** - Learn from working examples
4. **Use the API docs** - Check docs/API_QUICK_REFERENCE.md
5. **Avoid walls** - Wall hits cost energy
6. **Manage energy** - Don't fire too much, save energy for movement
7. **Keep radar spinning** - You can't shoot what you can't see
8. **Have fun!** - Experiment with different strategies

Good luck, and may your bot reign supreme! 🤖⚔️🏆
