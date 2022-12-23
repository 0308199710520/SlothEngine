#pragma once
#include "SlothEngine.h"

#ifdef SE_PLATFORM_WINDOWS

extern SE::Application* SE::CreateApplication();

int main(int argc, char** argv)
{
	printf("Sloth Engine");
	auto app = SE::CreateApplication();
	app->Run();
	delete app;
}

#else
	#error SlothEngine only supports windows!!!
#endif