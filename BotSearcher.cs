// 🛡️ 0mega Code: Hybrid Bot-Scanner v1.0
// Developed by 0mega-One
// Specialized for Unity and .NET Game Servers

using System;
using System.Collections.Generic;
using System.Linq;

namespace OmegaCode.Security
{
    public class BotScanner
    {
        public string Username { get; private set; }
        private int _suspicionScore = 0;

        public BotScanner(string username)
        {
            Username = username;
        }

        public void AnalyzeChat(string message)
        {
            // Lista de detección de 0mega-One
            string[] blacklist = { ".com", ".gg", "robux", "v e n t a", "c0m" };
            
            foreach (var word in blacklist)
            {
                if (message.ToLower().Contains(word))
                {
                    _suspicionScore += 2;
                    Console.WriteLine($"[!] {Username}: Link or suspicious keyword detected.");
                }
            }
        }

        public void AnalyzeMovement(double velocity, bool isAntiAfkActive)
        {
            // Si el movimiento es demasiado constante o nulo durante el spam
            if (velocity < 0.01 || isAntiAfkActive)
            {
                _suspicionScore += 1;
                Console.WriteLine($"[!] {Username}: Robotic movement pattern detected.");
            }
        }

        public string GetFinalVerdict()
        {
            if (_suspicionScore >= 3)
            {
                return $"🚨 PROTOCOL 0MEGA-ONE: Bot confirmed. Kick user {Username}.";
            }
            return $"✅ User {Username} is safe for now.";
        }
    }

    // Ejemplo de ejecución
    class Program
    {
        static void Main()
        {
            BotScanner myScanner = new BotScanner("BloxVents_Unity");
            myScanner.AnalyzeChat("Get free R-Bux at Scam.c0m");
            myScanner.AnalyzeMovement(0.0, true);

            Console.WriteLine(myScanner.GetFinalVerdict());
        }
    }
}
