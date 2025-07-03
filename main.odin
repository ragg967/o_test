package main

import "core:fmt"
import rl "vendor:raylib"

SCREEN_HEIGHT: i32 = 600
SCREEN_WIDTH: i32 = 800

game_over := false
pause := false

player: rl.Texture2D
player_x: i32 = 10
player_y: i32 = 10


main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Test")
	defer rl.CloseWindow()

	player = rl.LoadTexture("assets/sprites/funky_guy.png")
	defer rl.UnloadTexture(player)

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.ClearBackground(rl.ORANGE)
		rl.BeginDrawing()

		rl.DrawTexture(player, player_x, player_y, rl.WHITE)
		rl.DrawText("Hello, Test!", SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2, 20, rl.WHITE)

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

		rl.EndDrawing()
	}
}
