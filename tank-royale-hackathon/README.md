# Tank Royale Hackathon

Welcome to the AI-Powered Tank Royale Hackathon! Build a competitive robot tank using AI coding assistants (Claude Code or GitHub Copilot).

## Quick Start - Ask Your AI Assistant!

**Best way to get started:** Simply say **"Help"** or **"Get started"** to your AI assistant (Claude Code or GitHub Copilot). They will guide you through an interactive onboarding experience!

Your AI assistant will help you:
1. **Set up your team** - Pick a team number, brainstorm a team name, and choose your bot colors
2. **Learn to run battles** - Launch the GUI and run your first battle with sample bots
3. **Create your bot** - Generate your team's bot with your chosen colors
4. **Develop your strategy** - Iteratively code and test throughout the hackathon

### Manual Quick Start (4 Steps)

If you prefer to set up manually:

#### 1. Team Setup

Ask your AI assistant to help, or run:
```bash
./scripts/setup-team.sh <team_number> <team_name> [colors...]
# Example: ./scripts/setup-team.sh 1 "ThunderBots" "BLUE" "BLUE" "ORANGE" "YELLOW"
```

#### 2. Verify Setup

```bash
./scripts/verify-setup.sh
```

**Note:** If Java is not installed, see [SETUP.md](SETUP.md) for installation instructions.

#### 3. Learn to Run Battles (Important!)

```bash
# Launch Tank Royale GUI
./scripts/start-gui.sh
```

**Practice running a battle with sample bots:**
1. Battle → Start Battle
2. **Boot bots:** Select 3-4 sample bots (try Walls, Fire, SpinBot) → click → to boot them
3. **Select participants:** Select booted bots → click → to add to battle
4. Click "Start Battle" button

**This workflow is crucial!** You'll use this same process to test your bot throughout the hackathon.

#### 4. Create Your Bot

```bash
# Generate bot template (with your team colors!)
./scripts/create-bot.sh YourBotName
```

Now test your bot using the same battle process you just learned!

## What's Included

- **Tank Royale GUI** (4.4 MB) - Battle arena and bot tester
- **Bot API** (800 KB) - Everything you need to build your bot
- **14 Sample Bots** - Reference implementations to learn from
- **Sound Files** (~1 MB) - Battle sound effects for immersive experience
- **Helper Scripts** - Quick setup and bot generation
- **Documentation** - Strategy guides, API reference, troubleshooting

## Documentation

- **[SETUP.md](SETUP.md)** - Detailed installation instructions
- **[RULES.md](RULES.md)** - Competition format and rules
- **[SUBMISSION.md](SUBMISSION.md)** - How to submit your bot
- **[docs/STRATEGIES.md](docs/STRATEGIES.md)** - Strategy ideas and code patterns
- **[docs/API_QUICK_REFERENCE.md](docs/API_QUICK_REFERENCE.md)** - Common API methods
- **[docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)** - Common issues and fixes

## Using AI Assistants

This repository is optimized for AI coding assistants:

- **Claude Code users**: See [CLAUDE.md](CLAUDE.md)
- **GitHub Copilot users**: See [.github/copilot-instructions.md](.github/copilot-instructions.md)

## Repository Structure

```
tank-royale-hackathon/
├── README.md                 # This file
├── SETUP.md                  # Setup instructions
├── RULES.md                  # Competition rules
├── SUBMISSION.md             # Submission guide
├── CLAUDE.md                 # Claude Code context
├── .github/
│   └── copilot-instructions.md  # GitHub Copilot context
├── scripts/                  # Helper utilities
│   ├── setup-team.sh         # Configure team (auto-run by verify-setup.sh)
│   ├── verify-setup.sh       # Verify setup and configure team
│   ├── start-gui.sh          # Launch Tank Royale GUI
│   └── create-bot.sh         # Generate bot template
├── docs/                     # Strategy guides and references
│   ├── STRATEGIES.md         # Strategy patterns and examples
│   ├── API_QUICK_REFERENCE.md  # Quick API reference
│   └── TROUBLESHOOTING.md    # Common issues and solutions
├── sounds/                   # Battle sound effects
└── tank-royale/              # Tank Royale installation
    ├── robocode-tankroyale-gui-0.33.1.jar  # GUI application
    ├── lib/
    │   └── robocode-tankroyale-bot-api-0.33.1.jar  # Bot API
    ├── sample-bots/          # 14 reference examples
    │   ├── MyFirstBot/       # Basic starter
    │   ├── SpinBot/          # Spinning strategy
    │   ├── Walls/            # Wall-following (strong!)
    │   ├── Corners/          # Corner camping
    │   ├── Fire/             # Basic combat
    │   ├── Crazy/            # Random movement
    │   ├── RamFire/          # Aggressive ramming
    │   ├── TrackFire/        # Advanced tracking
    │   └── [6 more bots...]
    └── teams/                # Your team's workspace
        ├── team1/
        ├── team2/
        ├── team3/
        └── team4/
```

## Getting Help

- Check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- Ask hackathon hosts
- Review sample bots for examples

## Competition Info

- **Duration**: 4 hours
- **Teams**: 4 teams of 3 participants
- **Format**: Round-robin tournament
- **Prize**: Glory and bragging rights! 🏆

Good luck, and may your bot reign supreme! 🤖⚔️
