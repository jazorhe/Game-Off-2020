import math
from PIL import Image, ImageDraw, ImageFont
modes = ["facility-frames", "facility-numbers"]
font = ImageFont.truetype('font.ttf', size=16)
mode = modes[0]

def main():

    DoFacilityFrames()
    # DoNormalNumbers(7, 18, 48, 48)

def DoNormalNumbers(imgWidthNum, imgHeightNum, tileWidth, tileHeight):
    image = Image.open('purple.png')
    draw = ImageDraw.Draw(image)
    counter = 0

    for j in range(1, imgHeightNum + 1):
        for i in range (1, imgWidthNum + 1):
            (x, y) = ( (i - 1) * tileWidth + 10, (j - 1) * tileHeight + 10)

            counter += 1
            message = str(counter)

            color = 'rgb(171, 42, 232)'
            draw.text((x, y), message, fill=color, font=font)

    image.save('purple_numbered.png')
    image.close()

    image = Image.open('yellow.png')
    draw = ImageDraw.Draw(image)
    counter = 0

    for j in range(1, imgHeightNum + 1):
        for i in range (1, imgWidthNum + 1):
            (x, y) = ( (i - 1) * tileWidth + 10, (j - 1) * tileHeight + 10)

            counter += 1
            message = str(counter)

            color = 'rgb(217, 186, 22)'
            draw.text((x, y), message, fill=color, font=font)

    image.save('yellow_numbered.png')
    image.close()

def DoFacilityFrames():
    image = Image.open('purple.png')
    draw = ImageDraw.Draw(image)
    level = ["a", "b", "c"]

    for i in range (1, 7):
        for j in range(1, 19):
            (x, y) = ( (i - 1) * 16 * 3 + 10, (j - 1) * 16 * 3 + 10)

            message = str(math.ceil(j / 3)) + level[j % 3 - 1] + str(i)

            color = 'rgb(171, 42, 232)'
            draw.text((x, y), message, fill=color, font=font)

    (x, y) = ( (7 - 1) * 16 * 3 + 10, (1 - 1) * 16 * 3 + 10)
    message = "00"
    draw.text((x, y), message, fill=color, font=font)

    image.save('purple.png')
    image.close()

    image = Image.open('yellow.png')
    draw = ImageDraw.Draw(image)

    for i in range (1, 7):
        for j in range(1, 19):
            (x, y) = ( (i - 1) * 16 * 3 + 10, (j - 1) * 16 * 3 + 10)

            message = str(math.ceil(j / 3)) + level[j % 3 - 1] + str(i)

            color = 'rgb(217, 186, 22)'
            draw.text((x, y), message, fill=color, font=font)

    (x, y) = ( (7 - 1) * 16 * 3 + 10, (1 - 1) * 16 * 3 + 10)
    message = "00"
    draw.text((x, y), message, fill=color, font=font)

    image.save('yellow.png')


if __name__ == "__main__":
    main()
