workspace "SlothEngine"
	architecture "x64"
	startproject "Sandbox"
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "SlothEngine"
	location "SlothEngine"
	kind "SharedLib"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%(prj.name)")
	objdir ("bin-int/" .. outputdir .. "/%(prj.name)")
	
	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}
	
	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"
		defines
		{
			"SE_PLATFORM_WINDOWS",
			"SE_BUILD_DLL",
		}
		
		postbuildcommands
		{
			("{COPY} %(cfg.buildtarget.relpath)" .. outputdir .. "/Sandbox")
		
		}
	filter "configurations:Debug"
		defines "SE_DEBUG"
		symbols "On"
	
	filter "configurations:Release"
		defines "SE_RELEASE"
		optimize "On"
	
	filter "configurations:Dist"
		defines "SE_DIST"
		optimize "On"
	


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%(prj.name)")
	objdir ("bin-int/" .. outputdir .. "/%(prj.name)")
	
	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"SlothEngine/vendor/spdlog/include",
		"SlothEngine/src"
	}
	
	links
	{
		"SlothEngine"
	}
	
	filter "system:windows"
		cppdialect "C++20"
		staticruntime "On"
		systemversion "latest"
		defines
		{
			"SE_PLATFORM_WINDOWS"
		}
		
	filter "configurations:Debug"
		defines "SE_DEBUG"
		symbols "On"
	
	filter "configurations:Release"
		defines "SE_RELEASE"
		optimize "On"
	
	filter "configurations:Dist"
		defines "SE_DIST"
		optimize "On"
		