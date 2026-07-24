from PIL import Image

def make_transparent(input_path, output_path):
    img = Image.open(input_path).convert("RGBA")
    datas = img.getdata()

    new_data = []
    for item in datas:
        r, g, b, a = item
        # Check if the pixel is part of the white/grey checkerboard background
        # Checkerboard background typically consists of very light/white pixels and light-grey pixels
        # where R, G, B values are nearly equal (monochrome/grayscale) and bright (>180 or >200).
        # The ISRO logo has distinct vibrant colors:
        # Orange: High R, medium G, low B (e.g. 240, 100, 20)
        # Blue: Low/Med R, Med G, High B (e.g. 0, 150, 220)
        
        is_grayscale = abs(r - g) < 15 and abs(g - b) < 15 and abs(r - b) < 15
        if is_grayscale and r > 150:
            # Make transparent
            new_data.append((0, 0, 0, 0))
        else:
            new_data.append(item)

    img.putdata(new_data)
    img.save(output_path, "PNG")
    print(f"Processed transparent image saved to {output_path}")

if __name__ == "__main__":
    make_transparent(
        r"C:\Users\SREERAG\.gemini\antigravity-ide\brain\6e2d19a7-5d91-4f70-9463-ae79b2cefa31\media__1784910282815.png",
        r"src\main\resources\com\istms\images\isro-logo.png"
    )
