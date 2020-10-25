target_triple = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "imgui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/"..target_triple.."/%{prj.name}")
    objdir ("bin/obj/"..target_triple.."/%{prj.name}")

    files {
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_widgets.cpp",
        "imgui_demo.cpp",
        "backends/imgui_impl_opengl3.cpp",
    }

    includedirs {
        ".",
        "%{wks.location}/leviathan/vendor/glad/include"
    }

    filter "configurations:debug"
        defines "DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "NDEBUG"
        optimize "On"
