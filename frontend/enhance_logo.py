from PIL import Image

def process_ai_logo(input_path, output_path):
    img = Image.open(input_path).convert("RGBA")
    
    # 2x Supersampling for ultra-crisp edges
    w, h = img.size
    scale = 2
    large = img.resize((w * scale, h * scale), Image.Resampling.BICUBIC)
    
    pixels = large.load()
    lw, lh = large.size
    
    for y in range(lh):
        for x in range(lw):
            r, g, b, a = pixels[x, y]
            
            max_c = max(r, g, b)
            min_c = min(r, g, b)
            sat = max_c - min_c
            
            # If high brightness & low saturation (white background)
            if max_c > 210 and sat < 40:
                # Smooth alpha transition for crisp anti-aliased edge
                if max_c >= 240:
                    alpha = 0
                else:
                    alpha = int(255 * (1.0 - (max_c - 210) / 30.0))
                pixels[x, y] = (r, g, b, alpha)

    sharp_logo = large.resize((w, h), Image.Resampling.LANCZOS)
    sharp_logo.save(output_path, "PNG")
    print(f"AI ISRO Logo saved with transparent background to {output_path}")

if __name__ == "__main__":
    process_ai_logo(
        r"C:\Users\SREERAG\.gemini\antigravity-ide\brain\6e2d19a7-5d91-4f70-9463-ae79b2cefa31\ai_isro_logo_1784911134854.png",
        r"src\main\resources\com\istms\images\isro-logo.png"
    )
