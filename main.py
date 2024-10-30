import pygame
import sys
from game_engine.slayer import Slayer
from game_engine.weapons import Arrow
from game_engine.terrain import GroundTiles


class EventHandler:

    def __init__(
        self, player: Slayer, arrow: Arrow, screen: pygame.surface.Surface
    ) -> None:
        # Initialize game objects
        self.player = player
        self.arrow = arrow
        self.screen = screen

    def handle_events(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self.quite_game()
            elif event.type == pygame.MOUSEBUTTONDOWN:
                if event.button == 1:
                    self.arrow.spawn_arrow(
                        player_x=self.player.x,
                        player_y=self.player.y,
                        player_angle=self.player.rotation_angle,
                    )

    def quite_game(self) -> True:
        pygame.quit()
        sys.exit()
        return True


def main():
    # Load
    pygame.init()

    # Get screen dimensions and set screen mode
    screen_dims = (600, 600)
    screen = pygame.display.set_mode(screen_dims)

    # Get delta time and game clock
    clock = pygame.time.Clock()
    dt = 0

    # Load game images
    player = Slayer(screen)
    arrow = Arrow()
    parent_tile = GroundTiles()

    # Initialize event handler
    event_handler = EventHandler(player=player, arrow=arrow, screen=screen)

    # Set boolean for mainloop
    running = True
    # Main loop
    while running:
        # Get events
        event_handler.handle_events()
        # Move player
        player.move_slayer(dt)
        # Draw and update
        screen.fill("white")
        # Draw tiles
        screen.blit(parent_tile.tile, (100, 100))
        # Handle player rotation
        rotated_rect, rotated_img = player.rotation_data()
        # Update arrows
        arrow.update_arrows(screen)
        # Draw player
        screen.blit(rotated_img, rotated_rect.topleft)
        # Tick the clock
        dt = clock.tick(60) / 1000
        # Flip display
        pygame.display.flip()


if __name__ == "__main__":
    main()
