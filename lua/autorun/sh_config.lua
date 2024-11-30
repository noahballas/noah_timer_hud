Ntimer = Ntimer or {}
Ntimer.Config = {}

// Activer les bandes noires derrière l'HUD
Ntimer.Config.BackgroundBlack = true

// Seconde pour activer une nouvelle tâche
Ntimer.Config.Seconde = 1000

// Les jobs qui voient l'HUD
Ntimer.Config.Job = {
    ["Citizen"] = true,
    ["Chômeur"] = true
}

// Les tâches à faire
Ntimer.Config.TaskList = {
    "Laverie",
    "Salle de sport",
    "À la douche",
    "Repas | Cantine",
    "Effectuer des pompes"
}

// Couleur générale de l'hud | https://marketplace.visualstudio.com/items?itemName=venner.vscode-glua-enhanced
Ntimer.Config.Colors = {
    ["TimerBackground"] = Color(59, 1, 1),
    ["BTimerBackground"] = Color(5, 5, 5),
    ["TimerText"] = Color(255, 255, 255),
    ["TaskText"] = Color(200, 200, 0)
}

// Modifier les icônes | https://github.com/WilliamVenner/gmpublisher

Ntimer.Config.Materials = {
    ["Logo"] = Material("Noah/TimerPriser/logo.png")
}
