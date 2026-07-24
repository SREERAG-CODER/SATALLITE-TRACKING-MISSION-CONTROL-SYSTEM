from PIL import Image, ImageFilter

def extract_exact_logo(input_path, output_path):
    img = Image.open(input_path).convert("RGBA")
    
    # 4x supersampling to reconstruct crisp vector-like edges
    w, h = img.size
    scale = 4
    large = img.resize((w * scale, h * scale), Image.Resampling.BICUBIC)
    
    pixels = large.load()
    lw, lh = large.size
    
    for y in range(lh):
        for x in range(lw):
            r, g, b, a = pixels[x, y]
            
            # Check for ISRO Orange (Rocket arrow & Hindi text)
            # R is high (~200-255), G is medium (~80-160), B is low (<100)
            is_orange = (r > 160) and (g > 50) and (b < 120) and (r - b > 70)
            
            # Check for ISRO Blue (Solar panels & English 'isro' text)
            # B is high (~160-255), G is medium/high (~100-220), R is low/med (<120)
            is_blue = (b > 130) and (g > 80) and (r < 140) and (b - r > 40)
            
            if is_orange or is_blue:
                # Retain original pixel color at full opacity
                pixels[x, y] = (r, g, b, 255)
            else:
                # Make background & artifacts completely transparent
                pixels[x, y] = (0, 0, 0, 0)
                
    # Downsample back with high-quality LANCZOS anti-aliasing
    final_img = large.resize((w, h), Image.Resampling.LANCZOS)
    final_img.save(output_path, "PNG")
    print(f"Exact logo extracted cleanly to {output_path}")

if __name__ == "__main__":
    extract_exact_logo(
        r"C:\Users\SREERAG\.gemini\antigravity-ide\brain\6e2d19a7-5d91-4f70-9463-ae79b2cefa31\media__1784910282815.png",
        r"src\main\resources\com\istms\images\isro-logo.png"
    )
