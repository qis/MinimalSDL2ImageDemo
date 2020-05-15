#include <SDL.h>
#include <SDL_image.h>

#include <stdio.h>

int main(int argc, char* args[])
{
	if (SDL_Init(SDL_INIT_VIDEO) > 0) {
		printf("SDL init failed.");
		return 1;
	}
	if (IMG_Init(IMG_INIT_PNG) != IMG_INIT_PNG) {
		printf("SDL image failed to initialize PNG subsystem.");
		return 1;
	}

    SDL_Window* gWindow = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_SHOWN);
    SDL_Renderer* gRenderer = SDL_CreateRenderer(gWindow, -1, SDL_RENDERER_ACCELERATED);
    
    SDL_Surface* loadedSurface = IMG_Load("data/img.png");

    SDL_Texture* newTexture = SDL_CreateTextureFromSurface(gRenderer, loadedSurface);
        
    SDL_FreeSurface(loadedSurface);

    SDL_RenderClear(gRenderer);
    SDL_RenderCopy(gRenderer, newTexture, NULL, NULL);
    SDL_RenderPresent(gRenderer);

    SDL_Delay(2000);
    return 0;
}