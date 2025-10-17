# Troubleshooting Guide

Common issues and solutions for Tank Royale development.

## Setup Issues

### Java Not Found

**Error:** `command not found: java` or `Unable to locate a Java Runtime`

**Solution:**
```bash
# Check if Java is installed
java -version

# If not installed, see SETUP.md for installation instructions

# On macOS with Homebrew:
brew install openjdk@21
echo 'export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Wrong Java Version

**Error:** `UnsupportedClassVersionError` or version is less than 11

**Solution:**
```bash
# Check current version
java -version

# Should show Java 11 or higher
# If not, install newer version (see SETUP.md)
```

### GUI Won't Launch

**Error:** Double-clicking JAR does nothing or shows error

**Solution:**
```bash
# Try launching from command line to see error
cd tank-royale
java -jar robocode-tankroyale-gui-0.33.1.jar

# If "Main class not found":
# - File may be corrupted, re-download
# - Check file size (should be ~4.4 MB)

# If permission denied:
chmod +x robocode-tankroyale-gui-0.33.1.jar
```

## Bot Development Issues

### Bot Not Appearing in GUI

**Problem:** Your bot doesn't show up in the bot list

**Solutions:**

1. **Check bot directory is configured:**
   - GUI → Config → Bot Root Directories
   - Add the `tank-royale` directory containing your bot

2. **Verify all 3 files exist:**
   ```bash
   ls tank-royale/teams/your-team/
   # Should show: YourBot.java, YourBot.json, YourBot.sh (or .cmd)
   ```

3. **Check script is executable:**
   ```bash
   chmod +x tank-royale/teams/your-team/YourBot.sh
   ```

4. **Verify JSON is valid:**
   ```bash
   # Check for syntax errors in JSON file
   cat tank-royale/teams/your-team/YourBot.json
   ```

### Compilation Errors

#### Class Name Mismatch

**Error:** `class YourBot is public, should be declared in a file named YourBot.java`

**Solution:**
```java
// File: MyBot.java
// Class name MUST match filename
public class MyBot extends Bot {  // ✅ Correct
    // ...
}

public class MyRobot extends Bot {  // ❌ Wrong
    // ...
}
```

#### Missing Imports

**Error:** `cannot find symbol: class Bot` or `package dev.robocode does not exist`

**Solution:**
```java
// Add these imports at the top of your file
import dev.robocode.tankroyale.botapi.*;
import dev.robocode.tankroyale.botapi.events.*;
```

#### Method Override Errors

**Error:** `method does not override or implement a method from a supertype`

**Solution:**
```java
// Make sure method signatures match exactly
@Override
public void onScannedBot(ScannedBotEvent e) {  // ✅ Correct
    // ...
}

@Override
public void onScannedBot(ScannedBotEvent event) {  // ✅ Also correct (parameter name doesn't matter)
    // ...
}

@Override
public void onScannedBot() {  // ❌ Wrong - missing parameter
    // ...
}
```

### Launch Script Errors

#### Could Not Find or Load Main Class

**Error:** `Error: Could not find or load main class YourBot.java`

**Solution:**
```bash
# In YourBot.sh - use explicit JAR path, NOT wildcard
# ✅ CORRECT:
java -cp ../lib/robocode-tankroyale-bot-api-0.33.1.jar YourBot.java

# ❌ WRONG:
java -cp ../lib/* YourBot.java
```

#### Permission Denied

**Error:** `Permission denied` when running `./YourBot.sh`

**Solution:**
```bash
chmod +x tank-royale/teams/your-team/YourBot.sh
```

#### Script Has Wrong Line Endings

**Error:** Script fails with `^M` or `/bin/sh^M: bad interpreter`

**Solution:**
```bash
# Convert Windows line endings to Unix
dos2unix YourBot.sh

# Or create script on Unix system
```

## Runtime Issues

### Bot Doesn't Move

**Problem:** Bot compiles but doesn't move in battle

**Solutions:**

1. **Check for infinite loop:**
   ```java
   @Override
   public void run() {
       while (isRunning()) {  // ✅ Correct - checks if battle is running
           forward(100);
       }
   }

   @Override
   public void run() {
       while (true) {  // ❌ Might work but use isRunning() instead
           forward(100);
       }
   }

   @Override
   public void run() {
       forward(100);  // ❌ Wrong - executes once and exits
   }
   ```

2. **Check for blocking code:**
   ```java
   // ❌ DON'T do this:
   Thread.sleep(1000);  // Blocks bot execution

   // ✅ DO this instead:
   // Let Tank Royale handle timing
   ```

### Bot Doesn't Fire

**Problem:** Bot moves but never fires

**Solutions:**

1. **Check fire() is called:**
   ```java
   @Override
   public void onScannedBot(ScannedBotEvent e) {
       fire(1);  // Make sure this is called
   }
   ```

2. **Check energy level:**
   ```java
   @Override
   public void onScannedBot(ScannedBotEvent e) {
       if (getEnergy() > 0.1) {  // Need energy to fire
           fire(1);
       }
   }
   ```

3. **Check gun is aimed:**
   - Gun must be pointed at target
   - Use `turnGunRight/Left()` to aim

### Bot Hits Walls Constantly

**Problem:** Bot keeps running into walls and losing energy

**Solution:**
```java
@Override
public void run() {
    while (isRunning()) {
        // Check proximity to walls (assuming 800x600 arena)
        double margin = 50;
        if (getX() < margin || getX() > 800 - margin ||
            getY() < margin || getY() > 600 - margin) {
            // Near wall - turn away
            back(20);
            turnRight(90);
        }
        forward(50);
    }
}

@Override
public void onHitWall(HitWallEvent e) {
    // Emergency: hit wall anyway
    back(100);
    turnRight(180);
}
```

### Bot Dies Immediately

**Problem:** Bot dies within seconds of battle starting

**Possible Causes:**

1. **Running into walls repeatedly:**
   - Add wall avoidance (see above)

2. **Not dodging bullets:**
   ```java
   @Override
   public void onHitByBullet(HitByBulletEvent e) {
       // Dodge by turning perpendicular
       double bearing = calcBearing(e.getBullet().getDirection());
       turnRight(90 - bearing);
       forward(100);
   }
   ```

3. **Firing too much:**
   ```java
   // ❌ Don't fire every turn
   fire(3);  // This costs 3 energy per shot!

   // ✅ Fire strategically
   if (getEnergy() > 20) {
       fire(2);
   } else {
       fire(0.1);  // Low power when low energy
   }
   ```

## Battle Issues

### Bot Compiles But Doesn't Start in Battle

**Problem:** Bot shows in list but doesn't appear in arena

**Solutions:**

1. **Check bot directory configuration:**
   - GUI → Config → Bot Root Directories
   - Should include parent directory of your bot

2. **Check console for errors:**
   - Look at GUI console output
   - May show compilation or runtime errors

3. **Test bot manually:**
   ```bash
   cd tank-royale/teams/your-team
   ./YourBot.sh
   # Should start without errors (will wait for server)
   ```

### Bot Crashes During Battle

**Problem:** Bot disappears mid-battle or stops responding

**Solutions:**

1. **Check for runtime exceptions:**
   - Look at console output
   - Common: NullPointerException, ArrayIndexOutOfBoundsException

2. **Add null checks:**
   ```java
   @Override
   public void onScannedBot(ScannedBotEvent e) {
       if (e != null) {  // Safety check
           fire(1);
       }
   }
   ```

3. **Avoid division by zero:**
   ```java
   double distance = e.getDistance();
   if (distance > 0) {  // Check before dividing
       double power = 400.0 / distance;
       fire(Math.min(3.0, power));
   }
   ```

## Performance Issues

### Bot Responds Slowly

**Problem:** Bot seems sluggish or skips turns

**Solutions:**

1. **Simplify calculations:**
   ```java
   // ❌ Too complex
   for (int i = 0; i < 1000000; i++) {
       // Complex calculation
   }

   // ✅ Keep it simple
   fire(2);
   ```

2. **Avoid unnecessary work:**
   ```java
   // Cache calculations
   private double lastEnemyDistance = 0;

   @Override
   public void onScannedBot(ScannedBotEvent e) {
       lastEnemyDistance = e.getDistance();
       // Use cached value later
   }
   ```

## AI Assistant Issues

### Claude/Copilot Suggests Wrong Code

**Problem:** AI suggests code that doesn't compile or work

**Solutions:**

1. **Check API version:**
   - We're using Tank Royale (not classic Robocode)
   - Methods and classes are different

2. **Refer to sample bots:**
   - Look at working examples in `tank-royale/sample-bots/`
   - Copy patterns that work

3. **Verify imports:**
   - Use `dev.robocode.tankroyale.botapi.*`
   - NOT `robocode.*` (old API)

### AI Suggests Outdated Patterns

**Problem:** Code looks like old Robocode, not Tank Royale

**Solution:**
- Tell AI: "I'm using Tank Royale, not classic Robocode"
- Show AI the CLAUDE.md or copilot-instructions.md file
- Reference the docs at https://robocode-dev.github.io/tank-royale/

## Getting Help

### Before Asking for Help

1. **Read error messages carefully** - They usually tell you what's wrong
2. **Check this troubleshooting guide** - Solution might be here
3. **Look at sample bots** - They're working examples
4. **Test incrementally** - Start simple, add complexity slowly

### When Asking for Help

Provide:
1. **Exact error message** - Copy and paste
2. **Your code** - The relevant section
3. **What you tried** - Steps to reproduce
4. **Expected vs actual** - What should happen vs what does happen

### Resources

- **Sample Bots:** `tank-royale/sample-bots/` - Working examples
- **API Reference:** `docs/API_QUICK_REFERENCE.md` - Quick API guide
- **Strategy Guide:** `docs/STRATEGIES.md` - Strategy patterns
- **Official Docs:** https://robocode-dev.github.io/tank-royale/
- **Hackathon Hosts:** Ask during the event!

## Still Stuck?

If you've tried everything and still have issues:

1. **Start with a sample bot** - Copy one that works
2. **Make small changes** - Test after each change
3. **Simplify** - Remove complex code until it works
4. **Ask hosts** - We're here to help!

Remember: **Working simple bot > Broken complex bot**

Good luck! 🚀
