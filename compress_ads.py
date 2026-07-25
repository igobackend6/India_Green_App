import os
from PIL import Image

Image.MAX_IMAGE_PIXELS = None

dir_path = r'assets\images\Ad_image'
# Get list of images
files = [f for f in os.listdir(dir_path) if f.lower().endswith(('.jpg', '.jpeg', '.png'))]

print('Compressing Ad images...')
for f in files:
    p = os.path.join(dir_path, f)
    try:
        img = Image.open(p)
        # Convert to RGB to avoid issues with some jpegs
        if img.mode != 'RGB':
            img = img.convert('RGB')
        
        # Resize to max 800 width, maintain aspect ratio
        img.thumbnail((800, 800))
        # Overwrite the original
        img.save(p, 'JPEG', optimize=True, quality=80)
        print(f"Compressed {f}")
    except Exception as e:
        print(f"Failed to compress {f}: {e}")

print('Done.')
