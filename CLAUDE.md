# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## Repository Purpose

This is the **host preparation workspace** for organizing a Tank Royale AI Hackathon. This workspace contains:
1. Event planning and hosting documentation
2. The complete participant repository (ready to publish)
3. Historical setup and testing records

**Important:** This is NOT the participant workspace. The participant repository is in `tank-royale-hackathon/` subdirectory.

## Workspace Structure

```
ai_hackaton_2025/                    # HOST WORKSPACE (this directory)
├── README.md                        # Host workspace overview
├── HOST_NOTES.md                    # Event day hosting guide
├── PARTICIPANT_REPO_STATUS.md       # Participant repo completion status
├── SETUP_LOG.md                     # Setup verification journey
├── IMPROVEMENTS.md                  # Future enhancement ideas
├── CLAUDE.md                        # This file - host context
├── .github/
│   └── copilot-instructions.md      # GitHub Copilot context for hosts
├── archive/                         # Deprecated/reference files
│   ├── README.md
│   ├── PARTICIPANT_SETUP_GUIDE.md
│   ├── REPOSITORY_PLAN.md
│   ├── CLAUDE.md
│   └── tank-royale/                 # Testing installation (archived)
└── tank-royale-hackathon/          # ⭐ PARTICIPANT REPOSITORY
    └── [Complete hackathon setup - ready to publish]
```

## Host Workspace vs Participant Repository

### Host Workspace (Current Directory)
**Purpose:** Planning, organization, and event day reference for hackathon hosts

**Key Files:**
- `HOST_NOTES.md` - Complete event day guide with checklists, timelines, scoring
- `PARTICIPANT_REPO_STATUS.md` - Status of what's included in participant repo
- `SETUP_LOG.md` - Historical record of setup verification process
- `IMPROVEMENTS.md` - Ideas for future hackathons

**When working here:** You're helping hosts prepare for and run the event.

### Participant Repository (`tank-royale-hackathon/`)
**Purpose:** Everything participants need to compete in the hackathon

**Contains:**
- Tank Royale v0.33.1 binaries
- 14 sample bots
- Sound files
- Documentation (SETUP.md, RULES.md, STRATEGIES.md, etc.)
- Helper scripts
- AI assistant context files

**When working here:** You're improving the participant experience.

## Working with This Workspace

### Common Host Tasks

**1. Update Event Documentation**
Files: `HOST_NOTES.md`, `README.md`
- Add event-specific details (date, location, hosts)
- Update checklists and timelines
- Refine scoring rules or tournament format

**2. Review Participant Repository Status**
File: `PARTICIPANT_REPO_STATUS.md`
- Check what's included in participant repo
- Verify file counts and sizes
- Review completion status

**3. Plan Future Improvements**
File: `IMPROVEMENTS.md`
- Add ideas for next hackathon
- Document lessons learned
- Track feature requests

**4. Historical Reference**
File: `SETUP_LOG.md`, `archive/`
- Review how Tank Royale was set up
- Reference original decisions and rationale
- Check archived preparation files

### Publishing Participant Repository

When ready to share with participants:

```bash
cd tank-royale-hackathon

# Initialize git
git init

# Create .gitignore (if not exists)
cat > .gitignore << 'EOF'
# OS files
.DS_Store
Thumbs.db

# IDE files
.idea/
.vscode/
*.iml

# Build files
*.class
*.log

# Temporary files
*.tmp
*~
EOF

# Add files
git add .

# Initial commit
git commit -m "Initial Tank Royale Hackathon repository setup

Includes:
- Tank Royale v0.33.1 GUI and Bot API
- 14 sample bots for reference
- Sound files for immersive experience
- Comprehensive documentation (setup, rules, strategies)
- Helper scripts for quick setup
- AI assistant context files (Claude Code, GitHub Copilot)
- 4 team workspaces ready for development
"

# Add remote and push
git remote add origin [your-repo-url]
git branch -M main
git push -u origin main
```

### Event Day Reference

**Before Event:**
- Review `HOST_NOTES.md` - Pre-hackathon checklist
- Verify battle host machine ready
- Confirm all participants completed setup

**During Event:**
- Follow timeline in `HOST_NOTES.md`
- Use scoring system documented there
- Reference troubleshooting section

**After Event:**
- Update `IMPROVEMENTS.md` with lessons learned
- Save winning bot implementations
- Collect participant feedback

## Tank Royale Technical Reference

### System Requirements
- **Java:** 11 or higher (tested with OpenJDK 21)
- **Platform:** macOS, Linux, Windows
- **GUI:** `robocode-tankroyale-gui-0.33.1.jar` (4.4 MB)
- **Bot API:** `robocode-tankroyale-bot-api-0.33.1.jar` (800 KB)

### Bot Structure
Each bot requires 3 files:
1. `BotName.java` - Bot logic (extends `Bot` class)
2. `BotName.json` - Metadata
3. `BotName.sh` / `BotName.cmd` - Launch scripts

### Critical Launch Script Fix
**Use explicit JAR path, not wildcards:**

```bash
# ✅ CORRECT:
java -cp ../lib/robocode-tankroyale-bot-api-0.33.1.jar YourBot.java

# ❌ WRONG:
java -cp ../lib/* YourBot.java
```

The wildcard pattern causes issues with Tank Royale's script interpreter.

### Testing Setup Locally

```bash
# From participant repo
cd tank-royale-hackathon

# Run setup (auto-configures bot directories)
./scripts/verify-setup.sh

# Launch GUI
./scripts/start-gui.sh

# Bot directories are automatically configured!
# All sample bots and team workspaces will be available

# Create test bot
./scripts/create-bot.sh TestBot

# Test in GUI: Battle → Start Battle
# Boot bots → Select participants → Start Battle
```

## Hackathon Context

**Event Format:**
- **Duration:** 4 hours total
- **Participants:** 12 people (4 teams of 3)
- **AI Tools:** Claude Code and GitHub Copilot

**Timeline:**
- 0:00-0:15: Introduction and rules
- 0:15-3:30: Development time (3h 15m)
- 3:30-3:45: Bot submission (15m)
- 3:45-4:00: Tournament and awards (15m)

**Scoring:**
- 1st place: 3 points
- 2nd place: 2 points
- 3rd place: 1 point
- 4th place: 0 points

## Resources

### For Hosts
- **HOST_NOTES.md** - Complete hosting guide
- **PARTICIPANT_REPO_STATUS.md** - What's in participant repo
- **Tank Royale Docs:** https://robocode-dev.github.io/tank-royale/

### For Participants (in their repo)
- **SETUP.md** - Installation instructions
- **RULES.md** - Competition rules
- **docs/STRATEGIES.md** - Strategy patterns
- **docs/API_QUICK_REFERENCE.md** - API reference
- **docs/TROUBLESHOOTING.md** - Common issues

### Official Resources
- **GitHub Repo:** https://github.com/robocode-dev/tank-royale
- **Java API:** https://robocode-dev.github.io/tank-royale/api/java/
- **Tutorial:** https://robocode-dev.github.io/tank-royale/tutorial/my-first-bot

## Common Tasks for AI Assistants

### When Helping Hosts

1. **"Update the event details"**
   - Edit HOST_NOTES.md and README.md
   - Add date, location, contact info

2. **"What's included in the participant repo?"**
   - Read PARTICIPANT_REPO_STATUS.md
   - Summarize contents and size

3. **"How do I publish the participant repo?"**
   - Provide git commands from this file
   - Reference PARTICIPANT_REPO_STATUS.md

4. **"What are the tournament rules?"**
   - Read HOST_NOTES.md scoring section
   - Explain tournament format

5. **"Add an improvement idea"**
   - Edit IMPROVEMENTS.md
   - Add to appropriate priority section

### When Helping with Participant Repository

**Switch to the participant repository context:**
- The participant repo has its own `CLAUDE.md`
- Located at `tank-royale-hackathon/CLAUDE.md`
- Contains bot development guidance

**To work on participant files:**
- Create/edit files in `tank-royale-hackathon/` directory
- Follow participant documentation structure
- Test using scripts in `tank-royale-hackathon/scripts/`

## Key Differences: Tank Royale vs Original Robocode

**Tank Royale (What We're Using):**
- Modern, network-based architecture
- WebSocket communication
- Multi-language support (Java, Kotlin, C#, Python)
- Active development
- Version: 0.33.1

**Original Robocode:**
- Classic desktop version
- Traditional architecture
- Java only
- Less actively maintained

**Why Tank Royale?**
- Better documentation
- More modern design
- Active community
- Multi-language potential for future events

## Status

✅ **Participant repository is complete and ready to publish**
✅ **All high-priority improvements implemented**
✅ **Host documentation updated and complete**
✅ **Helper scripts functional** (auto-configure bot directories)
✅ **Sample bots verified** (14 included)
✅ **AI assistant context complete** (for both hosts and participants)

**Recent improvements:**
- Automatic bot directory configuration (no manual GUI setup!)
- Boot bots workflow documented
- Battle host machine instructions updated

Ready to publish and host an awesome hackathon! 🚀
