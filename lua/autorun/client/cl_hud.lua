--[[---------------------------------------------------------
   Name: noah_timer_hud
   Author : Noah
   Desc: Timer pour prison
   Version : 1.2
   Last update : 01/12/2024
   Discord : noah_ballas
-----------------------------------------------------------]]


RX = RX or function(x) return x / 1920 * ScrW() end
RY = RY or function(y) return y / 1080 * ScrH() end

-- Font 
surface.CreateFont("Noah:Hud:Timer", {
    font = "Montserrat-Bold",
    size = RY(22),
})
surface.CreateFont("Noah:Text:Timer", {
    font = "Montserrat-Bold",
    size = RY(26),
})

local currentTask = "Temps libre..."
local lastTask = nil
local taskTimer = Ntimer.Config.Seconde

local function IsValidJob(ply)
    local jobName = team.GetName(ply:Team())
    return Ntimer.Config.Job[jobName] or false
end

local function GenerateNewTask()
    local newTask
    repeat
        newTask = Ntimer.Config.TaskList[math.random(#Ntimer.Config.TaskList)]
    until newTask ~= lastTask

    lastTask = newTask
    currentTask = newTask
    taskTimer = Ntimer.Config.Seconde 
end

hook.Add("HUDPaint", "Noah:TimerPrison:HUD", function()
    local ply = LocalPlayer()
    if not IsValid(ply) or not IsValidJob(ply) then return end
    

    if Ntimer.Config.BackgroundBlack then 
    draw.RoundedBox(20, RX(1510), RY(953), RX(410), RY(128), Ntimer.Config.Colors["BTimerBackground"])
    end
    draw.RoundedBox(20, RX(1515), RY(956), RX(400), RY(120), Ntimer.Config.Colors["TimerBackground"])


    draw.SimpleText("Tâche actuelle:", "Noah:Text:Timer", RX(1530), RY(974), Ntimer.Config.Colors["TaskText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(currentTask, "Noah:Hud:Timer", RX(1710), RY(970), Ntimer.Config.Colors["TimerText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

    draw.SimpleText("Temps restant: " .. taskTimer .. "s", "Noah:Hud:Timer", RX(1710), RY(995), Ntimer.Config.Colors["TimerText"], TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

end)

timer.Create("Noah:TaskTimer", 1, 0, function()
    if taskTimer > 0 then
        taskTimer = taskTimer - 1
    else
        GenerateNewTask()
    end
end)

concommand.Add("nono_force_new_task", function()
    GenerateNewTask()
end)