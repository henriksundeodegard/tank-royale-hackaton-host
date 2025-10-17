# Competition Rules

## Format

- **Teams**: 4 teams of 3 participants each
- **Development Time**: 3.5 hours
- **Submission Window**: 15 minutes
- **Tournament**: 30 minutes

## Schedule

| Time | Activity |
|------|----------|
| 0:00-0:15 | Welcome, introduction, and rules |
| 0:15-3:30 | Bot development time |
| 3:30-3:45 | Bot submission window |
| 3:45-4:00 | Tournament and awards |

## Development Phase

### What You Can Do
- ✅ Use any AI coding assistant (Claude Code, GitHub Copilot, etc.)
- ✅ Test your bot locally against sample bots
- ✅ Review and learn from sample bot code
- ✅ Ask hosts for clarification on rules
- ✅ Collaborate within your team

### Restrictions
- ❌ One bot per team only
- ❌ No external libraries beyond Tank Royale Bot API
- ❌ Bot must be self-contained (no external data files)
- ❌ No hardcoding opponent names or specific behaviors
- ❌ No network communication outside Tank Royale protocol

## Bot Requirements

Your bot must include exactly 3 files:

1. **YourTeamBot.java** - Java source code
   - Must extend `dev.robocode.tankroyale.botapi.Bot`
   - Must compile without errors
   - Must not exceed 1000 lines of code

2. **YourTeamBot.json** - Bot metadata
   - Valid JSON format
   - Must include: name, version, authors

3. **YourTeamBot.sh** - Launch script
   - Must use correct JAR path
   - Must be executable (chmod +x)

## Submission

See [SUBMISSION.md](SUBMISSION.md) for detailed submission instructions.

**Deadline**: [TIME TO BE ANNOUNCED]

- Submit all 3 files via designated method
- Hosts will verify compilation within 5 minutes
- Quick fixes allowed during submission window if bot doesn't compile
- No submissions accepted after deadline

## Tournament Format

### Round-Robin Structure
- Each team fights every other team once
- Total: 6 matches (Team 1 vs 2, 1 vs 3, 1 vs 4, 2 vs 3, 2 vs 4, 3 vs 4)
- 10 rounds per match

### Scoring System

**Per Match:**
- 1st place: 3 points
- 2nd place: 2 points
- 3rd place: 1 point
- 4th place: 0 points

**Tiebreakers** (in order):
1. Total points across all matches
2. Head-to-head record
3. Total kills across all matches
4. Total survival time

### Match Settings
- Arena size: 800x600
- Gun cooling rate: 0.1
- Number of rounds: 10

## Winning Criteria

The team with the highest total points after all matches wins!

## Judging

### Primary Criterion
Tournament performance (point total)

### Bonus Recognition (Non-Scoring)
- **Most Creative Strategy** - Novel or unexpected approach
- **Best Code Quality** - Clean, well-commented code
- **Best Team Name** - Most creative team identity

## Fair Play

### Expected Behavior
- Respect other teams
- Follow time limits
- Accept judges' decisions
- Have fun!

### Prohibited Behavior
- Sabotaging other teams
- Accessing other teams' code
- Disrupting the tournament
- Arguing with hosts

## Technical Issues

### Bot Doesn't Compile
- Hosts will notify you immediately
- Fix during submission window
- If unfixable, you may submit a working previous version

### Bot Crashes During Tournament
- Bot receives 0 points for that match
- No re-runs unless technical issue with tournament setup
- Host decision is final

### Tournament Technical Failure
- Hosts may pause and restart affected match
- Scores from completed rounds are retained
- Host decision is final

## Questions

If you have questions about the rules:
1. Check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
2. Ask a hackathon host
3. Check with your AI assistant for code-related questions

## Have Fun!

Remember: This is a learning experience. Experiment with strategies, collaborate with your team, and enjoy watching the battles!

Good luck! 🤖⚔️🏆
