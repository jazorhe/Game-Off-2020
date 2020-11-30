CreditsState = Class{__includes = BaseState}

function CreditsState:init()
    self.statename = "CreditsState"
    self.credits = {
        [1] = {"Graphical Effects:", "Toothless Frostiana",
                PURPLE, gTextures['credit-tooth']},
        [2] = {"Graphical Effects:", "Rhoda Du",
                YELLOW, gTextures['credit-rhoda']},
        [3] = {"Game Development:", "Jazor He",
                table.pack(rgb(91, 152, 188)), gTextures['credit-jazor']},
        [4] = {"Music Production:", "Adam Chen",
                table.pack(rgb(141, 150, 97)), gTextures['credit-adam']},
        [5] = {"Special Thanks To:", "Olivia Deng",
                table.pack(rgb(242, 216, 191)), gTextures['credit-olivia']}
    }
    self.x = 120
    self.y = VIRTUAL_HEIGHT / 2 - 48
    self.width = VIRTUAL_WIDTH - 240

    self.displayImage = false
    self.hover = nil
    self.back = false
end

function CreditsState:update(dt)
    if love.keyboard.wasPressed('escape') then
        gStateStack:pop()
    end

    if self.displayImage and (love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') or love.mouse.wasPressed(1) or love.keyboard.wasPressed('escape')) then
        self.displayImage = false
        self.image = nil
    elseif not self.displayImage then
        if love.keyboard.wasPressed('down') then
            self.hover = (self.hover and self.hover < 6) and self.hover + 1 or 1
        elseif love.keyboard.wasPressed('up') then
            self.hover = (self.hover and self.hover > 1) and self.hover - 1 or 6
        end

        if mouseX > 120 and mouseX < VIRTUAL_WIDTH - 120 and mouseY > VIRTUAL_HEIGHT / 2 - 48 and mouseY < VIRTUAL_HEIGHT / 2 + 60 and not self.displayImage then
            self.hover = math.ceil((mouseY - self.y) / 24)
        end

        if mouseX > VIRTUAL_WIDTH / 2 - 25 and mouseX < VIRTUAL_WIDTH / 2 + 25 and mouseY > VIRTUAL_HEIGHT - 84 and mouseY < VIRTUAL_HEIGHT - 60 and not self.displayImage then
            self.hover = 6
        end

        if self.hover and (love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('kpenter') or love.mouse.wasPressed(1)) then
            if self.hover == 6 then
                gStateStack:pop()
            else
                self.image = self.credits[self.hover][4]
                self.displayImage = true
            end
        end
    end

end

function CreditsState:render()
    love.graphics.setColor(0, 0, 0, 0.8)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setColor(WHITE)

    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Credits', 0, 84, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])

    for k, credit in pairs(self.credits) do
        if self.hover and k == self.hover then
            love.graphics.setColor(credit[3])
        end
        love.graphics.printf(credit[1], self.x, self.y + (k - 1) * 24, self.width, 'left')
        love.graphics.printf(credit[2], self.x, self.y + (k - 1) * 24, self.width, 'right')
        love.graphics.setColor(WHITE)
    end

    if self.hover == 6 then
        love.graphics.setColor(rgb(150, 153, 147))
    end
    love.graphics.printf('Back', 0, VIRTUAL_HEIGHT - 84, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(WHITE)

    if self.displayImage and self.image then
        love.graphics.draw(self.image, 0, 0, 0, 0.5, 0.5)
    end
end
