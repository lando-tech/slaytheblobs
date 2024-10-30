"""Load pygame module"""

import pygame
import math


class Slayer(pygame.sprite.Sprite):

    def __init__(self, screen: pygame.surface.Surface):
        super().__init__()
        # Player Attributes
        self.health = 100
        self.speed = 300
        self.strength = 10

        # Player surface info
        self.image_path = (
            "/media/landotech/Storage/GitHub/slaytheblobs/sprites/player.png"
        )
        self.image = pygame.image.load(self.image_path)
        self.player_rect = self.image.get_rect()

        # Player geometry
        self.x = 0
        self.y = 0
        self.rotation_angle = 0

        # Parent Surface
        self.screen = screen
        self.screen_w, self.screen_h = screen.get_width(), screen.get_height()

    def move_slayer(self, dt):
        # Get key press for basic movement
        keys = pygame.key.get_pressed()
        if keys[pygame.K_w]:
            self.y -= self.speed * dt
        if keys[pygame.K_s]:
            self.y += self.speed * dt
        if keys[pygame.K_a]:
            self.x -= self.speed * dt
        if keys[pygame.K_d]:
            self.x += self.speed * dt

    def rotation_data(self):
        self.player_rect.center = (self.screen_w // 2, self.screen_h // 2)
        # Get mouse x and y
        mouse_x, mouse_y = pygame.mouse.get_pos()
        # Get player x and y relative to the mouse
        rel_x, rel_y = (
            mouse_x - self.x,
            mouse_y - self.y,
        )
        # Get player angle
        angle = -(180 / math.pi) * math.atan2(rel_y, rel_x)
        self.rotation_angle = angle
        # Rotate image and rect
        rotated_image = pygame.transform.rotate(self.image, self.rotation_angle)
        rotated_rect = rotated_image.get_rect(center=(self.x, self.y))
        return rotated_rect, rotated_image

    def shoot_arrow(self):
        pass

    def swing_weapon(self):
        pass

    def change_weapon(self):
        pass
