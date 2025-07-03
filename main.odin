package main

// imports
import "core:text/edit"
import rl "vendor:raylib"

// screen constants
SCREEN_HEIGHT: i32 = 600
SCREEN_WIDTH: i32 = 800

// game variables
game_over := false
pause := false

// player variables (12 - 15)
player: rl.Texture2D
player_x: i32 = 10
player_y: i32 = 10

// main function
main :: proc() {
	// initialization for the window
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Test")
	defer rl.CloseWindow()

	// player texter
	player = rl.LoadTexture("assets/sprites/funky_guy.png")
	defer rl.UnloadTexture(player)

	// fps target
	rl.SetTargetFPS(60)

	// main game loop
	for !rl.WindowShouldClose() {
		// window background
		rl.ClearBackground(rl.ORANGE)
		// begin to draw the current frame
		rl.BeginDrawing()

		// player draw
		rl.DrawTexture(player, player_x, player_y, rl.WHITE)
		// text draw
		rl.DrawText("Hello, Test!", SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2, 20, rl.WHITE)

		// around text for interaction with player
		rl.DrawEllipseLines(SCREEN_WIDTH / 2 + 10, SCREEN_HEIGHT / 2 + 10, 70, 30, rl.WHITE)

		// player movement (line 39 - 63)
		switch {
		case rl.IsKeyDown(rl.KeyboardKey.S):
			player_y += 5
		case rl.IsKeyDown(rl.KeyboardKey.DOWN):
			player_y += 5
		}
		switch {
		case rl.IsKeyDown(rl.KeyboardKey.W):
			player_y -= 5
		case rl.IsKeyDown(rl.KeyboardKey.UP):
			player_y -= 5
		}
		switch {
		case rl.IsKeyDown(rl.KeyboardKey.A):
			player_x -= 5
		case rl.IsKeyDown(rl.KeyboardKey.LEFT):
			player_x -= 5
		}
		switch {
		case rl.IsKeyDown(rl.KeyboardKey.D):
			player_x += 5
		case rl.IsKeyDown(rl.KeyboardKey.RIGHT):
			player_x += 5
		}

		// end the current frame
		rl.EndDrawing()
	}
}
