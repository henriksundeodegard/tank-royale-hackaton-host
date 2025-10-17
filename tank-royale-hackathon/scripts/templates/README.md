# Configuration Templates

This directory contains template files used by setup scripts to generate Tank Royale configuration files.

## Templates

### gui.properties.template
Used by `verify-setup.sh` to configure the Tank Royale GUI with bot directories.

**Placeholders:**
- `{{REPO_ROOT}}` - Absolute path to repository root

### game-setups.properties.template
Used by `verify-setup.sh` to configure default game settings for all game types (1v1, classic, custom, melee).

**Placeholders:**
- `{{NUMBER_OF_ROUNDS}}` - Number of rounds per battle (default: 3 for faster testing)

## Adding New Configuration Options

To make a setting configurable:

1. Replace the value in the template with a placeholder: `{{PLACEHOLDER_NAME}}`
2. Update the corresponding script to define the variable and use `sed` to replace it
3. Document the placeholder in this README

## Example

To change the default number of rounds, edit `verify-setup.sh`:

```bash
# Configure number of rounds (default: 3 for faster testing)
NUMBER_OF_ROUNDS=3
```

To add a new configurable setting (e.g., arena size):

1. In template: `1v1.arenaWidth={{ARENA_WIDTH}}`
2. In script: `ARENA_WIDTH=800`
3. In sed command: Add another replacement or chain them
