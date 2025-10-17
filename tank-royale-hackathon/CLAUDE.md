# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is the **participant repository** for an AI-powered Tank Royale hackathon. You're helping a participant build a competitive robot tank bot for a 4-hour coding competition.

**Important:** This is the participant workspace, not the host workspace. Focus on bot development and strategy.

## AI Assistant Onboarding Workflow

When participants first engage with you, they may not have configured their team yet. Your role is to guide them through an interactive onboarding experience.

### Step 0: Detect Operating System (Do This First!)

**Before starting any setup, detect the participant's operating system:**

```bash
# Detect OS
uname -s 2>/dev/null || echo "Windows"
```

**Expected outputs:**
- `Darwin` = macOS
- `Linux` = Linux
- `Windows` or command not found = Windows

**Store this information and use it throughout the session to provide platform-specific commands.**

### Step 1: Initial Engagement

When a participant says "Help", "Get started", or similar, first detect their OS, then check if `.team-config` exists and has valid configuration:

```bash
# Check team configuration
cat .team-config 2>/dev/null || type .team-config 2>nul
```

**If team is NOT configured:**
1. Welcome them to the hackathon
2. Explain you'll help them set up their team
3. Ask which team they are (1, 2, 3, or 4)
4. Brainstorm a team name with them (have fun with it!)
5. Discuss color preferences for their bot
6. Run the setup command with their choices

**Example conversation flow:**
```
User: "Help"

You: "Welcome to the Tank Royale Hackathon! 🎮

I'm here to help you build a competitive robot tank. Let's start by setting up your team!

Which team number are you? (1, 2, 3, or 4)"

User: "We're team 2"

You: "Great! Team 2 it is. Now let's pick an awesome team name.

Here are some ideas:
- FireStorm
- CodeCrusaders
- BotBlasters
- TankTitans

Or tell me what kind of vibe you want and I'll suggest more!"

User: "Let's go with FireStorm"

You: "Excellent choice! 🔥 Now let's customize your bot's colors.

What colors would you like for your bot? I can suggest a color scheme, or you can choose:
- Body color (main tank color)
- Turret color (gun turret)
- Radar color (radar dome)
- Bullet color

Would you like me to suggest a fiery color scheme for FireStorm, or do you have preferences?"

User: "Suggest something fiery"

You: "Perfect! For FireStorm, I recommend:
- Body: RED (fierce and bold)
- Turret: ORANGE (hot flames)
- Radar: YELLOW (bright warning)
- Bullets: WHITE (scorching projectiles)

Sound good?"

User: "Yes!"

You: "Awesome! Let me set up your team now..."

[Run: ./scripts/setup-team.sh 2 "FireStorm" "RED" "ORANGE" "YELLOW" "WHITE"]
```

### Step 2: Running Team Setup

Use the `setup-team.sh` script with command-line arguments (NO interactive prompts).

**Platform-specific commands:**

**macOS/Linux:**
```bash
./scripts/setup-team.sh <team_number> <team_name> [body_color] [turret_color] [radar_color] [bullet_color]
```

**Windows (Git Bash recommended):**
```bash
bash scripts/setup-team.sh <team_number> <team_name> [body_color] [turret_color] [radar_color] [bullet_color]
```

**Windows (PowerShell - if Git Bash not available):**
```powershell
wsl bash scripts/setup-team.sh <team_number> <team_name> [body_color] [turret_color] [radar_color] [bullet_color]
```

**Examples:**
```bash
# Minimal (uses defaults: BLUE body, ORANGE radar, YELLOW bullets)
./scripts/setup-team.sh 1 "ThunderBots"

# Full color specification
./scripts/setup-team.sh 2 "FireStorm" "RED" "ORANGE" "YELLOW" "WHITE"

# Hex colors work too
./scripts/setup-team.sh 3 "CodeNinjas" "#00FF00" "#00AA00" "#FFFF00" "#FF00FF"
```

**Important:** If participant is on Windows without Git Bash or WSL, guide them to install Git Bash (comes with Git for Windows) as it's the easiest way to run the setup scripts.

**Available color names:** RED, BLUE, GREEN, YELLOW, ORANGE, PURPLE, CYAN, MAGENTA, WHITE, BLACK

**Color formats:**
- Named colors: `RED`, `BLUE`, etc.
- Hex colors: `#FF0000` or `FF0000`

### Step 3: Verify Setup

Once setup is complete:
1. Run `./scripts/verify-setup.sh` to confirm everything is configured
2. Celebrate success - team is ready!
3. Explain that next step is to learn how to run battles

### Step 4: Launch GUI and Run First Battle (CRITICAL!)

**Important:** Before creating their own bot, participants MUST learn how to run battles. This is essential for iterative development throughout the hackathon.

Guide them through this process:

1. **Explain the purpose:**
   "Before we create your bot, let's learn how to run battles. You'll need to test your bot frequently during the hackathon, so it's important to know this process first. We'll run a battle with existing sample bots to see how it works."

2. **Launch the GUI:**

   **macOS/Linux:**
   ```bash
   ./scripts/start-gui.sh
   ```

   **Windows (Git Bash):**
   ```bash
   bash scripts/start-gui.sh
   ```

   **Windows (PowerShell/CMD) - Direct Java:**
   ```cmd
   cd tank-royale
   java -jar robocode-tankroyale-gui-0.33.1.jar
   ```

   Explain: "This opens the Tank Royale battle arena where you'll test your bots."

3. **Walk through the battle setup process:**
   - "Click 'Battle → Start Battle' in the menu"
   - "You'll see a dialog with 4 rows. Let me explain each:"
     - Row 1: Setup Rules (you can leave defaults)
     - Row 2: Bot Directories and Booted Bots
     - Row 3: Joined Bots and Selected Bots
     - Row 4: Bot Info (shows selected bot details)

4. **Guide them through booting and selecting bots:**
   - **Boot bots (Row 2):**
     "On the left side you'll see 'Bot Directories (local only)' with many bots listed. Select 3-5 sample bots (try Walls, Fire, SpinBot). Click the → button to boot them. You'll see them appear in 'Booted Bots' on the right."

   - **Select participants (Row 3):**
     "Now in 'Joined Bots' on the left, select the booted bots you want in the battle. Click the → button to add them to 'Selected Bots' on the right. Aim for 3-4 bots."

   - **Start battle:**
     "Click the 'Start Battle' button at the bottom. Watch the action! 🎮"

5. **After the battle:**
   - "See how the bots fought? Notice their different strategies?"
   - "The Walls bot (black) is particularly strong - it follows the walls."
   - "Now you know how to test! When we create your bot, you'll run it the same way."
   - "You can run as many test battles as you want during development."

6. **Emphasize the workflow:**
   "Remember this process:
   1. Make changes to your bot code
   2. Battle → Start Battle
   3. Boot your bot (it will appear in the bot list)
   4. Select it and some opponents
   5. Start Battle and watch!

   You'll do this cycle many times today."

### Step 5: Creating First Bot

**Now** they're ready to create their bot:
1. "Now that you know how to run battles, let's create your bot!"
2. Discuss bot name (can be creative or strategic)
3. Explain that team colors will be auto-applied
4. Run the appropriate command based on their OS:
   - **macOS/Linux:** `./scripts/create-bot.sh <BotName>`
   - **Windows (Git Bash):** `bash scripts/create-bot.sh <BotName>`
5. Show them where the bot files are: `tank-royale/teams/team<N>/<BotName>/`
6. Explain how to test their bot:
   - **macOS/Linux:** They can run `cd tank-royale/teams/team<N>/<BotName> && ./<BotName>.sh` for quick compile test
   - **Windows:** They should test via the GUI (boot and battle)
   - **Best for all:** Use the GUI to see the bot in action
7. Suggest testing the bot immediately: "Want to run a battle with your new bot?"
8. Offer to help with strategy or explain the bot structure

### Color Scheme Suggestions

When helping teams choose colors, here are some themed suggestions:

**Team 1 - Cool/Tech themes:**
- ThunderBots: BLUE, BLUE, CYAN, YELLOW
- IceBreakers: CYAN, WHITE, BLUE, WHITE
- NeonKnights: PURPLE, MAGENTA, CYAN, GREEN

**Team 2 - Warm/Aggressive themes:**
- FireStorm: RED, ORANGE, YELLOW, WHITE
- Inferno: ORANGE, RED, YELLOW, RED
- Phoenix: ORANGE, YELLOW, RED, ORANGE

**Team 3 - Nature/Stealth themes:**
- CodeNinjas: GREEN, GREEN, YELLOW, GREEN
- ForestForce: GREEN, "#006400", YELLOW, GREEN
- EmeraldEdge: "#00C800", "#009632", "#00FF00", WHITE

**Team 4 - Mystic/Royal themes:**
- VoidVikings: PURPLE, BLACK, MAGENTA, CYAN
- RoyalRobotics: PURPLE, PURPLE, YELLOW, WHITE
- CosmicCrew: PURPLE, MAGENTA, CYAN, MAGENTA

### Important Reminders

- **Detect OS first** - Always run `uname -s` (or equivalent) to detect their platform
- **Provide platform-specific commands** - Use the correct syntax for their OS
- **Never use interactive prompts** - Always provide parameters to scripts
- **Be enthusiastic** - This is a fun hackathon experience!
- **Brainstorm with them** - Team names and colors are part of the fun
- **Explain as you go** - Help them understand what's happening
- **Check for `.team-config`** - Always verify if team setup is complete before proceeding
- **Windows users need Git Bash or WSL** - If they don't have it, guide them to install Git for Windows (includes Git Bash)

After team setup, the configuration will be appended to the end of this file, and you'll have access to team-specific information.

## Repository Structure

```
tank-royale-hackathon/              # You are here (participant repo)
├── README.md                       # Quick start guide
├── SETUP.md                        # Setup instructions
├── RULES.md                        # Competition rules
├── SUBMISSION.md                   # Submission guide
├── CLAUDE.md                       # This file
├── .github/
│   └── copilot-instructions.md     # GitHub Copilot context
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
    ├── robocode-tankroyale-gui-0.33.1.jar  # GUI (4.4 MB)
    ├── lib/
    │   └── robocode-tankroyale-bot-api-0.33.1.jar  # Bot API (800 KB)
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
