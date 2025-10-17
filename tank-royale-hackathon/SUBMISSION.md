# How to Submit Your Bot

## What to Submit

Submit these **3 files** from your team directory:

1. `YourTeamBot.java` - Your bot source code
2. `YourTeamBot.json` - Bot metadata
3. `YourTeamBot.sh` - Launch script (or .cmd for Windows)

## Before Submitting

### 1. Test Your Bot

```bash
# Navigate to your team directory
cd tank-royale/teams/your-team

# Make script executable
chmod +x YourTeamBot.sh

# Test compilation (will start bot process)
./YourTeamBot.sh
# Press Ctrl+C after a few seconds if it starts without errors
```

### 2. Verify Files

```bash
# Check all 3 files exist
ls YourTeamBot.*

# Should show:
# YourTeamBot.java
# YourTeamBot.json
# YourTeamBot.sh
```

### 3. Check Bot Name

Ensure your bot name is consistent across all files:
- Java class name matches filename
- JSON "name" field is clear and identifies your team
- Launch script references correct filename

## Submission Methods

### Option 1: Git Commit (Preferred)

```bash
# From your team directory
cd tank-royale/teams/your-team

# Stage your files
git add YourTeamBot.java YourTeamBot.json YourTeamBot.sh

# Commit with clear message
git commit -m "Submit [Team Name] bot for tournament"

# Push to repository
git push
```

### Option 2: File Upload

If hosts provide alternative submission method:

1. Compress your 3 files:
   ```bash
   zip team-name-bot.zip YourTeamBot.*
   ```

2. Upload to designated location (Slack/shared folder/etc.)

3. Confirm with hosts that submission was received

## Submission Deadline

**Time**: [TO BE ANNOUNCED AT EVENT START]

⚠️ **No late submissions will be accepted**

## After Submission

### Verification Process

1. **Hosts receive your files** (within 1 minute)
2. **Compilation test** (within 5 minutes)
3. **Notification**:
   - ✅ Success: "Your bot compiled successfully!"
   - ❌ Error: "Compilation failed - see error message below"

### If Compilation Fails

You have until the submission deadline to fix and resubmit:

1. Read the error message carefully
2. Fix the issue in your code
3. Test locally again
4. Resubmit using same method

**Common issues:**
- Class name doesn't match filename
- Missing imports
- Syntax errors
- Launch script has wrong JAR path

### Tournament Loading

After submission window closes:
- Hosts will load all bots onto tournament machine
- Bots will be tested one final time
- Tournament brackets will be announced
- Get ready to watch your bot in action! 🎮

## Submission Checklist

Before submitting, verify:

- [ ] Bot compiles locally without errors
- [ ] All 3 files present (.java, .json, .sh/.cmd)
- [ ] Class name matches filename
- [ ] Launch script is executable
- [ ] Bot name is clear in JSON file
- [ ] Tested in Tank Royale GUI locally
- [ ] Files are in correct team directory
- [ ] Team is ready to submit

## Questions?

- Check error messages carefully
- Review [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- Ask hackathon hosts for help
- Don't wait until the last minute!

## Good Luck! 🚀

Your bot is ready to battle. May the best strategy win!
