// 🛡️ 0mega Code: Hybrid Bot-Scanner v1.0
// Developed by 0mega-One
// File: BotSearcher.java

import java.util.ArrayList;

public class BotSearcher { // El nombre de la clase ahora coincide con el archivo
    private String username;
    private int suspicionScore = 0;

    public BotSearcher(String username) {
        this.username = username;
    }

    public void analyzeChat(String message) {
        String[] blacklist = {".com", ".gg", "robux", "v e n t a", "c0m"};
        String lowerMessage = message.toLowerCase();

        for (String word : blacklist) {
            if (lowerMessage.contains(word)) {
                this.suspicionScore += 2;
            }
        }
    }

    public void analyzeMovement(double distance, boolean isAntiAfk) {
        if (distance < 0.01 || isAntiAfk) {
            this.suspicionScore += 1;
        }
    }

    public String getVerdict() {
        if (this.suspicionScore >= 3) {
            return "🚨 PROTOCOL 0MEGA-ONE: Bot confirmed. KICK " + this.username;
        }
        return "✅ User " + this.username + " is safe.";
    }

    public static void main(String[] args) {
        BotSearcher scanner = new BotSearcher("BotTester_Java");
        scanner.analyzeChat("Free items at scam.c0m");
        scanner.analyzeMovement(0.0, true);
        System.out.println(scanner.getVerdict());
    }
}
