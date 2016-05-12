-- Requires
spaces = require("hs._asm.undocumented.spaces")

-- Key combiations
local hyper = {"cmd", "alt", "ctrl", "shift"}

-- Misc config
hs.window.animationDuration = 0

-- KEY BINDINGS ---------------------------------------------------------------

-- Reload Hammerspoon config
hs.hotkey.bind(hyper, "r", function()
    hs.reload()
    hs.alert.show("Reloaded Hammerspoon configuration.")
end)

-- Window hinting
hs.hints.fontSize = 20.0
--hs.hints.style = "vimperator"
hs.hotkey.bind(hyper, "f", function()
    hs.hints.windowHints()
end)

-- Move left a space
hs.hotkey.bind(hyper, "[", function()
    spaces.changeToSpace(relativeSpaceId(-1), false)
end)

-- Move right a space
hs.hotkey.bind(hyper, "]", function()
    spaces.changeToSpace(relativeSpaceId(1), false)
end)

-- Move current window left and follow
hs.hotkey.bind(hyper, ";", function()
    moveCurrentWindowToSpace(false, true)
end)

-- Move current window right and follow
hs.hotkey.bind(hyper, "'", function()
    moveCurrentWindowToSpace(true, true)
end)

function moveCurrentWindowToSpace(right, follow)
    local newSpace
    if right then
        newSpace = relativeSpaceId(1)
    else
        newSpace = relativeSpaceId(-1)
    end
    local thisWindowId = hs.window.focusedWindow():id()

    spaces.moveWindowToSpace(thisWindowId, newSpace)
    if follow then
        spaces.changeToSpace(newSpace, false)
    end
end

function relativeSpaceId(jumpDist)
    local allSpaces = spaces.query()

    local currentSpaceIdx = function()
        for i=1,spaces.count() do
            if allSpaces[i] == spaces.activeSpace() then
                return i
            else
                i = i + 1
            end
        end
    end

    local switchToIdx = (currentSpaceIdx() - jumpDist - 1) % spaces.count() + 1
    return allSpaces[switchToIdx]
end
