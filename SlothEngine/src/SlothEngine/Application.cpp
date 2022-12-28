#include "Application.h"
#include "SlothEngine/Events/ApplicationEvent.h"
#include "SlothEngine/Log.h"

namespace SE
{
	Application::Application()
	{
		
	}
	Application::~Application()
	{
		
	}

	void Application::Run()
	{
		WindowResizeEvent event(1290, 720);
		if (event.IsInCategory(EventCategoryApplication))
		{
			SE_CORE_TRACE(event);
		}
		while (true);
	}
}
