import math
from PIL import Image, ImageDraw, ImageFont
import os

SUFIX = '840'
CONVERTED_SIZE = (48, 48)
SCALE = 14

def main():
    for filename in os.listdir('yellow/'):
        if filename.endswith(SUFIX + ".png"):
            print('Processing:' + os.path.join(filename) + '...\n')
            shrink(filename, CONVERTED_SIZE, SCALE)
        else:
            continue

def shrink(filename, converted_size, scale):

    image = Image.open('yellow/' + filename)
    rgb = image.convert('RGBA')

    new_image = Image.new(mode='RGBA', size=converted_size, color=(0, 0, 0, 1))
    draw = ImageDraw.Draw(new_image)
    w, h = converted_size

    for j in range (0, h):
        for i in range(0, w):
            a = rgb.getpixel((i * scale + 1, j * scale + 1))
            draw.point((i, j), fill= a)

    filename = filename.replace('840', '48')
    new_image.save('yellow/converted/' + filename)
    new_image.close()
    image.close()


if __name__ == "__main__":
    main()
