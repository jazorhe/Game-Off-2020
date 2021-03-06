--[[
    Given an "atlas" (a texture with multiple sprites), as well as a
    width and a height for the tiles therein, split the texture into
    all of the quads by simply dividing it evenly.
]]
function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidth = math.floor(atlas:getWidth() / tilewidth)
    local sheetHeight = math.floor(atlas:getHeight() / tileheight)

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] =
                love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
                tileheight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

--[[
    Recursive table printing function.
    https://coronalabs.com/blog/2014/09/02/tutorial-printing-table-contents/
]]
function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end


function rgba(r, g, b, a)
    -- a = a > 1 and a / 255 or a
    if not a then
        a = 1
    elseif a <= 1 then
        a = a
    else
        a = a / 255
    end

    return r / 255, g / 255, b / 255, a
end

function rgb(r, g, b)
    return rgba(r, g, b, 1)
end

function table.pack(...)
    return {n = select("#", ...), ...}
end

function gFuncExitToStart()
    gSounds['yellow-theme']:stop()
    gSounds['purple-theme']:stop()
    gStateStack:push(FadeInState({
        r = 0, g = 0, b = 0
    }, 1,
    function()
        gStateStack.states = {}
        Event.handlers = {}
        gStateStack:push(StartState())
        gStateStack:push(FadeOutState({
            r = 0, g = 0, b = 0
        }, 1,
        function() end))
    end))
end
