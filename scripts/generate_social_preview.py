from pathlib import Path

from PIL import Image, ImageOps


def create_social_preview(
    cover_path: Path,
    output_path: Path,
    target_width: int = 1280,
    target_height: int = 640,
) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)

    cover = Image.open(cover_path).convert("RGBA")

    canvas = Image.new("RGBA", (target_width, target_height), (10, 14, 24, 255))

    available_width = int(target_width * 0.6)
    available_height = int(target_height * 0.9)

    scale = min(available_width / cover.width, available_height / cover.height)
    new_size = (max(1, int(cover.width * scale)), max(1, int(cover.height * scale)))
    cover_resized = cover.resize(new_size, Image.LANCZOS)

    shadow = Image.new("RGBA", (new_size[0] + 24, new_size[1] + 24), (0, 0, 0, 0))
    shadow_box = Image.new("RGBA", (new_size[0] + 8, new_size[1] + 8), (0, 0, 0, 80))
    shadow.paste(shadow_box, (8, 8))

    cover_x = (target_width - new_size[0]) // 2
    cover_y = (target_height - new_size[1]) // 2

    canvas.alpha_composite(shadow, (cover_x - 12, cover_y - 12))
    canvas.alpha_composite(cover_resized, (cover_x, cover_y))

    final = ImageOps.exif_transpose(canvas).convert("RGB")
    final.save(output_path, format="PNG", optimize=True)


if __name__ == "__main__":
    repo_root = Path(__file__).resolve().parents[1]
    cover = repo_root / "images" / "DeepLearning101-cover.png"
    out = repo_root / "images" / "github-social-media-preview.png"
    create_social_preview(cover, out)


