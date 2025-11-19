return {
    center = function(cutscene, event)
-- make kris walk to the "room_center" marker, taking 1 second, and wait until they're done
        cutscene:wait(cutscene:walkTo("kris", "room_center", 1))
        -- fade the screen to black
        cutscene:wait(cutscene:fadeOut(1))
        -- show a textbox
        cutscene:text("* ...")
        -- play the impact sound
        Assets.playSound("impact")
        -- wait 1 second
        cutscene:wait(1)
        -- fade the screen back in
        cutscene:wait(cutscene:fadeIn(1))
    end
}