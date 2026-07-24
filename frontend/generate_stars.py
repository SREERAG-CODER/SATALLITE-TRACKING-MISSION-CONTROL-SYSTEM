import random
from PIL import Image, ImageDraw

def create_stars_bg(filename, size=1024, num_stars=800):
    img = Image.new('RGB', (size, size), color=(0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    for _ in range(num_stars):
        x = random.randint(0, size - 1)
        y = random.randint(0, size - 1)
        brightness = random.randint(100, 255)
        # Randomly choose star size
        r = random.random()
        if r < 0.8:
            # 1px star
            draw.point((x, y), fill=(brightness, brightness, brightness))
        elif r < 0.95:
            # 2x2 star
            draw.rectangle([x, y, x+1, y+1], fill=(brightness, brightness, brightness))
        else:
            # 3x3 star with a cross shape for twinkle
            c = (brightness, brightness, brightness)
            draw.point((x, y), fill=c)
            draw.point((x-1, y), fill=c)
            draw.point((x+1, y), fill=c)
            draw.point((x, y-1), fill=c)
            draw.point((x, y+1), fill=c)
            
    img.save(filename)
    print(f"Saved {filename}")

if __name__ == '__main__':
    create_stars_bg('src/main/resources/com/istms/images/stars-bg.png')
