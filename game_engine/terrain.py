import pygame
import math


class GroundTiles:
    
    def __init__(self) -> None:
        # Tile container
        self.tile_array = []
        # Get file path
        self.img_path = "/media/landotech/Storage/GitHub/slaytheblobs/sprites/stone_wall_background_with_glow_purple.png"
        # Load original image
        self.unscaled_tile = pygame.image.load(self.img_path)
        # Set scaled dimensions
        self.tile_w = 100
        self.tile_h = 50
        # Scale tile
        self.tile = pygame.transform.smoothscale(
            self.unscaled_tile,
            (self.tile_w, self.tile_h)
            )

    def generate_tiles(self, screen: pygame.surface.Surface, x: int, y: int):
        screen_area = screen.get_width() * screen.get_height()
        tile_area = self.tile_w * self.tile_h 
        num_tiles = screen_area / tile_area
        for i in range(50):
            self.tile_array.append({i: self.tile, "x": x, "y": y})

        return self.tile_array

    def draw_tiles(self):
        