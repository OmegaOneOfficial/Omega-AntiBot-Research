# 🛡️ 0mega Code: Hybrid Bot-Scanner v1.0
# Developed by 0mega-One

class OmegaScanner:
    def __init__(self, username):
        self.username = username
        self.suspicion_score = 0

    def analyze_behavior(self, message, is_moving_robotically, has_teleported):
        # --- PARTE 1: LÓGICA DE CHAT (Tu regla de oro) ---
        keywords = [".com", ".gg", "robux", "v e n t a"]
        if any(key in message.lower() for key in keywords):
            self.suspicion_score += 2
            print(f"[!] {self.username} envió un link o palabra prohibida.")

        # --- PARTE 2: LÓGICA DE MOVIMIENTO (Comportamiento Raro) ---
        if is_moving_robotically:
            # Movimientos en línea recta perfecta o giros constantes (Anti-AFK)
            self.suspicion_score += 1
            print(f"[!] {self.username} se mueve como una máquina.")
            
        if has_teleported:
            # Aparecer y desaparecer (Tu observación de que entran y salen rápido)
            self.suspicion_score += 1
            print(f"[!] {self.username} detectado con saltos de posición.")

        # --- RESULTADO FINAL ---
        if self.suspicion_score >= 3:
            return f"🚨 PROTOCOLO 0MEGA-ONE: Expulsando a {self.username} por comportamiento de BOT."
        return f"✅ {self.username} bajo observación."

# Prueba de campo de 0mega-One
scanner = OmegaScanner("BloxVents_99")
print(scanner.analyze_behavior("Get items at Scam.com", True, False))
