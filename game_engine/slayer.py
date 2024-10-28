"""Load pygame module"""
import pygame


class Slayer:
    
    def __init__(self, screen):
        # Player Attributes
        self.health = 100
        self.speed = 300
        self.strength = 10

        # Path to player image file
        self.image_path = "C:\\Users\\aaron\GitHub\\slaytheblobs\\sprites\\player.png"

        # Player geometry
        self.x = 0
        self.y = 0
        self.rotation_angle = 0
        
        # Parent Surface
        self.screen = screen
        
    def load_slayer(self):
        # Load player image
        image = pygame.image.load(self.image_path)
        return image
    
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
    
    def rotate_slayer(self):
        pass 
     
    def shoot_arrow(self):
        pass 
    
    def swing_weapon(self):
        pass 
    
    def change_weapon(self):
        pass