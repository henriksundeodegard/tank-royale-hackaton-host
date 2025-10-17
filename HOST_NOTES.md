# Host Notes - Tank Royale Hackathon

## Repository Structure

```
ai_hackaton_2025/                    # HOST WORKSPACE (this folder)
├── README.md                        # Host workspace overview
├── HOST_NOTES.md                    # This file - event day guide
├── PARTICIPANT_REPO_STATUS.md       # Participant repo status
├── SETUP_LOG.md                     # Setup verification journey
├── IMPROVEMENTS.md                  # Future enhancement ideas
├── archive/                         # Deprecated/reference files
│   ├── PARTICIPANT_SETUP_GUIDE.md   # Original setup guide
│   ├── REPOSITORY_PLAN.md           # Planning document
│   ├── CLAUDE.md                    # Original Claude context
│   └── tank-royale/                 # Testing installation (archived)
└── tank-royale-hackathon/          # PARTICIPANT REPOSITORY ⭐
    ├── README.md                    # Quick start guide
    ├── SETUP.md                     # Detailed setup instructions
    ├── RULES.md                     # Competition rules
    ├── SUBMISSION.md                # Submission instructions
    ├── CLAUDE.md                    # Claude Code context
    ├── .github/
    │   └── copilot-instructions.md  # GitHub Copilot context
    ├── docs/
    │   ├── STRATEGIES.md            # Strategy patterns
    │   ├── API_QUICK_REFERENCE.md   # API reference
    │   └── TROUBLESHOOTING.md       # Common issues
    ├── scripts/
    │   ├── setup-team.sh            # Configure team (used by AI)
    │   ├── verify-setup.sh          # Verify setup
    │   ├── start-gui.sh             # Launch GUI
    │   └── create-bot.sh            # Generate bot template
    ├── sounds/                      # Battle sound effects
    └── tank-royale/
        ├── robocode-tankroyale-gui-0.33.1.jar  # GUI (4.4 MB)
        ├── lib/
        │   └── robocode-tankroyale-bot-api-0.33.1.jar  # Bot API (800 KB)
        ├── sample-bots/             # 14 reference examples
        │   ├── MyFirstBot/
        │   ├── SpinBot/
        │   ├── Walls/
        │   └── [11 more bots...]
        └── teams/                   # Participant workspaces
            ├── team1/.gitkeep
            ├── team2/.gitkeep
            ├── team3/.gitkeep
            └── team4/.gitkeep
```

## Pre-Hackathon Checklist

### 1 Week Before

- [ ] Create git repository from `tank-royale-hackathon/` directory
- [ ] Initialize git and push to GitHub/GitLab
- [ ] Share repository URL with participants
- [ ] Send setup instructions and deadline for verification
- [ ] ✅ Documentation already complete (strategies, API reference, troubleshooting)

### 3 Days Before

- [ ] Collect setup confirmations from all participants
- [ ] Help anyone with setup issues
- [ ] Prepare battle host machine with Tank Royale
- [ ] Test tournament workflow
- [ ] Prepare submission collection method (git or file-based)

### 1 Day Before

- [ ] Final verification email to participants
- [ ] Print rules reference sheets
- [ ] Prepare projector/screen for battles
- [ ] Test battle host machine again
- [ ] Prepare prizes/awards

### Day Of

- [ ] Battle host machine ready
- [ ] Projector working
- [ ] Backup laptop ready (just in case)
- [ ] Submission collection method ready
- [ ] Prizes ready

## Participant Flow

### Setup Phase (Before Event)
```
1. Clone tank-royale-hackathon repo
2. Open in VSCode/preferred IDE with AI assistant (Claude Code or GitHub Copilot)
3. Say "Help" or "Get started" to AI assistant
4. AI will guide through:
   - Team setup (number, name, colors)
   - GUI launch and first battle
   - Creating first bot
5. Confirm setup with hosts
```

**Note:** The AI-driven onboarding eliminates manual script running and ensures participants know how to test before coding.

### Event Day

**0:00-0:15 - Introduction**
- Welcome and rules explanation
- Demo battle with sample bots
- Quick reminder of testing workflow (Boot bots → Select → Start Battle)
- Q&A

**0:15-3:30 - Development**
```
Participants (with AI assistant help):
1. Code their bot in tank-royale/teams/teamN/
2. Test frequently: Battle → Start Battle → Boot → Select → Fight!
3. Ask AI for strategy improvements
4. Iterate and refine

AI assistants know:
- Team workspace and colors
- How to help with strategies
- Tank Royale API
- Common patterns and fixes
```

**3:30-3:45 - Submission**
```
Option A (Git):
cd tank-royale/teams/teamN
git add TeamBot.*
git commit -m "Submit Team N bot"
git push

Option B (File):
Upload 3 files to shared folder
```

**3:45-4:00 - Tournament**
```
Hosts:
1. Pull all bots or collect files
2. Copy to battle machine
3. Load in Tank Royale GUI
4. Run tournament
5. Display on projector
6. Award prizes
```

## Battle Host Machine Setup

### Preparation

```bash
# On battle machine
cd ~/hackathon-battles
git clone [repo-url] tank-royale-hackathon
cd tank-royale-hackathon

# Run setup script (auto-configures bot directories)
./scripts/verify-setup.sh

# Launch GUI
./scripts/start-gui.sh
```

### In GUI

**Note:** Bot directories are automatically configured! All team bots will be available.

1. **Battle → Start Battle**
2. **Boot bots** (Row 2):
   - Select all 4 team bots from "Bot Directories"
   - Click → to boot them
3. **Select participants** (Row 3):
   - Select all booted team bots from "Joined Bots"
   - Click → to add them to battle
4. **Configure battle** (Row 1):
   - Click "Setup Rules" if needed to adjust settings
   - Default: 10 rounds, 800x600 arena
5. **Click "Start Battle"**

### Run Tournament

**Round-Robin Format:**
- Match 1: All 4 teams battle
- Record placement (1st=3pts, 2nd=2pts, 3rd=1pts, 4th=0pts)
- Can run multiple rounds for consistency
- Winner: Team with most total points

## Scoring

### Per Match
- 1st: 3 points
- 2nd: 2 points
- 3rd: 1 point
- 4th: 0 points

### Tiebreakers
1. Total points
2. Head-to-head
3. Total kills
4. Survival time

## Troubleshooting

### Bot Won't Compile

```bash
# Test compilation
cd tank-royale/teams/teamN
./TeamBot.sh

# Common fixes:
# - Class name matches filename
# - All imports present
# - Launch script has correct JAR path
```

### Bot Crashes in Battle

- Award 0 points for that match
- No re-run unless tournament technical issue
- Host decision final

### Network Issues

- Ensure participants develop locally (no network needed)
- Use file-based submission if git has issues
- Have USB backup plan

## Time Management

Keep track of time:
- **3:00 remaining**: "3 hours left!"
- **1:00 remaining**: "1 hour left - start testing!"
- **0:30 remaining**: "30 minutes - finalize your strategy!"
- **0:15 remaining**: "15 minutes - prepare to submit!"
- **0:05 remaining**: "5 minutes until submission deadline!"
- **0:00**: "Submission window closed!"

## Emergency Contacts

- IT Support: [contact]
- Network Issues: [contact]
- Room Issues: [contact]

## Post-Event

- [ ] Take photos of winning team
- [ ] Collect feedback from participants
- [ ] Save all bots for future reference
- [ ] Write up lessons learned
- [ ] Thank participants and sponsors

## Notes

- Keep extra printed copies of rules
- Have water/coffee available
- Take breaks during development time
- Encourage teams to share strategies after event
- Make it fun - play some sample battles during breaks!
