# Tank Royale Hackathon - Repository Structure Plan

## Purpose

Create a git repository that participants can clone to have everything they need for the hackathon, optimized for use with Claude Code and GitHub Copilot.

## Repository Structure

```
tank-royale-hackathon/
├── README.md                          # Quick start guide
├── SETUP.md                           # Detailed setup instructions
├── RULES.md                           # Competition rules and format
├── SUBMISSION.md                      # How to submit your bot
├── CLAUDE.md                          # Claude Code context
├── .github/
│   └── copilot-instructions.md        # GitHub Copilot instructions
├── tank-royale/
│   ├── robocode-tankroyale-gui-0.33.1.jar
│   ├── lib/
│   │   └── robocode-tankroyale-bot-api-0.33.1.jar
│   ├── sample-bots/                   # Reference bots (read-only)
│   │   ├── MyFirstBot/
│   │   ├── SpinBot/
│   │   ├── Walls/
│   │   └── ... (all sample bots)
│   └── teams/                         # Team working directories
│       ├── team1/
│       │   └── .gitkeep
│       ├── team2/
│       │   └── .gitkeep
│       ├── team3/
│       │   └── .gitkeep
│       └── team4/
│           └── .gitkeep
├── scripts/
│   ├── create-bot.sh                  # Generate new bot structure
│   ├── verify-setup.sh                # Verify installation
│   ├── start-gui.sh                   # Launch Tank Royale GUI
│   └── test-bot.sh                    # Quick bot compilation test
└── docs/
    ├── STRATEGIES.md                  # Strategy ideas and patterns
    ├── API_QUICK_REFERENCE.md         # Common API methods
    └── TROUBLESHOOTING.md             # Common issues and solutions
```

## Key Files Content

### README.md
- What is this hackathon?
- Quick start (3 steps to get going)
- Links to detailed docs
- Support/help contact info

### SETUP.md
- Prerequisites (Java, IDE, AI tools)
- Installation steps for each OS
- Verification steps
- What to do if stuck

### RULES.md
```markdown
# Competition Rules

## Format
- 4 teams of 3 participants
- 3.5 hours development time
- 30 minutes tournament

## Development
- Use any AI coding assistant (Claude Code, GitHub Copilot, etc.)
- Test locally against sample bots
- One bot per team

## Submission
- Submit by [TIME]
- 3 files required: .java, .json, .sh
- Bot must compile and run

## Tournament
- Round-robin format (each team fights every other team)
- 10 rounds per match
- Points: 1st place = 3pts, 2nd = 2pts, 3rd = 1pt, 4th = 0pts
- Highest total points wins
- Tiebreaker: Head-to-head, then total kills

## Restrictions
- Must use Tank Royale Bot API
- No external libraries beyond Bot API
- Bot must be self-contained (no external data files)
- No hardcoding opponent names/behaviors

## Judging Criteria
1. Tournament performance (primary)
2. Code creativity (tiebreaker bonus)
3. Strategy innovation (tiebreaker bonus)
```

### SUBMISSION.md
```markdown
# How to Submit Your Bot

## What to Submit

Submit these 3 files from your team directory:

1. `YourTeamBot.java` - Your bot code
2. `YourTeamBot.json` - Bot metadata
3. `YourTeamBot.sh` - Launch script

## Submission Methods

### Option 1: Git Commit (Preferred)
```bash
cd tank-royale/teams/team1
git add YourTeamBot.*
git commit -m "Submit Team 1 bot"
git push
```

### Option 2: File Share
- Zip your 3 files
- Upload to [shared folder/Slack]
- Name: `team1-bot.zip`

## Deadline
**[TIME]** - No late submissions accepted

## Verification
After submitting:
- Hosts will verify your bot compiles
- You'll get confirmation within 5 minutes
- Fix any issues immediately

## Testing Before Submission
```bash
cd tank-royale/teams/team1
chmod +x YourTeamBot.sh
./YourTeamBot.sh
# Should start without errors
```
```

### CLAUDE.md
(We already have this - just move it to the repo)

### .github/copilot-instructions.md
```markdown
# GitHub Copilot Instructions for Tank Royale Hackathon

You are helping developers create competitive robot tank bots for Robocode Tank Royale.

## Project Context
- Programming game where bots battle autonomously
- Bots extend `dev.robocode.tankroyale.botapi.Bot`
- Event-driven architecture
- Goal: Create the best battle strategy

## Bot Structure
Each bot consists of:
1. Java class extending `Bot`
2. `run()` method with main loop
3. Event handlers (`onScannedBot`, `onHitByBullet`, etc.)

## Common Patterns
- Movement: `forward(distance)`, `turnRight(degrees)`
- Combat: `fire(power)` where power is 0.1 to 3.0
- Scanning: `turnRadarRight(degrees)` to detect enemies
- Events trigger callbacks for reacting to game state

## Key Considerations
- Keep bot in `while(isRunning())` loop
- Balance offense (shooting) and defense (dodging)
- Manage energy (shooting consumes energy)
- Avoid walls (arena boundaries)
- Calculate bearings for accurate targeting

## Common Issues
- Class name must match filename
- Use explicit JAR path in launch scripts
- Event handlers need `@Override` annotation
- Imports: `import dev.robocode.tankroyale.botapi.*;`

## Strategy Tips
Suggest strategies based on:
- Movement patterns (circular, random, wall-following)
- Targeting algorithms (linear, predictive)
- Defensive tactics (dodging, positioning)
- Energy management (when to fire, power level)
```

## Pre-Hackathon Preparation

### 1 Week Before
- [ ] Create git repository with structure above
- [ ] Add all necessary files (GUI, bot API, samples)
- [ ] Test clone → setup → develop workflow
- [ ] Share repo URL with participants
- [ ] Ask participants to verify setup

### 3 Days Before
- [ ] Collect setup confirmation from all participants
- [ ] Prepare battle host machine
- [ ] Test tournament workflow
- [ ] Print rules reference sheets

### Day Before
- [ ] Final setup verification
- [ ] Prepare projector/screen
- [ ] Test battle host machine
- [ ] Prepare prizes/awards

## Hackathon Day Workflow

### Setup (Before participants arrive)
1. Battle host machine ready with projector
2. Test battles working
3. Reference materials printed
4. Network/WiFi tested

### Event Start (0:00)
1. Welcome and intro (5 min)
2. Rules explanation (5 min)
3. Quick demo battle (5 min)

### Development Phase (0:15 - 3:30)
- Teams work in their directories
- Hosts available for questions
- Teams test locally

### Submission Window (3:30 - 3:45)
- Teams submit their 3 files
- Hosts verify compilation
- Quick fixes if needed

### Tournament (3:45 - 4:00)
- Load all bots on battle machine
- Run tournament bracket
- Display results
- Award prizes

## Submission Collection Strategy

### Git-Based (Recommended)
```bash
# Teams commit to their directory
git add tank-royale/teams/team1/*
git commit -m "Team 1 final submission"
git push

# Hosts pull and verify
git pull
cd tank-royale/teams/team1
./TeamBot.sh  # Quick test
```

### File-Based (Backup)
- Shared folder on local network
- Teams drop files
- Hosts copy to battle machine

## Battle Host Machine Setup

```bash
# On battle machine
cd tank-royale

# Copy all team bots
cp teams/team1/Team1Bot.* .
cp teams/team2/Team2Bot.* .
cp teams/team3/Team3Bot.* .
cp teams/team4/Team4Bot.* .

# Launch GUI with projector
java -jar robocode-tankroyale-gui-0.33.1.jar

# In GUI:
# 1. Config → Bot Root Directories → Add current directory
# 2. Battle → Start Battle
# 3. Select all 4 team bots
# 4. Start tournament!
```

## Success Criteria

Participants should be able to:
1. Clone repo and have everything working in 10 minutes
2. Create and test a bot within 30 minutes
3. Use AI assistants effectively
4. Submit without technical issues
5. Watch final tournament without lag/problems

## Risk Mitigation

**Risk: Setup issues on hackathon day**
- Mitigation: Pre-event verification required

**Risk: Bot won't compile at submission**
- Mitigation: 15-minute submission window for fixes

**Risk: Network issues**
- Mitigation: Local development only, file-based submission

**Risk: Battle machine fails**
- Mitigation: Backup machine ready, all bots in git

**Risk: Participant doesn't understand Tank Royale**
- Mitigation: Demo at start, reference docs available
