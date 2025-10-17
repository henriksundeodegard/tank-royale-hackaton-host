#!/bin/bash
# Create a new bot with template files

BOT_NAME=$1

if [ -z "$BOT_NAME" ]; then
    echo "Usage: ./scripts/create-bot.sh BotName"
    echo ""
    echo "Example: ./scripts/create-bot.sh MyAwesomeBot"
    exit 1
fi

# Load team configuration
if [ ! -f ".team-config" ]; then
    echo "❌ Team not configured yet"
    echo "   Please run: ./scripts/verify-setup.sh"
    exit 1
fi

source .team-config

if [ -z "$TEAM_NUMBER" ] || [ -z "$TEAM_NAME" ] || [ -z "$TEAM_WORKSPACE" ]; then
    echo "❌ Team configuration incomplete"
    echo "   Please run: ./scripts/verify-setup.sh"
    exit 1
fi

BOT_DIR="$TEAM_WORKSPACE/$BOT_NAME"

# Check if bot already exists
if [ -d "$BOT_DIR" ]; then
    echo "❌ Bot '$BOT_NAME' already exists in $BOT_DIR"
    exit 1
fi

# Create bot directory
mkdir -p "$BOT_DIR"

echo "🤖 Creating bot: $BOT_NAME for Team $TEAM_NUMBER ($TEAM_NAME)"
echo "📁 Location: $BOT_DIR"

# Convert color strings to Java Color code
function convert_color() {
    local color=$1
    # Check if it's a hex color (#RRGGBB or RRGGBB)
    if [[ $color =~ ^#?([0-9A-Fa-f]{6})$ ]]; then
        local hex="${BASH_REMATCH[1]}"
        local r=$((16#${hex:0:2}))
        local g=$((16#${hex:2:2}))
        local b=$((16#${hex:4:2}))
        echo "Color.fromRgb(0x${hex:0:2}, 0x${hex:2:2}, 0x${hex:4:2})"
    # Check if it's a standard color name
    elif [[ $color =~ ^[A-Z_]+$ ]]; then
        echo "Color.$color"
    else
        # Default to the string as-is (assume it's already in correct format)
        echo "$color"
    fi
}

# Convert team colors
BODY_COLOR_CODE=$(convert_color "$BODY_COLOR")
TURRET_COLOR_CODE=$(convert_color "$TURRET_COLOR")
RADAR_COLOR_CODE=$(convert_color "$RADAR_COLOR")
BULLET_COLOR_CODE=$(convert_color "$BULLET_COLOR")

# Create Java file
cat > "$BOT_DIR/$BOT_NAME.java" << EOF
import dev.robocode.tankroyale.botapi.*;
import dev.robocode.tankroyale.botapi.events.*;

/**
 * $BOT_NAME - A competitive Tank Royale bot
 *
 * Strategy: [Describe your strategy here]
 */
public class $BOT_NAME extends Bot {

    // The main method starts our bot
    public static void main(String[] args) {
        new $BOT_NAME().start();
    }

    // Called when a new round is started
    @Override
    public void run() {
        // Set team colors
        setBodyColor($BODY_COLOR_CODE);
        setTurretColor($TURRET_COLOR_CODE);
        setRadarColor($RADAR_COLOR_CODE);
        setBulletColor($BULLET_COLOR_CODE);

        // Main bot loop - runs continuously during the battle
        while (isRunning()) {
            // TODO: Implement your movement strategy
            forward(100);
            turnGunRight(360);
        }
    }

    // Called when our radar scans another bot
    @Override
    public void onScannedBot(ScannedBotEvent e) {
        // TODO: Implement your targeting strategy
        fire(1);
    }

    // Called when we're hit by a bullet
    @Override
    public void onHitByBullet(HitByBulletEvent e) {
        // TODO: Implement your defensive strategy
        turnRight(90);
    }

    // Called when we hit a wall
    @Override
    public void onHitWall(HitWallEvent e) {
        // Back up and turn away from wall
        back(20);
        turnRight(90);
    }

    // Called when we collide with another bot
    @Override
    public void onHitBot(HitBotEvent e) {
        // Decide whether to ram or retreat
        back(10);
    }
}
EOF

# Create JSON metadata file
cat > "$BOT_DIR/$BOT_NAME.json" << EOF
{
  "name": "$BOT_NAME",
  "version": "1.0",
  "authors": ["$TEAM_NAME"],
  "description": "Team $TEAM_NUMBER's competitive tank bot",
  "countryCodes": ["no"],
  "platform": "JVM",
  "programmingLang": "Java 11"
}
EOF

# Create launch script
cat > "$BOT_DIR/$BOT_NAME.sh" << EOF
#!/bin/sh
java -cp ../../lib/robocode-tankroyale-bot-api-0.33.1.jar $BOT_NAME.java
EOF

# Create Windows launch script
cat > "$BOT_DIR/$BOT_NAME.cmd" << EOF
java -cp ..\\..\\lib\\robocode-tankroyale-bot-api-0.33.1.jar $BOT_NAME.java
EOF

# Make shell script executable
chmod +x "$BOT_DIR/$BOT_NAME.sh"

echo ""
echo "✅ Bot '$BOT_NAME' created successfully!"
echo ""
echo "Files created:"
echo "  📄 $BOT_DIR/$BOT_NAME.java"
echo "  📄 $BOT_DIR/$BOT_NAME.json"
echo "  📄 $BOT_DIR/$BOT_NAME.sh"
echo "  📄 $BOT_DIR/$BOT_NAME.cmd"
echo ""
echo "🎨 Team colors applied:"
echo "  Body: $BODY_COLOR"
echo "  Turret: $TURRET_COLOR"
echo "  Radar: $RADAR_COLOR"
echo "  Bullets: $BULLET_COLOR"
echo ""
echo "Next steps:"
echo "  1. Edit $BOT_DIR/$BOT_NAME.java with your strategy"
echo "  2. Test: cd $BOT_DIR && ./$BOT_NAME.sh"
echo "  3. Battle: ./scripts/start-gui.sh"
echo ""
echo "💡 Tip: To change colors, re-run ./scripts/setup-team.sh or ask your AI assistant!"
echo ""
echo "Happy coding! 🚀"
