# Publication Guide - Tank Royale Hackathon Repositories

This guide walks through publishing both the **Host Workspace** and **Participant Repository** to GitHub.

## Overview

We have two repositories to publish:

1. **Host Workspace** (`ai_hackaton_2025/`) - For hackathon organizers
2. **Participant Repository** (`tank-royale-hackathon/`) - For participants

## Pre-Publication Checklist

### Host Workspace

- [x] Documentation complete and up-to-date
  - [x] README.md
  - [x] HOST_NOTES.md
  - [x] IMPROVEMENTS.md
  - [x] DOCUMENTATION_UPDATE_CHECKLIST.md
  - [x] PUBLICATION_GUIDE.md (this file)
- [x] CLAUDE.md updated for hosts
- [x] Participant repository ready in subdirectory
- [ ] Add event-specific details (see below)
- [ ] Review .gitignore for host workspace

### Participant Repository

- [x] All documentation updated
  - [x] README.md
  - [x] SETUP.md
  - [x] RULES.md
  - [x] SUBMISSION.md
  - [x] CLAUDE.md
  - [x] .github/copilot-instructions.md
- [x] Helper scripts functional
  - [x] setup-team.sh
  - [x] verify-setup.sh
  - [x] start-gui.sh
  - [x] create-bot.sh
- [x] Sample bots launch scripts fixed (all 14 bots)
- [x] Team directories created (team1-4)
- [x] Documentation subdirectory complete
  - [x] STRATEGIES.md
  - [x] API_QUICK_REFERENCE.md
  - [x] TROUBLESHOOTING.md
- [x] Sound files included
- [x] .gitignore configured
- [x] Cross-platform support documented
- [ ] Add event-specific details (see below)

## Event-Specific Information to Add

Before publishing, add these details to relevant files:

### In Host Workspace README.md

Replace placeholders:
```markdown
**Repository:** [Add your repo URL after publishing]
**Event Date:** [Add event date]
**Location:** [Add location]
**Hosts:** [Add host names/emails]
```

### In Participant Repository

**README.md** - Update if you want to include:
- Event date/time
- Location
- Contact information

**RULES.md** - Verify:
- Competition format matches your plan
- Scoring system is correct
- Time allocations are finalized

**SUBMISSION.md** - Update:
- Git repository URL (after publishing)
- Submission deadline
- Host contact info

## Step-by-Step Publication

### Part 1: Publish Host Workspace

1. **Navigate to host workspace:**
   ```bash
   cd /Users/h.sunde.odegard/Projects/ai_hackaton_2025
   ```

2. **Create .gitignore for host workspace:**
   ```bash
   cat > .gitignore << 'EOF'
   # OS files
   .DS_Store
   Thumbs.db

   # IDE files
   .idea/
   .vscode/
   *.iml

   # Temporary files
   *.tmp
   *~

   # Don't ignore the participant repository
   !tank-royale-hackathon/
   EOF
   ```

3. **Initialize git repository:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Tank Royale Hackathon host workspace

   - Complete host documentation and guides
   - Participant repository included as subdirectory
   - AI assistant context files
   - Helper scripts and utilities
   - Documentation update checklist"
   ```

4. **Create GitHub repository:**
   - Go to GitHub and create a new repository (e.g., `tank-royale-hackathon-host`)
   - Make it **private** (for hosts only) or **public** (if you want to share hosting experience)
   - Do NOT initialize with README (we already have one)

5. **Push to GitHub:**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/tank-royale-hackathon-host.git
   git branch -M main
   git push -u origin main
   ```

### Part 2: Publish Participant Repository

**Option A: Separate Repository (Recommended)**

This gives participants a clean, focused repository.

1. **Navigate to participant repository:**
   ```bash
   cd /Users/h.sunde.odegard/Projects/ai_hackaton_2025/tank-royale-hackathon
   ```

2. **Initialize git repository:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Tank Royale Hackathon participant repository

   - Tank Royale v0.33.1 binaries included
   - 14 sample bots with working launch scripts
   - Complete documentation and guides
   - AI-driven onboarding experience
   - Cross-platform support (macOS, Linux, Windows)
   - Team color configuration system
   - Helper scripts for setup and bot creation"
   ```

3. **Create GitHub repository:**
   - Go to GitHub and create a new repository (e.g., `tank-royale-hackathon`)
   - Make it **public** (participants need access)
   - Do NOT initialize with README

4. **Push to GitHub:**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/tank-royale-hackathon.git
   git branch -M main
   git push -u origin main
   ```

5. **Update host workspace with participant repo URL:**
   - Edit `ai_hackaton_2025/README.md`
   - Add participant repository URL
   - Commit and push the update

**Option B: Subtree (Alternative)**

If you want to keep them linked, use git subtree. This is more complex but maintains a connection.

```bash
# From host workspace
cd /Users/h.sunde.odegard/Projects/ai_hackaton_2025
git subtree push --prefix=tank-royale-hackathon origin-participant main
```

## Post-Publication Tasks

### 1. Update Documentation with URLs

**In Host Workspace:**
```bash
cd /Users/h.sunde.odegard/Projects/ai_hackaton_2025
# Edit README.md to add repository URLs
git add README.md
git commit -m "Add repository URLs"
git push
```

**In Participant Repository:**
```bash
cd /Users/h.sunde.odegard/Projects/ai_hackaton_2025/tank-royale-hackathon
# Edit SUBMISSION.md and README.md with repository URL
git add SUBMISSION.md README.md
git commit -m "Add repository URL"
git push
```

### 2. Test Participant Experience

Clone the participant repository in a new location and test:

```bash
cd ~/Desktop
git clone https://github.com/YOUR_USERNAME/tank-royale-hackathon.git test-participant
cd test-participant

# Test the setup flow as a participant would
# (Ideally test on macOS, Linux, AND Windows)
```

### 3. Share with Co-Hosts

Send co-hosts:
- Host repository URL
- Clone instructions
- Brief overview of repository structure
- Link to HOST_NOTES.md

Example email:
```
Subject: Tank Royale Hackathon - Host Repository

Hi team,

The hackathon hosting repository is ready!

Host Repository: [URL]
Participant Repository: [URL]

To get started:
1. Clone the host repo: git clone [HOST_URL]
2. Read HOST_NOTES.md for event day guide
3. Review IMPROVEMENTS.md for feature status

The participant repository is already configured and ready for teams to clone.

See you at the event!
```

### 4. Share with Participants (1 Week Before Event)

Example announcement:
```
Subject: Tank Royale Hackathon - Setup Instructions

Hi everyone,

Get ready for the Tank Royale AI Hackathon! Please complete setup before the event.

Repository: [PARTICIPANT_URL]

Quick Setup:
1. git clone [PARTICIPANT_URL]
2. cd tank-royale-hackathon
3. Open in VSCode with Claude Code or GitHub Copilot
4. Say "Help" to your AI assistant!

Your AI assistant will guide you through:
- Team setup
- Running your first battle
- Creating your bot

Need help? Contact [HOST_EMAIL]

See you at [EVENT_DATE]!
```

## Repository Maintenance

### Making Updates

**To Host Repository:**
```bash
cd /Users/h.sunde.odegard/Projects/ai_hackaton_2025
# Make changes
git add .
git commit -m "Description of changes"
git push
```

**To Participant Repository:**
```bash
cd /Users/h.sunde.odegard/Projects/ai_hackaton_2025/tank-royale-hackathon
# Make changes
git add .
git commit -m "Description of changes"
git push
```

### Using Documentation Update Checklist

Before any major update, refer to `DOCUMENTATION_UPDATE_CHECKLIST.md` to ensure all relevant files are updated consistently.

## Security Considerations

### Host Repository
- Can be public or private
- Contains no sensitive information
- Includes full hosting documentation

### Participant Repository
- Should be **public** for easy access
- Contains no sensitive information
- All configuration is team-specific and generated during setup

## Repository Sizes

- **Host Workspace:** ~15 MB (includes participant repo)
- **Participant Repository:** ~6.5 MB (includes binaries and sounds)

Both are reasonable sizes for Git hosting.

## Troubleshooting

### Large Files
If GitHub rejects due to file size:
- Check that `.jar` files are necessary (they are for this project)
- Consider Git LFS if files are larger than 100MB (they're not in this case)

### Nested .git Directories
Make sure there's no `.git` directory in `tank-royale-hackathon/` when committing from host workspace.

### Push Failures
- Verify repository URLs are correct
- Ensure you have push permissions
- Check GitHub repository settings

## Ready to Publish?

Final checklist before running git commands:

- [ ] Event-specific information added to documentation
- [ ] Host repository .gitignore created
- [ ] Reviewed README files for accuracy
- [ ] Verified all scripts are executable
- [ ] Tested sample bots boot successfully
- [ ] Created GitHub repositories (host + participant)
- [ ] Ready to share with co-hosts

Once checked, follow the step-by-step publication instructions above!

---

**Last Updated:** 2025-01-16
**Contact:** [Your contact info]
