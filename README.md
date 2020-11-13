# Game-Off-2020

[Game Off 2020](https://itch.io/jam/game-off-2020) is an annual game jam, where participants spend the month of November creating games based on a secret theme. Participate individually, or as a team. Use whatever game engines, libraries, and languages you like.

The theme for this year’s Game Off is **MOONSHOT**.

Our team initially consists of 4 members:
-   **Adam Shi Chen**: Music Composing
-   **Cypress Bolan Li**: Art Design
-   **Jazor Jiehao He**: Game Development
-   **Rhoda Honglin Du**: Art Design


## Concept: Moon Heist

The player is sent to the Moon and is in charge of the latest space project: ***The International Moon Base***, funded by the ***International Space association*** (transient name). The player is also secretly employed by a giant science/technology company ***Tesla***, which secretly demanded the player to construct a hidden secondary moon base, and its final attempt is to steal the moon for unknown reason.


<img src="Concepts/img/Moon Heist.png" width="700">



## Art Style

## Data Structure

## Balancing



## Todo List
-   背景图设计
-   UI设计
    -   UI网格化


## Dev Log:
Sprite Structure:

<img src="Concepts/img/yellow-numbered.png" width="300">
<img src="Concepts/img/purple-numbered.png" width="300">

<br>

*Isometric-like* tiles hovering:

```lua
function Facility:isHovered()
    -- This function has been achieved using very specific trigonometry for our prites. Our sprites are 30-60 degrees and when handling hover actions, because of the transparent space around the sprite, multiple sprites are thought to be selected. The hover action has been handled within the Facility class for decomposition purposes, thus I would not want to handle hovering in higher level classes with layering functions just to for this puposes. Thus I went with a more complex approach. Might not be the best to do.
    if mouseX > self.x + self.offsetX and mouseX < self.x + self.offsetX + FACILITY_SIZE * 2 then
        if mouseY > self.y + self.offsetY and mouseY < self.y + self.offsetY + FACILITY_SIZE * 2 then

            -- exclude top left corner
            if (mouseY - self.y - self.offsetY) < - math.sqrt(3) * (mouseX - self.x - self.offsetX) + math.sqrt(3) / (math.sqrt(3) + 1) * 96 + 10 then
                return false
            end

            -- exclude top right corner
            if (mouseY - self.y - self.offsetY) < 1 / math.sqrt(3) * (mouseX - self.x - self.offsetX) - 1 / (math.sqrt(3) + 3) * 96 + 10 then
                return false
            end

            -- exclude bottom left corner
            if (mouseY - self.y - self.offsetY) > 1 / math.sqrt(3) * (mouseX - self.x - self.offsetX) + math.sqrt(3) / (math.sqrt(3) + 1) * 96 - 10 then
                return false
            end

            -- exclude bottom right corner
            if (mouseY - self.y - self.offsetY) > - math.sqrt(3) * (mouseX - self.x - self.offsetX) + (math.sqrt(3) + 4) / (math.sqrt(3) + 1) * 96 - 10 then
                return false
            end

            return true
        end
    end
    return false
end
```

-   

## Special Thanks To:
-   Olivia Chuyi Deng


## Useful Links:
-   [LÖVE2d](https://love2d.org/wiki/love)
-   [Lua Knife](https://github.com/airstruck/knife)
-   [Push Module for Lua](https://github.com/Ulydev/push)
-   [Fonts: Dafont.com](https://www.dafont.com/)
-   [Freely Available Game Assets: Open Game Art](https://opengameart.org/)
-   [Sound Effects: Bfxr Sound Effect Generator](https://www.bfxr.net/)
-   [Shader](https://www.shadertoy.com/)
-   Markdown Guides:
    -   [Embed youtube to markdown, GitLab, GitHub](http://embedyoutube.org/)
    -   [GitHub: Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
    -   [Markdown Emoji Cheatsheet](https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md)
-   Books and Materials:
    -   [How to Make an RPG](https://howtomakeanrpg.com/)
