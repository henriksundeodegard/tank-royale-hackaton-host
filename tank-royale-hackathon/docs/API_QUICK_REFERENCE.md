# Tank Royale API Quick Reference

Quick reference for the most commonly used Bot API methods.

## Bot Lifecycle

```java
import dev.robocode.tankroyale.botapi.*;
import dev.robocode.tankroyale.botapi.events.*;

public class MyBot extends Bot {
    public static void main(String[] args) {
        new MyBot().start();  // Start the bot
    }

    @Override
    public void run() {
        // Main loop - runs continuously during battle
        while (isRunning()) {
            // Your code here
        }
    }
}
```

## Movement Commands

### Forward/Backward
```java
forward(double distance)   // Move forward
back(double distance)      // Move backward
```

### Turning
```java
turnLeft(double degrees)   // Turn tank left
turnRight(double degrees)  // Turn tank right
```

### Gun Control
```java
turnGunLeft(double degrees)   // Turn gun left
turnGunRight(double degrees)  // Turn gun right
```

### Radar Control
```java
turnRadarLeft(double degrees)   // Turn radar left
turnRadarRight(double degrees)  // Turn radar right
```

### Advanced Movement
```java
setAdjustGunForBodyTurn(boolean adjust)     // Gun moves with body (default: true)
setAdjustRadarForGunTurn(boolean adjust)    // Radar moves with gun (default: true)
setAdjustRadarForBodyTurn(boolean adjust)   // Radar moves with body (default: true)
```

## Combat

### Firing
```java
fire(double power)  // Fire bullet (power: 0.1 to 3.0)
```

**Bullet Power Effects:**
- **Damage:** `4 * power` (if power > 1), otherwise `power + 2 * (power - 1)`
- **Velocity:** `20 - 3 * power`
- **Energy Cost:** `power`

### Bullet Power Guide
| Power | Damage | Speed | Use Case |
|-------|--------|-------|----------|
| 0.1   | 0.4    | 19.7  | Energy conservation |
| 1.0   | 4.0    | 17.0  | Standard shot |
| 2.0   | 8.0    | 14.0  | Medium damage |
| 3.0   | 12.0   | 11.0  | Maximum damage |

## Information Methods

### Position & Direction
```java
double getX()           // X coordinate (0 to arena width)
double getY()           // Y coordinate (0 to arena height)
double getDirection()   // Body direction (0-360 degrees)
double getGunDirection()    // Gun direction (0-360 degrees)
double getRadarDirection()  // Radar direction (0-360 degrees)
```

### Status
```java
double getEnergy()      // Current energy (0-100)
double getSpeed()       // Current speed
boolean isRunning()     // Is battle still running?
int getTurnNumber()     // Current turn number
```

### Game State
```java
int getEnemyCount()     // Number of enemies remaining
```

## Event Handlers

Override these methods to react to game events:

### Enemy Detection
```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    // Called when radar scans an enemy
    String botId = e.getScannedBotId();
    double energy = e.getEnergy();
    double x = e.getX();
    double y = e.getY();
    double direction = e.getDirection();
    double speed = e.getSpeed();
    double distance = e.getDistance();
    double bearing = e.getBearing();  // Relative angle to enemy
}
```

### Being Hit
```java
@Override
public void onHitByBullet(HitByBulletEvent e) {
    // Called when hit by enemy bullet
    double power = e.getBullet().getPower();
    double direction = e.getBullet().getDirection();
    double damage = getDamage();  // Damage taken
}
```

### Hitting Enemy
```java
@Override
public void onBulletHit(BulletHitEvent e) {
    // Called when your bullet hits an enemy
    String victimId = e.getVictimId();
    double damage = e.getBullet().getPower() * 4;
    double energy = e.getEnergy();
}
```

### Wall Collision
```java
@Override
public void onHitWall(HitWallEvent e) {
    // Called when hitting a wall
    // Causes damage proportional to speed
}
```

### Bot Collision
```java
@Override
public void onHitBot(HitBotEvent e) {
    // Called when colliding with another bot
    String botId = e.getVictimId();
    double energy = e.getEnergy();
    boolean isRammed = e.isRammed();  // Did we ram them?
}
```

### Bot Death
```java
@Override
public void onBotDeath(BotDeathEvent e) {
    // Called when an enemy dies
    String botId = e.getVictimId();
}
```

### Win/Loss
```java
@Override
public void onWon(WonEvent e) {
    // Called when you win the round
}

@Override
public void onDeath(DeathEvent e) {
    // Called when your bot dies
}
```

### Round Events
```java
@Override
public void onRoundStarted(RoundStartedEvent e) {
    // Called at start of each round
}

@Override
public void onRoundEnded(RoundEndedEvent e) {
    // Called at end of each round
}
```

### Tick Event
```java
@Override
public void onTick(TickEvent e) {
    // Called every turn (before movements execute)
    int turnNumber = e.getTurnNumber();
}
```

## Utility Methods

### Angle Normalization
```java
double normalizeAngle(double angle) {
    // Normalizes angle to -180 to +180 range
    // Built-in to Bot class
}
```

### Bearing Calculation
```java
double calcBearing(double targetDirection) {
    // Calculate bearing from current direction to target
    // Built-in to Bot class
    return normalizeAngle(targetDirection - getDirection());
}
```

### Distance Calculation
```java
double distance = Math.hypot(targetX - getX(), targetY - getY());
```

### Angle to Point
```java
double angle = Math.toDegrees(Math.atan2(targetX - getX(), targetY - getY()));
double bearing = normalizeAngle(angle - getDirection());
```

## Common Patterns

### Track and Fire
```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    // Aim gun at enemy
    double bearing = getDirection() + e.getBearing();
    double gunTurn = normalizeAngle(bearing - getGunDirection());
    turnGunRight(gunTurn);

    // Fire
    fire(2);
}
```

### Dodge When Hit
```java
@Override
public void onHitByBullet(HitByBulletEvent e) {
    double bearing = calcBearing(e.getBullet().getDirection());
    turnRight(90 - bearing);  // Turn perpendicular
    forward(100);
}
```

### Avoid Walls
```java
@Override
public void run() {
    while (isRunning()) {
        double margin = 50;
        if (getX() < margin || getX() > 800 - margin ||
            getY() < margin || getY() > 600 - margin) {
            back(20);
            turnRight(90);
        }
        forward(50);
    }
}
```

### Radar Sweep
```java
@Override
public void run() {
    while (isRunning()) {
        turnRadarRight(360);  // Full sweep
    }
}
```

## Constants

### Arena (Default)
- Width: 800
- Height: 600

### Energy
- Starting: 100
- Maximum: 100
- Minimum: 0

### Speed
- Maximum: 8 units/turn

### Turning Rates
- Body: 10 degrees/turn
- Gun: 20 degrees/turn
- Radar: 45 degrees/turn

## Tips

1. **Commands are non-blocking** - They execute over multiple turns
2. **Use `while(isRunning())`** - Not `while(true)`
3. **Energy management** - Every shot costs energy
4. **Wall damage** - Hitting walls damages your bot
5. **Collision damage** - Ramming bots causes mutual damage
6. **Bullet speed** - Higher power = slower bullets
7. **Event timing** - Events fire after movements complete

## More Information

- Full API documentation: https://robocode-dev.github.io/tank-royale/api/java/
- Tutorial: https://robocode-dev.github.io/tank-royale/tutorial/my-first-bot
- Sample bots: `tank-royale/sample-bots/`
