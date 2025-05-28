#include "raylib.h"

void rbt() {
 mazegen_rbt();
 mazesolve_rbt();
}
void anim() {
static void mazesolve_anim();
static void mazegen_anim();
}

static void checktemplate();

void rbt()  { } // mazesolve_rbt & mazegen_rbt  defined here due to same recursive backtracking logic
void mazegen_rbt() { } // create maze generation logic
void mazesolve_rbt() { } // create maze solving logic
//
void anim() { } // rendering to raylib for generator and solver 
static void mazegen_anim() { } // animate maze generation
static void mazesolve_anim() { } // animate maze solving

// DS-struct.h

struct cell {
  bool visited = false;
  int wall[4];
}
  cell Maze[cols][rows];

int main() {
  const int screenh = 1200;
  const int screenw = 700;
  SetTargetFPS(60);
  InitWindow(screenh, screenw, "Mazzy-C");
  while(!WindowShouldClose()) { checktemplate(); } // main loop
  return 0;
}

static void checktemplate(void) {

  BeginDrawing();
  ClearBackground(BLACK);
  DrawText("Mazzy-C", 10, 10, 40, GREEN);
  EndDrawing();

}
