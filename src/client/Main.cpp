#define GLEW_STATIC
#include <GL/glew.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>

int main( int argc, char* argv[] )
{
	// Initialize SDL
	SDL_Init(SDL_INIT_VIDEO);

	// Tell SDL we want our context to use OpenGL 3.2 Core
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 2);

	// Create our window
	SDL_Window* window;
	window = SDL_CreateWindow(
		"[Brick]: OpenGL Sandbox v0.001",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		640, 480, SDL_WINDOW_OPENGL);

	// Create our opengl context
	SDL_GLContext glContext = SDL_GL_CreateContext(window);

	// Init GLEW
	glewExperimental = GL_TRUE;
	glewInit();

	// Begin our "Game" Loop
	bool quit = false;
	while (!quit)
	{
		// Poll window events
		SDL_Event event;
		if (SDL_PollEvent(&event))
		{
			if (event.type == SDL_QUIT) quit = true;
		}

		// Swap our buffers
		SDL_GL_SwapWindow(window);
	}

	// Delete our OpenGL Context
	SDL_GL_DeleteContext(glContext);

	// Exit
	SDL_Quit();
	return 0;
}