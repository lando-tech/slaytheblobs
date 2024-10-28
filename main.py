import pygame
import sys
from game_engine import slayer


def main():
    pygame.init()
    screen = pygame.display.set_mode((600, 600))
    clock = pygame.time.Clock()
    running = True
    player = slayer.Slayer(screen)
    dt = 0

    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
                sys.exit()
        
        screen.fill("white")
        screen.blit(player.load_slayer(), (player.x, player.y))
        player.move_slayer(dt)
        dt = clock.tick(60) / 1000 
        pygame.display.flip() 
       
       
if __name__ == "__main__":
    main()