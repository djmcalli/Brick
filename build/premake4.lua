function getAbsoluteFromSolution(p)
	local sol = solution()
	return path.getabsolute(path.join(sol.basedir, p))
end

solution "Brick"
	configurations { "Debug", "Release" }
	platforms { "x32", "x64" }
	flags { "Symbols", "Unicode" }
	location "projects"

	project "Client"
		kind "ConsoleApp"
		language "C++"
		location "projects"
		local stargetdir = targetdir "../bin"
		files { "../src/**" }
		includedirs { "../src" }

		-- DEPENDENCIES
		files { "../depend/**" }
		includedirs { "../depend/headers" } 
		configuration "x32"
			libdirs { "../depend/libs-msvc/x86" }
		configuration "x64"
			libdirs { "../depend/libs-msvc/x64" }

		-- LINKS
		configuration { "windows or linux or osx"}
			links { "SDL2", "SDL2main", "jpeg", "glew" }

		-- Enable C++11 on Linux
		configuration { "linux or bsd or solaris" }
			buildoptions { "-std=c++11" }

		-- Per-platform libraries.
		configuration "windows"
			links { "ws2_32", "opengl32" }