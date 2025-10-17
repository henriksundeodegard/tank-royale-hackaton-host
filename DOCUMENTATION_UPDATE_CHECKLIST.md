# Documentation Update Checklist

Use this checklist whenever making significant changes to scripts, structure, or features to ensure all documentation stays consistent across the repository.

## When to Use This Checklist

Run through this checklist when you:
- Add or modify scripts in `scripts/`
- Change repository structure
- Add new features or workflows
- Modify AI assistant behavior
- Update setup or onboarding process
- Change competition rules or format

## Documentation Files by Category

### HOST Workspace (ai_hackaton_2025/)

#### Primary Host Documents
- [ ] **README.md** - Host workspace overview
  - Update participant instructions section
  - Update status/recent improvements
  - Update next steps if workflow changed

- [ ] **HOST_NOTES.md** - Event day hosting guide
  - Update repository structure diagram if files added/removed
  - Update participant flow if setup changed
  - Update battle host machine instructions
  - Update development workflow if process changed

- [ ] **IMPROVEMENTS.md** - Completed features and future ideas
  - Move completed items from "Future" to "Completed" section
  - Add new completed features with descriptions
  - Add new future enhancement ideas

- [ ] **CLAUDE.md** - AI context for hosts
  - Update if host workflow changes
  - (Generally stable, rarely needs updates)

### PARTICIPANT Workspace (tank-royale-hackathon/)

#### Primary Participant Documents
- [ ] **README.md** - Quick start guide for participants
  - Update Quick Start section if onboarding changed
  - Update repository structure diagram
  - Update What's Included list

- [ ] **SETUP.md** - Detailed setup instructions
  - Update setup steps if process changed
  - Update bot creation section if scripts changed
  - Update troubleshooting if new issues discovered

- [ ] **RULES.md** - Competition rules
  - Update if scoring/format changes
  - Update if restrictions change
  - Generally stable unless competition format changes

- [ ] **SUBMISSION.md** - Submission instructions
  - Update if submission method changes
  - Update file requirements if changed
  - Generally stable unless submission process changes

#### AI Assistant Instructions (CRITICAL!)
- [ ] **CLAUDE.md** - Claude Code context
  - Update AI Assistant Onboarding Workflow section if setup changed
  - Update bot creation instructions if scripts changed
  - Update example conversation flows if process changed
  - Update color schemes if team setup changed
  - Keep synchronized with copilot-instructions.md!

- [ ] **.github/copilot-instructions.md** - GitHub Copilot context
  - Update AI Assistant Onboarding Workflow section if setup changed
  - Update examples if process changed
  - Keep synchronized with CLAUDE.md!
  - **RULE: These two files should have identical onboarding sections**

#### Documentation Subdirectory (docs/)
- [ ] **docs/STRATEGIES.md** - Strategy patterns and examples
  - Add new strategy examples if developed
  - Update code examples if API usage changed
  - Generally stable unless new patterns discovered

- [ ] **docs/API_QUICK_REFERENCE.md** - Tank Royale API reference
  - Update if new API methods added
  - Update examples if best practices changed
  - Generally stable (depends on Tank Royale version)

- [ ] **docs/TROUBLESHOOTING.md** - Common issues and solutions
  - Add new issues as discovered
  - Update solutions if process changed
  - Generally grows over time

#### Helper Scripts (scripts/)
- [ ] **scripts/setup-team.sh**
  - If modified: Update usage examples in CLAUDE.md and copilot-instructions.md
  - If parameters changed: Update AI instruction files

- [ ] **scripts/verify-setup.sh**
  - If checks added: Update SETUP.md to mention them
  - If output changed: Update HOST_NOTES.md participant flow

- [ ] **scripts/start-gui.sh**
  - If process changed: Update SETUP.md launch instructions
  - Generally stable

- [ ] **scripts/create-bot.sh**
  - If parameters changed: Update AI instruction files
  - If template changed: Update SETUP.md bot structure section

## Synchronization Requirements

### Critical: Keep These in Sync!

**AI Assistant Onboarding Sections:**
- `tank-royale-hackathon/CLAUDE.md` → "AI Assistant Onboarding Workflow"
- `tank-royale-hackathon/.github/copilot-instructions.md` → "AI Assistant Onboarding Workflow"

**These must be identical or closely aligned!**

**Repository Structure Diagrams:**
- `HOST_NOTES.md` → Repository Structure section
- `README.md` (host) → Workspace Structure section

## Update Process

### Step-by-Step Process

1. **Identify what changed:**
   - New scripts?
   - Modified workflow?
   - New features?
   - Structural changes?

2. **Check AI instruction files FIRST:**
   - These are critical for participant experience
   - Update CLAUDE.md
   - Update copilot-instructions.md (keep synchronized!)

3. **Update participant-facing docs:**
   - README.md (participant)
   - SETUP.md if setup process changed
   - RULES.md if competition format changed

4. **Update host documentation:**
   - README.md (host)
   - HOST_NOTES.md
   - IMPROVEMENTS.md

5. **Update specialized docs (if relevant):**
   - docs/STRATEGIES.md
   - docs/API_QUICK_REFERENCE.md
   - docs/TROUBLESHOOTING.md

6. **Verify consistency:**
   - Check all repository structure diagrams match
   - Check AI instruction files are synchronized
   - Check examples in multiple files are consistent

## Quick Reference: Common Update Scenarios

### Scenario: Added new script to scripts/

**Must update:**
- [ ] tank-royale-hackathon/README.md (repository structure)
- [ ] HOST_NOTES.md (repository structure)
- [ ] IMPROVEMENTS.md (add to completed features)
- [ ] CLAUDE.md (if AI needs to know about it)
- [ ] copilot-instructions.md (if AI needs to know about it)

### Scenario: Changed onboarding workflow

**Must update:**
- [ ] tank-royale-hackathon/CLAUDE.md (onboarding section)
- [ ] tank-royale-hackathon/.github/copilot-instructions.md (onboarding section)
- [ ] tank-royale-hackathon/README.md (quick start)
- [ ] tank-royale-hackathon/SETUP.md (setup steps)
- [ ] HOST_NOTES.md (participant flow)
- [ ] IMPROVEMENTS.md (completed features)

### Scenario: Modified script parameters

**Must update:**
- [ ] CLAUDE.md (usage examples)
- [ ] copilot-instructions.md (usage examples)
- [ ] SETUP.md (if manual instructions exist)
- [ ] HOST_NOTES.md (if mentioned)

### Scenario: Discovered new common issue

**Must update:**
- [ ] docs/TROUBLESHOOTING.md (add issue and solution)
- [ ] SETUP.md (add to troubleshooting section if critical)

### Scenario: Changed repository structure

**Must update:**
- [ ] README.md (host) - workspace structure
- [ ] HOST_NOTES.md - repository structure
- [ ] tank-royale-hackathon/README.md - repository structure
- [ ] Any documentation referencing paths

## Validation Checklist

After making updates, verify:

- [ ] AI instruction files (CLAUDE.md and copilot-instructions.md) are synchronized
- [ ] All repository structure diagrams match actual structure
- [ ] All script examples use correct parameters
- [ ] All file paths are correct
- [ ] Recent improvements sections are updated
- [ ] No outdated information remains

## Tools to Help

**Find all markdown files:**
```bash
find . -name "*.md" -not -path "./.git/*" -not -path "./archive/*" | sort
```

**Search for specific term across all docs:**
```bash
grep -r "term" --include="*.md" --exclude-dir=".git" --exclude-dir="archive"
```

**Check if two files are synchronized:**
```bash
diff -u file1.md file2.md
```

## Notes

- When in doubt, update it! It's better to be redundant than outdated.
- The AI instruction files (CLAUDE.md, copilot-instructions.md) are the most critical - participants rely on these heavily.
- Host documentation affects event day success - keep HOST_NOTES.md accurate.
- Archive old versions in `archive/` instead of deleting - useful for reference.

---

**Last Updated:** 2025-01-16
**Maintained By:** Hackathon Hosts
