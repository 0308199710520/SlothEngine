#pragma once
#include "SlothEngine.h"

#ifdef SE_PLATFORM_WINDOWS

extern SE::Application* SE::CreateApplication();

int main(int argc, char** argv)
{
	SE::Log::Init();
	SE_CORE_WARN("Initialised Log for Core");
	SE_CORE_INFO("Initialised Log for Client");

	auto app = SE::CreateApplication();
	app->Run();
	delete app;
}

#else
	#error SlothEngine only supports windows!!!
#endif