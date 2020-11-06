from PIL import Image, ImageDraw, ImageFont
import math

font = ImageFont.truetype('font.ttf', size=16)

image = Image.open('yellow.png')
image = Image.open('purple.png')

draw = ImageDraw.Draw(image)

level = ["a", "b", "c"]

for i in range (1, 7):
    for j in range(1, 19):
        (x, y) = ( (i - 1) * 16 * 3 + 10, (j - 1) * 16 * 3 + 10)

        message = str(math.ceil(j / 3)) + level[j % 3 - 1] + str(i)

        # color = 'rgb(217, 186, 22)' # black color
        color = 'rgb(171, 42, 232)' # black color
        draw.text((x, y), message, fill=color, font=font)

(x, y) = ( (7 - 1) * 16 * 3 + 10, (1 - 1) * 16 * 3 + 10)
message = "00"
draw.text((x, y), message, fill=color, font=font)


image.save('purple_numbered.png')
