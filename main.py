import pygame
import sys
from game_engine import slayer


def main():
    # Load
    pygame.init()
    screen_dims = (600, 600)
    screen = pygame.display.set_mode(screen_dims)
    clock = pygame.time.Clock()
    dt = 0
    player = slayer.Slayer(screen)
    running = True
    # Main loop
    while running:
        # Get events
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
                sys.exit()
        # Move player
        player.move_slayer(dt)
        # Handle player rotation
        rotated_rect, rotated_img = player.rotation_data()
        # Draw and update
        screen.fill("white")
        screen.blit(rotated_img, rotated_rect.topleft)
        dt = clock.tick(60) / 1000
        pygame.display.flip()


if __name__ == "__main__":
    main()
