# Bot Strategy Guide

This guide provides concrete strategy patterns and code examples to help you build a competitive bot.

## Movement Strategies

### 1. Circular Movement

Move in a circle around the arena - good for dodging and maintaining distance.

```java
@Override
public void run() {
    while (isRunning()) {
        forward(100);
        turnRight(10);  // Adjust for circle size
    }
}
```

**Pros:** Predictable for you, hard to hit
**Cons:** Can be predicted by smart opponents
**Best for:** General-purpose movement

### 2. Random Walk

Move unpredictably to avoid being targeted.

```java
@Override
public void run() {
    while (isRunning()) {
        forward(Math.random() * 100);
        turnRight(Math.random() * 90 - 45);
    }
}
```

**Pros:** Hard to predict
**Cons:** Less controlled positioning
**Best for:** Defensive play

### 3. Wall Following

Follow the arena perimeter for maximum visibility and corner avoidance.

```java
@Override
public void run() {
    // Move to wall first
    forward(200);

    while (isRunning()) {
        forward(100);
        turnRight(90);
        forward(100);
        turnLeft(90);
    }
}
```

**Pros:** Good arena coverage, avoids center danger
**Cons:** Predictable pattern
**Best for:** Defensive positioning

### 4. Corner Camping

Stay in a corner and pick off enemies from a defensive position.

```java
private boolean inCorner = false;

@Override
public void run() {
    // Go to nearest corner
    if (!inCorner) {
        if (getX() < 400) turnLeft(45); else turnRight(45);
        forward(400);
        inCorner = true;
    }

    while (isRunning()) {
        turnRadarRight(360);
    }
}
```

**Pros:** Defensive, wall protection
**Cons:** Limited mobility
**Best for:** Sniper strategy

## Targeting Strategies

### 1. Linear Targeting (Simple)

Fire at where the enemy is right now.

```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    fire(1);
}
```

**Accuracy:** Low against moving targets
**Complexity:** Minimal
**Best for:** Close range or stationary targets

### 2. Bearing-Based Targeting

Calculate the angle to the enemy and aim precisely.

```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    // Calculate absolute bearing to enemy
    double bearing = getDirection() + e.getBearing();

    // Calculate how much to turn gun
    double gunTurn = normalizeAngle(bearing - getGunDirection());
    turnGunRight(gunTurn);

    fire(2);
}
```

**Accuracy:** Better for moving targets
**Complexity:** Moderate
**Best for:** Mid-range combat

### 3. Predictive Targeting

Predict where the enemy will be when bullet arrives.

```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    // Calculate distance
    double distance = e.getDistance();

    // Estimate bullet travel time (bullet speed ≈ 20 - 3 * power)
    double bulletSpeed = 20 - 3 * 2; // For power 2
    double time = distance / bulletSpeed;

    // Predict enemy position (assuming linear movement)
    double predictedX = e.getX() + e.getVelocity() * Math.sin(Math.toRadians(e.getDirection())) * time;
    double predictedY = e.getY() + e.getVelocity() * Math.cos(Math.toRadians(e.getDirection())) * time;

    // Calculate angle to predicted position
    double angle = Math.toDegrees(Math.atan2(predictedX - getX(), predictedY - getY()));
    double gunTurn = normalizeAngle(angle - getGunDirection());

    turnGunRight(gunTurn);
    fire(2);
}
```

**Accuracy:** High against predictable movement
**Complexity:** High
**Best for:** Mid to long range

### 4. Distance-Based Power

Adjust bullet power based on distance - more power when close.

```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    double distance = e.getDistance();

    // Power calculation: closer = more power
    double power;
    if (distance < 100) {
        power = 3.0;  // Maximum damage up close
    } else if (distance < 300) {
        power = 2.0;  // Medium damage at medium range
    } else {
        power = 1.0;  // Conserve energy at long range
    }

    fire(power);
}
```

**Pros:** Energy efficient, maximizes damage
**Best for:** All-around combat

## Defensive Strategies

### 1. Perpendicular Dodging

Turn perpendicular when hit to avoid follow-up shots.

```java
@Override
public void onHitByBullet(HitByBulletEvent e) {
    // Calculate bearing to bullet direction
    double bearing = calcBearing(e.getBullet().getDirection());

    // Turn perpendicular (90 degrees) to bullet path
    turnRight(90 - bearing);
    forward(100);
}
```

**Effectiveness:** High for avoiding linear fire
**Best combined with:** Any movement strategy

### 2. Oscillating Movement

Move back and forth to make targeting difficult.

```java
private int direction = 1;

@Override
public void run() {
    while (isRunning()) {
        forward(100 * direction);
        turnRight(20);
        direction *= -1;  // Reverse direction
    }
}
```

**Effectiveness:** Good against linear targeting
**Best for:** Mid-range combat

### 3. Wall Avoidance

Detect walls early and turn away.

```java
@Override
public void run() {
    while (isRunning()) {
        // Check proximity to walls (assuming 800x600 arena)
        if (getX() < 50 || getX() > 750 || getY() < 50 || getY() > 550) {
            // Too close to wall, turn away
            back(20);
            turnRight(90);
        }

        forward(50);
    }
}

@Override
public void onHitWall(HitWallEvent e) {
    // Emergency wall hit - turn away sharply
    back(100);
    turnRight(180);
}
```

**Importance:** Critical - wall hits drain energy
**Must have:** For any competitive bot

## Advanced Techniques

### 1. Radar Lock

Keep radar locked on an enemy for continuous tracking.

```java
private double lastEnemyBearing = 0;

@Override
public void onScannedBot(ScannedBotEvent e) {
    lastEnemyBearing = e.getBearing();

    // Lock radar on enemy
    double radarTurn = normalizeAngle(getDirection() + e.getBearing() - getRadarDirection());
    turnRadarRight(radarTurn);

    fire(2);
}

@Override
public void run() {
    while (isRunning()) {
        // If we haven't seen enemy recently, scan widely
        if (getTime() % 10 == 0) {
            turnRadarRight(360);
        }
    }
}
```

### 2. Energy Management

Monitor energy and adjust strategy accordingly.

```java
@Override
public void onScannedBot(ScannedBotEvent e) {
    double myEnergy = getEnergy();
    double enemyEnergy = e.getEnergy();

    if (myEnergy < 20) {
        // Low energy - be conservative
        fire(0.1);
        // Maybe retreat
        back(50);
    } else if (myEnergy > enemyEnergy + 30) {
        // Energy advantage - be aggressive
        fire(3.0);
        forward(50);
    } else {
        // Normal combat
        fire(2.0);
    }
}
```

### 3. Multi-Enemy Tracking

Track and prioritize multiple enemies.

```java
private Map<String, ScannedBotEvent> enemies = new HashMap<>();

@Override
public void onScannedBot(ScannedBotEvent e) {
    // Store enemy info
    enemies.put(e.getScannedBotId(), e);

    // Find closest enemy
    ScannedBotEvent closest = null;
    double minDistance = Double.MAX_VALUE;

    for (ScannedBotEvent enemy : enemies.values()) {
        if (enemy.getDistance() < minDistance) {
            minDistance = enemy.getDistance();
            closest = enemy;
        }
    }

    // Target closest enemy
    if (closest != null) {
        double bearing = getDirection() + closest.getBearing();
        double gunTurn = normalizeAngle(bearing - getGunDirection());
        turnGunRight(gunTurn);
        fire(2);
    }
}
```

## Sample Bot Strategies

Study these bots in `tank-royale/sample-bots/`:

- **MyFirstBot** - Basic back-and-forth movement with 360° gun spin
- **SpinBot** - Spins in place while firing
- **Walls** - Wall-following perimeter patrol (strong performer!)
- **Corners** - Corner camping strategy
- **Fire** - Simple tracking and firing
- **RamFire** - Aggressive ramming strategy
- **TrackFire** - Advanced tracking
- **Crazy** - Unpredictable movement
- **Target** - Stationary practice target
- **VelocityBot** - Uses velocity for predictions

## Combining Strategies

Mix and match for a unique bot:

**Aggressive Bot:**
- Circular movement
- Predictive targeting
- High-power firing
- Chase behavior

**Defensive Bot:**
- Random walk or corner camping
- Distance-based firing
- Energy conservation
- Retreat when low health

**Balanced Bot:**
- Wall following
- Bearing-based targeting
- Perpendicular dodging
- Energy-aware firing

## Testing Your Strategy

1. **Test against sample bots** - Start with easy targets
2. **Test against multiple bots** - See how you handle crowds
3. **Test different strategies** - Try offense, defense, balanced
4. **Iterate quickly** - Small changes, frequent testing
5. **Watch the battles** - Learn from what works and what doesn't

## Remember

- **Simple often wins** - A reliable basic strategy beats a buggy complex one
- **Test frequently** - Don't code for hours without testing
- **Learn from losses** - Watch replays to see what went wrong
- **Energy matters** - Every bullet costs energy, every hit loses energy
- **Positioning is key** - Where you are is as important as how you shoot

Good luck building your champion bot! 🏆
