import pygame
import math


class Arrow:

    def __init__(self) -> None:
        # Container for arrows
        self.arrow_array = []
        # Img path
        self.arrow_img_path = "/media/landotech/Storage/GitHub/slaytheblobs/sprites/yellow_arrow_projectile.png"
        # Load image
        self.arrow = pygame.image.load(self.arrow_img_path)
        # Scale image
        self.scaled_arrow = pygame.transform.smoothscale(self.arrow, (50, 20))
        # Attributes
        self.speed = 7

    def shoot_arrow(self, 
                    x: int,
                    y: int,
                    direction: float,
                    speed: int):
        rotated_arrow = pygame.transform.rotate(self.scaled_arrow, direction)
        self.arrow_array.append(
            {
                "position": (x, y),
                "direction": direction,
                "speed": speed,
                "image": rotated_arrow,
            }
        )

    def update_arrows(self, screen: pygame.surface.Surface):
        # Iterate through arrow array and calculate new position
        for arrow in self.arrow_array:
            x, y = arrow["position"]
            direction = arrow["direction"] * -(math.pi / 180)
            dx = math.cos(direction) * arrow["speed"]
            dy = math.sin(direction) * arrow["speed"]
            arrow["position"] = (x + dx, y + dy)
            screen.blit(arrow["image"], arrow["position"])

    def spawn_arrow(self, player_x: int, player_y: int, player_angle: float):
        x, y = player_x, player_y
        direction = player_angle
        speed = self.speed

        self.shoot_arrow(x, y, direction, speed)


class Bow:

    def __init__(self) -> None:
        pass


class Axe:

    def __init__(self) -> None:
        pass


class Sword:

    def __init__(self) -> None:
        pass


class Spear:

    def __init__(self) -> None:
        pass


class ThrowingStar:

    def __init__(self) -> None:
        pass
