// 🛡️ 0mega Code: Hybrid Bot-Scanner v1.0
// Developed by 0mega-One
// Specialized in High-Performance Behavioral Analysis

#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

class BotSearcher {
private:
    std::string username;
    int suspicionScore = 0;

public:
    BotSearcher(std::string name) : username(name) {}

    void analyzeChat(std::string message) {
        // Lista negra de 0mega Code
        std::vector<std::string> blacklist = {".com", ".gg", "robux", "v e n t a"};
        
        // Convertir a minúsculas para análisis
        std::transform(message.begin(), message.end(), message.begin(), ::tolower);

        for (const std::string& word : blacklist) {
            if (message.find(word) != std::string::npos) {
                suspicionScore += 2;
                std::cout << "[!] Flagged: Link/Keyword detected in message." << std::endl;
            }
        }
    }

    void analyzeMovement(float distanceMoved, bool antiAfkDetected) {
        // Regla 0mega-One: Movimiento robótico o nulo
        if (distanceMoved < 0.01 || antiAfkDetected) {
            suspicionScore += 1;
            std::cout << "[!] Flagged: Non-human movement pattern." << std::endl;
        }
    }

    bool shouldKick() {
        return suspicionScore >= 3;
    }

    std::string getStatus() {
        if (shouldKick()) {
            return "🚨 PROTOCOL 0MEGA-ONE: Bot confirmed. Action: KICK " + username;
        }
        return "✅ User " + username + " is currently under observation.";
    }
};

int main() {
    BotSearcher scanner("BloxVents_C++");
    
    // Simulación de detección
    scanner.analyzeChat("Free items at MyScam.com!");
    scanner.analyzeMovement(0.0f, true);

    std::cout << scanner.getStatus() << std::endl;

    return 0;
}
