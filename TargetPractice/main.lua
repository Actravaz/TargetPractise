require "gui"


active = false
clicks = 0
time = 0
local window = gui.create_window()
window.title = "Target Practice"
target = window:add_image()
target.x = -1000
target.file_name = "Target.png"
local label = window:add_label()
label.text = "See how fast you can click 10 targets in"
label.x = 200
local button = window:add_button()
button.text = "Press when you're ready"
button.width = 220
button.x = 200
button.y = 40

local timer = gui:create_timer()
timer.interval = 0.1
timer:start()

function button:on_click()
  if active == false then
    time = 0
    target.x = math.random(100,500)
    target.y = math.random(100,410)
    button.text = tostring(clicks)
    active = true
  end
end

function target:on_mouse_down()
  if active == true then
    target.x = math.random(100,500)
    target.y = math.random(100,410)
    clicks = clicks + 1
    button.text = tostring(clicks)
    if clicks == 10 then
      active = false
      button.text = "Press when you're ready"
      target.x = -1000
      label.text = ""..tostring(clicks/time).." hps"
      clicks = 0

    end
  end
end

function timer:on_tick()
  if active == true then
      time = time + 0.1
  end
end





gui.run()