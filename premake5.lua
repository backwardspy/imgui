target_triple = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "imgui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/"..target_triple.."/%{prj.name}")
    objdir ("bin/obj/"..target_triple.."/%{prj.name}")

    files {
        "src/**.cpp",
        "include/**.h",
    }

    includedirs "include"

    filter "configurations:debug"
        defines "DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "NDEBUG"
        optimize "On"
