# AI CODING RULES FOR FARGONE-AI-CLONE

This is the "ground truth" for this project. You MUST follow these rules for every single task.

## 1. The Golden Rule: MACROS FIRST
This project uses `scr_macros.gml` for almost everything.
* **NEVER** use a "magic number" (like `0`, `1`, `2`, `3` for directions).
* **NEVER** use an object name (like `obj_SASFS`).
* **NEVER** use a `keyboard_check` function directly (like `keyboard_check(ord("W"))`).
* **ALWAYS** use the macro from `@scr_macros.gml` instead.

| Instead of This... | ALWAYS Use This... |
| :--- | :--- |
| `obj_SASFS` | `PLAYER` |
| `obj_SASFS.hp` | `PLAYERHP` |
| `facing = 0` | `facing = RIGHT` |
| `keyboard_check(ord("W"))` | `PLAYER_UP` |
| `keyboard_check_pressed(ord("E"))` | `PLAYER_INTERACT` |
| `obj_textbox` | `TEXTBOX` |

## 2. GameMaker Manual
Before writing **any** GML code, you **must** check the official GameMaker Manual located in the `@gml-manual` folder to find the correct, most modern GML function.
* Do not invent a function if a built-in one exists (e.g., use `array_push` or `lerp` instead of writing your own).
* Verify all function arguments and syntax.

## 3. Project Structure & Naming
* **Objects (`obj_`):** All game objects.
* **Scripts (`scr_`):** All global functions and scripts.
* **Sprites (`spr_`):** All sprites.
* **Rooms (`rm_`):** All rooms.
* **Variables:** Use `snake_case` (e.g., `move_spd`, `hp_max`). (Temporary variables use _snake_case)
* **Functions:** Use `snake_case` (e.g., `scr_text()`, `create_textbox()`).
* **Macros:** Use `UPPER_SNAKE_CASE` (e.g., `PLAYER_HP`).

## 4. Actor / Object Rules
* **Initialization:** All instance variables (`hp`, `xspd`, `move_spd`, etc.) **must** be initialized in the **Create Event**[cite: 2, 4].
* **Step Event Logic:** The Step Event for actors like `PLAYER` must follow this order:
    1.  [cite_start]**Input:** Check for input using macros (`PLAYER_UP`, `PLAYER_SPRINT`)[cite: 7].
    2.  [cite_start]**State Calculation:** Calculate `xspd` and `yspd` based on input[cite: 7, 8].
    3.  **Collisions:** Check for collisions with `place_meeting` *before* moving. [cite_start]If a collision is found, set the speed variable (`xspd` or `yspd`) to 0[cite: 10].
    4.  [cite_start]**Movement:** Apply movement *after* collision checks (`x += xspd; y += yspd;`)[cite: 12].
    5.  [cite_start]**Animation/Sprites:** Update `facing` and `sprite_index` at the end[cite: 10, 12].
* [cite_start]**Directional Sprites:** Actors often use an array for directional sprites (e.g., `sprite[RIGHT] = spr_SASFS_right`)[cite: 3]. Use this pattern.
* **Local Variables:** **ALWAYS** use `var` for temporary variables in scripts or events. Do not create new, unneeded instance variables.

## 5. Textbox & Dialogue System
* **DO NOT** draw text to the screen manually.
* To show text, you **must** use the `create_textbox("text_id")` function[cite: 46].
* This function handles language settings (`LANG`) and finds the correct text.
* **Adding Speakers:** New character dialogue settings (sprite, sound, text box color) must be added as a `case` in the `switch(argument[1])` block inside the `scr_text` function [cite: 28-39].
* [cite_start]**Text Effects:** To color, shake, or float text, use the built-in functions like `scr_text_color` [cite: 40] [cite_start]and `scr_playercolor`[cite: 42]. Do not invent new systems.