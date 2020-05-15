#include <SDL.h>
#include <SDL_image.h>
#include <cstdio>
#include <cstdlib>

int main(int argc, char* args[]) {
  if (SDL_Init(SDL_INIT_VIDEO) > 0) {
    printf("SDL init failed.");
    return EXIT_FAILURE;
  }
  if (IMG_Init(IMG_INIT_PNG) != IMG_INIT_PNG) {
    printf("SDL image failed to initialize PNG subsystem.");
    return EXIT_FAILURE;
  }

  auto window = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_SHOWN);
  auto renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

  auto loaded_surface = IMG_Load("data/img.png");
  auto texture = SDL_CreateTextureFromSurface(renderer, loaded_surface);
  SDL_FreeSurface(loaded_surface);

  SDL_RenderClear(renderer);
  SDL_RenderCopy(renderer, texture, nullptr, nullptr);
  SDL_RenderPresent(renderer);

  SDL_Delay(2000);

  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);

  return EXIT_SUCCESS;
}
