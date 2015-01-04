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
		local stargetdir = targetdir "../bin/client"
		files { "../src/client/**" }
		includedirs { "../src/client" }

		-- DEPENDENCIES
		files { "../depend/both/**", "../depend/client/**" }
		includedirs { "../depend/both/headers", "../depend/client/headers" }
		configuration "x32"
			libdirs { "../depend/both/libs-msvc/x86", "../depend/client/libs-msvc/x86" }
		configuration "x64"
			libdirs { "../depend/both/libs-msvc/x64", "../depend/client/libs-msvc/x64" }

		-- LINKS
		configuration { "windows or linux or osx"}
			links { "SDL2", "SDL2main", "jpeg", "glew" }

		-- Enable C++11 on Linux
		configuration { "linux or bsd or solaris" }
			buildoptions { "-std=c++11" }

		-- Per-platform libraries.
		configuration "windows"
			links { "ws2_32", "opengl32" }

	project "Server"
		kind "ConsoleApp"
		language "C++"
		location "projects"
		local stargetdir = targetdir "../bin/server"
		files { "../src/server/**" }
		includedirs { "../src/server" }

		-- DEPENDENCIES
		files { "../depend/both/**", "../depend/server/**" }
		includedirs { "../depend/both/headers", "../depend/server/headers" }
		configuration "x32"
			libdirs { "../depend/both/libs-msvc/x86", "../depend/server/libs-msvc/x86" }
		configuration "x64"
			libdirs { "../depend/both/libs-msvc/x64", "../depend/server/libs-msvc/x64" }

		-- LINKS
		configuration { "windows or linux or osx"}
			links { "SDL2", "SDL2main", "SDL2_net" }

		-- Enable C++11 on Linux
		configuration { "linux or bsd or solaris" }
			buildoptions { "-std=c++11" }

		-- Per-platform libraries.
			-- lol there are none; thank God for cross-plat server code.
