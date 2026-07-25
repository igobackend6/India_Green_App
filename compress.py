import os
from PIL import Image

Image.MAX_IMAGE_PIXELS = None

dir_path = 'assets/images/IGO Universe Brands'
# Get list of images
files = [f for f in os.listdir(dir_path) if f.endswith('.jpg')]

print('Compressing images...')
for f in files:
    p = os.path.join(dir_path, f)
    try:
        img = Image.open(p)
        # Convert to RGB to avoid issues with some jpegs
        if img.mode != 'RGB':
            img = img.convert('RGB')
        
        # Resize to max 300x300, maintain aspect ratio
        img.thumbnail((300, 300))
        # Overwrite the original
        img.save(p, optimize=True, quality=75)
        print(f"Compressed {f}")
    except Exception as e:
        print(f"Failed to compress {f}: {e}")

print('Done.')
