# Tank Royale Hackathon - Host Workspace

This is the **host preparation workspace** for organizing the Tank Royale AI Hackathon.

## Workspace Structure

```
ai_hackaton_2025/                    # HOST WORKSPACE (this directory)
├── README.md                        # This file - workspace overview
├── HOST_NOTES.md                    # Day-of hosting guide
├── PARTICIPANT_REPO_STATUS.md       # Participant repo completion status
├── SETUP_LOG.md                     # Original setup verification journey
├── IMPROVEMENTS.md                  # Future enhancement ideas
├── tank-royale-hackathon/          # ⭐ PARTICIPANT REPOSITORY
│   └── [Complete hackathon setup]   # Ready to publish to Git
└── archive/                         # Deprecated/reference files
    ├── PARTICIPANT_SETUP_GUIDE.md   # Now in participant repo as SETUP.md
    ├── REPOSITORY_PLAN.md           # Planning document (completed)
    └── tank-royale/                 # Testing installation (can be deleted)
```

## Quick Reference

### For Hosts

**Main Documents:**
- **[HOST_NOTES.md](HOST_NOTES.md)** - Complete hosting guide for event day
- **[PARTICIPANT_REPO_STATUS.md](PARTICIPANT_REPO_STATUS.md)** - Participant repo status and publishing steps

**Reference:**
- **[SETUP_LOG.md](SETUP_LOG.md)** - How we verified Tank Royale works (historical)
- **[IMPROVEMENTS.md](IMPROVEMENTS.md)** - Ideas for future enhancements

### Participant Repository

The `tank-royale-hackathon/` directory contains the **complete repository** ready for participants:
- All Tank Royale binaries included
- 14 sample bots
- Sound files
- Complete documentation
- Helper scripts
- AI assistant context files

**Size:** 6.5 MB (reasonable for Git)

## Next Steps

### 1. Publish Participant Repository

```bash
cd tank-royale-hackathon
git init
git add .
git commit -m "Initial Tank Royale Hackathon setup"
git remote add origin [your-repo-url]
git push -u origin main
```

### 2. Share with Participants (1 Week Before Event)

Send:
- **Repository:** https://github.com/henriksundeodegard/tank-royale-hackaton
- Setup deadline
- Instructions:
  ```bash
  git clone https://github.com/henriksundeodegard/tank-royale-hackaton.git
  cd tank-royale-hackaton

  # Then simply ask your AI assistant: "Help" or "Get started"
  # Your AI will guide you through team setup and first battle!
  ```

### 3. Prepare Battle Host Machine

See [HOST_NOTES.md](HOST_NOTES.md) for complete setup instructions.

## Event Day Checklist

- [ ] Battle host machine ready with Tank Royale
- [ ] Projector/screen set up
- [ ] Backup laptop ready
- [ ] Submission method configured (git or file-based)
- [ ] Print rules reference sheets
- [ ] Prizes ready
- [ ] Time tracking method ready

## Workspace Maintenance

### Clean Workspace Structure

The workspace has been organized into two main areas:

**Active Files (Keep These):**
- `README.md` - This file
- `HOST_NOTES.md` - Essential event day guide
- `PARTICIPANT_REPO_STATUS.md` - Repository reference
- `SETUP_LOG.md` - Historical setup documentation
- `IMPROVEMENTS.md` - Future planning
- `CLAUDE.md` - Claude Code context for hosts
- `.github/copilot-instructions.md` - GitHub Copilot context for hosts
- `tank-royale-hackathon/` - **The participant repository**

**Archive (Reference Only):**
- `archive/` - Contains deprecated preparation files
  - Can be deleted after event if space is needed
  - Kept for historical reference

## Contact & Support

**Host Repository:** https://github.com/henriksundeodegard/tank-royale-hackaton-host
**Participant Repository:** https://github.com/henriksundeodegard/tank-royale-hackaton
**Event Date:** [Add event date]
**Location:** [Add location]
**Hosts:** [Add host names/emails]

## Status

✅ **Participant repository ready for publication**
✅ **Hosting documentation updated and complete**
✅ **Helper scripts functional** (auto-configure bot directories)
✅ **Sample bots verified** (14 bots included)
✅ **AI assistant context files complete** (Claude Code + GitHub Copilot)
✅ **Documentation comprehensive** (setup, rules, strategies, API, troubleshooting)
✅ **Sound files included**

**Recent improvements:**
- **AI-driven onboarding experience** - Interactive team setup with conversational AI
- **Team color configuration** - Teams choose bot colors during setup
- **GUI learning phase** - Participants learn to run battles before coding
- **Command-line setup scripts** - No interactive prompts, works smoothly with AI assistants
- Automatic bot directory configuration (no manual setup needed!)
- Boot bots workflow documented throughout
- All paths and references verified

Ready to publish and host an awesome hackathon! 🚀
