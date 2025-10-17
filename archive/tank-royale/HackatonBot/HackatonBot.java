import dev.robocode.tankroyale.botapi.*;
import dev.robocode.tankroyale.botapi.events.*;

// ------------------------------------------------------------------
// HackatonBot
// ------------------------------------------------------------------
// A custom bot created to test the hackathon setup.
// Strategy: Circle around the arena while scanning and firing.
// ------------------------------------------------------------------
public class HackatonBot extends Bot {

    // The main method starts our bot
    public static void main(String[] args) {
        new HackatonBot().start();
    }

    // Called when a new round is started
    @Override
    public void run() {
        // Main battle loop - move in a circular pattern
        while (isRunning()) {
            // Move forward
            forward(100);
            // Turn slightly to create circular movement
            turnRight(15);
            // Keep the radar spinning to find enemies
            turnRadarRight(45);
        }
    }

    // We spotted an enemy bot!
    @Override
    public void onScannedBot(ScannedBotEvent e) {
        // Calculate distance to the enemy
        double enemyX = e.getX();
        double enemyY = e.getY();
        double dx = enemyX - getX();
        double dy = enemyY - getY();
        double distance = Math.sqrt(dx * dx + dy * dy);

        // Calculate power based on distance (closer = more power)
        double power = Math.min(3.0, 400.0 / distance);

        // Fire at the scanned bot
        fire(power);

        // If the bot is close, back up a bit
        if (distance < 100) {
            back(50);
        }
    }

    // We got hit by a bullet!
    @Override
    public void onHitByBullet(HitByBulletEvent e) {
        // Turn perpendicular to the bullet to evade
        var bearing = calcBearing(e.getBullet().getDirection());
        turnRight(90 - bearing);

        // Move away from the danger
        forward(100);
    }

    // We hit a wall!
    @Override
    public void onHitWall(HitWallEvent e) {
        // Back up and turn to get away from the wall
        back(50);
        turnRight(90);
    }

    // We hit another bot!
    @Override
    public void onHitBot(HitBotEvent e) {
        // If we're hitting a bot, ram and shoot!
        fire(2.0);

        // Back up a bit
        back(30);
    }
}
