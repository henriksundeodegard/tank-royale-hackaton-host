# Robocode Setup Log

This document tracks the setup process for getting Robocode running on macOS for the hackathon.

## System Information
- **OS**: macOS (Darwin 24.6.0)
- **Date**: 2025-10-14
- **Homebrew**: Installed at `/opt/homebrew/bin/brew`

## Prerequisites Check

### Java Status
- **Initial Check**: Java not installed
- **Required**: Java 8 or newer (Robocode 1.10.0 supports Java 8-24+)

## Installation Steps

### Step 1: Install Java
We'll install OpenJDK 21 via Homebrew as it's a stable LTS version.

```bash
brew install openjdk@21
```

Status: ✅ Completed

**Command used:**
```bash
brew install openjdk@21
```

**Result:**
- Installed OpenJDK 21.0.8
- Location: `/opt/homebrew/Cellar/openjdk@21/21.0.8`
- Installed 600 files, 331.3MB

**Configuration needed:**
The Java installation is "keg-only" which means it wasn't automatically added to PATH.

To make Java available in current session:
```bash
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
```

To make it permanent (add to ~/.zshrc):
```bash
echo 'export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"' >> ~/.zshrc
```

Optional: To make this JDK available system-wide (requires sudo):
```bash
sudo ln -sfn /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk
```

### Step 2: Verify Java Installation

Status: ✅ Completed

**Command used:**
```bash
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH" && java -version
```

**Result:**
```
openjdk version "21.0.8" 2025-07-15
OpenJDK Runtime Environment Homebrew (build 21.0.8)
OpenJDK 64-Bit Server VM Homebrew (build 21.0.8, mixed mode, sharing)
```

Java is successfully installed and working!

### Step 3: Choose Robocode Version

**Important Discovery:**
There are TWO versions of Robocode available:

1. **Original Robocode** (robo-code/robocode v1.10.0)
   - Classic desktop version
   - Java-based
   - Traditional architecture
   - Repository: https://github.com/robo-code/robocode

2. **Tank Royale** (robocode-dev/tank-royale v0.33.1)
   - Modern "next evolution" of Robocode
   - Network-based architecture (bots communicate via WebSocket)
   - Supports multiple languages: Java, Kotlin, C#, Python
   - More modern design and active development
   - Repository: https://github.com/robocode-dev/tank-royale

**Decision:** We'll use **Tank Royale v0.33.1** because:
- More modern and actively maintained
- Better documentation
- Multi-language support (more flexibility for participants)
- Network architecture could enable interesting features

### Step 4: Download Tank Royale

**Files to download:**
1. GUI: `robocode-tankroyale-gui-0.33.1.jar` (4.4 MB)
2. Sample Bots: `sample-bots-java-0.33.1.zip` (671 KB)

**Commands used:**
```bash
# Download GUI
curl -L -O https://github.com/robocode-dev/tank-royale/releases/download/v0.33.1/robocode-tankroyale-gui-0.33.1.jar

# Download and extract sample bots
curl -L -O https://github.com/robocode-dev/tank-royale/releases/download/v0.33.1/sample-bots-java-0.33.1.zip
unzip sample-bots-java-0.33.1.zip
```

**Result:**
✅ Downloaded successfully!

Sample bots included:
- MyFirstBot (starter bot)
- Corners, Crazy, Fire, SpinBot, Walls (various strategies)
- RamFire, TrackFire (different targeting approaches)
- MyFirstDroid, MyFirstLeader, MyFirstTeam (team examples)
- Target, VelocityBot, PaintingBot (specialized examples)

### Step 5: Launch Tank Royale GUI

**Command used:**
```bash
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
java -jar robocode-tankroyale-gui-0.33.1.jar
```

Status: ✅ GUI Launched!

## Bot Structure Overview

Each bot consists of 3 files:

1. **Java source file** (`.java`) - The bot logic
2. **JSON config file** (`.json`) - Bot metadata (name, version, authors, etc.)
3. **Shell script** (`.sh`) - Launch script that compiles and runs the bot

Example from MyFirstBot:
- Java code is very simple (~47 lines)
- Extends `Bot` class from Tank Royale API
- Key methods:
  - `run()` - Main bot loop
  - `onScannedBot()` - Event handler when seeing another bot
  - `onHitByBullet()` - Event handler when hit

Running a bot manually:
```bash
cd MyFirstBot
java -cp ../lib/* MyFirstBot.java
```

### Step 6: Configure Bot Directories in GUI

To use the sample bots in battles, you need to:
1. Open the GUI (should be running)
2. Go to **Config → Bot Root Directories**
3. Add the directory containing the bot folders

Status: ✅ Completed!

Bot directory configured successfully. GUI can see all sample bots.

### Step 7: Run Your First Battle

**How to configure the "Start Battle" screen:**

1. **Select Bots** (left side):
   - Click on 3-5 bots from the available list to add them to the battle
   - Recommended starter bots for first battle:
     - MyFirstBot (basic movement and shooting)
     - SpinBot (spins and shoots)
     - Corners (stays in corners)
     - Fire (simple targeting)
     - Walls (moves along walls)

2. **Battle Settings** (right side - optional):
   - **Number of Rounds**: 10 (default is fine)
   - **Arena Size**: Default (800x600)
   - **Gun Cooling Rate**: Default (0.1)

3. **Click "Start Battle"** button at the bottom

**What to expect:**
- A battle arena will appear showing the bots as colored tanks
- Bots will move, shoot, and battle until only one remains
- You'll see scores, health bars, and bullet trails
- After all rounds complete, you'll see final statistics

Status: ✅ Battle Completed Successfully!

**Test Results:**
- All bots loaded and ran without errors
- 10 rounds completed automatically
- Battle visualization worked perfectly
- Winner: **Walls** (followed closely by SpinBot)

**Observations:**
- Battles are engaging and fun to watch
- Different strategies clearly visible
- Perfect pacing for a hackathon (10 rounds takes a few minutes)
- Easy to see which bot is winning

### Step 8: Create a Custom Bot

Now let's create a custom bot to verify the development workflow for hackathon participants.

**Bot Created: HackatonBot**

Location: `/path/to/your/host-workspace/tank-royale/HackatonBot/`

**Bot Strategy:**
- Moves in a circular pattern around the arena
- Continuously spins radar to detect enemies
- Fires at enemies with power based on distance
- Evades when hit by turning perpendicular to bullets
- Backs up when hitting walls or other bots

**Files created:**
- `HackatonBot.java` (79 lines) - Bot logic
- `HackatonBot.json` - Bot metadata
- `HackatonBot.sh` - Launch script

**Compilation test:** ✅ Passed (bot compiles without errors)

**Key Learning:**
- Bot development is straightforward
- Compilation errors are clear and helpful
- Simple bots can be created quickly (~80 lines of code)
- Event-driven programming model is easy to understand

### Step 9: Test Custom Bot in Battle

Now we need to test HackatonBot in an actual battle against the sample bots.

**Instructions:**
1. Go back to the Tank Royale GUI
2. Select "Battle -> Start Battle"
3. Add "Hackaton Bot" along with a few sample bots
4. Start the battle and observe how it performs

Status: ✅ Battle Test Successful!

**Test Results:**
- HackatonBot loaded and ran without errors
- Bot compiled automatically via Java's source file execution
- Battle ran smoothly for 3 rounds
- Performance: HackatonBot placed lower in rankings (perfect for hackathon - room for improvement!)

**Important Fix Applied:**
- Changed launch scripts from `../lib/*` to `../lib/robocode-tankroyale-bot-api-0.33.1.jar`
- The wildcard caused issues with the GUI's script interpreter
- Explicit JAR path works reliably

---

## Feasibility Assessment

### ✅ Hackathon is FEASIBLE!

**Setup Complexity:** Low
- Java installation: ~5 minutes
- Tank Royale download: ~1 minute
- Bot directory configuration: ~1 minute
- **Total setup time: ~10 minutes**

**Development Experience:** Excellent
- Simple, clean API
- Event-driven programming is intuitive
- Compilation errors are clear
- Fast feedback loop (edit → test → battle)
- Perfect for AI-assisted coding

**Engagement Factor:** High
- Battles are fun to watch
- Clear winner/loser feedback
- Multiple strategies visible
- Easy to iterate and improve

**Time Requirements:**
- Initial bot creation: 15-30 minutes
- Iterations and improvements: 2-3 hours
- Tournament and finale: 30 minutes
- **Total: Perfect fit for 4-hour hackathon**

### Recommendations for Hackathon

1. **Pre-hackathon Setup (1 week before):**
   - Send participants setup instructions
   - Ask them to install Java and Tank Royale ahead of time
   - Verify everyone has it working with a quick test

2. **Day-of Structure:**
   - 0:00-0:15: Quick intro and rules explanation
   - 0:15-3:30: Coding time (with breaks)
   - 3:30-4:00: Tournament and awards

3. **Provide Starter Resources:**
   - Sample bot template
   - API reference link
   - Example prompts for Claude Code/Copilot
   - Strategy ideas document

4. **Tournament Format:**
   - Round-robin or bracket tournament
   - 10 rounds per match
   - Display battles on big screen

Status: ✅ Complete!

**Participant Guide Created:** `PARTICIPANT_SETUP_GUIDE.md`

The guide includes:
- Step-by-step setup instructions for all platforms
- Starter bot template
- AI tool usage tips and example prompts
- Strategy ideas
- Troubleshooting section
- Complete API reference
- Hackathon day checklist

---

## Summary

**✅ HACKATHON SETUP VERIFIED AND FEASIBLE**

All components tested and working:
1. ✅ Java installation (Homebrew on macOS)
2. ✅ Tank Royale v0.33.1 download and launch
3. ✅ Sample bots loading and battling
4. ✅ Custom bot creation and compilation
5. ✅ Custom bot running in battles
6. ✅ Documentation completed

**Time Investment:**
- Setup verification: ~1 hour
- Documentation: ~30 minutes
- Total: ~1.5 hours

**Confidence Level:** HIGH
This hackathon format will work excellently with the estimated 12 participants in 4 teams.

**Next Steps:**
1. Send PARTICIPANT_SETUP_GUIDE.md to participants 1 week before
2. Have participants confirm setup works
3. Prepare tournament bracket/format
4. Set up projector for battle display on hackathon day
5. Consider prizes for: Winner, Most Creative Strategy, Best Team Name

---

## Notes for Participant Instructions
- Participants will need Homebrew installed (or alternative Java installation method)
- Need to verify Java installation works before proceeding
- Consider providing alternative installation methods for non-Homebrew users
