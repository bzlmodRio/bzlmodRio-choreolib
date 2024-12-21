load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_choreolib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_headers",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-9/ChoreoLib-cpp-2025.0.0-beta-9-headers.zip",
        sha256 = "42152692b470576a7dd27b2c1d7f04a0b425ee859c46d08c89bbdf2a573e73de",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-9/ChoreoLib-cpp-2025.0.0-beta-9-windowsx86-64.zip",
        sha256 = "adc243c60cf591a3285f121979fe934b03daa4ea3ad999575365f8527354af28",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-9/ChoreoLib-cpp-2025.0.0-beta-9-linuxx86-64.zip",
        sha256 = "51f3dddfb905986c693abeb4cdd81e6f5fcd2f433c897dda79f72666d4389e8d",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-9/ChoreoLib-cpp-2025.0.0-beta-9-osxuniversal.zip",
        sha256 = "46dd8f60ac21bc015a6f32f544484ed9e7fa4a8667e8148b0ff4b5954960f156",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libChoreoLib.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libwpilibNewCommands.dylib @rpath/libwpilibNewCommands.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libChoreoLib.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libChoreoLib.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxathena",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-9/ChoreoLib-cpp-2025.0.0-beta-9-linuxathena.zip",
        sha256 = "6ae8bb6bdfc66e43d65af63e7248d9ecf0a12e2b73627aa3b36f87966bda04ff",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-9/ChoreoLib-cpp-2025.0.0-beta-9-linuxarm32.zip",
        sha256 = "5e6989b40efce17638dd2a58a9285cf61af597d4be4b0b31c1ce139328dd88a4",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-9/ChoreoLib-cpp-2025.0.0-beta-9-linuxarm64.zip",
        sha256 = "4fa070ff3eebf8dc0ceea425d544c0c310c0361eeb0976b9aa1143b784d1f754",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-9/Choreo-v2025.0.0-beta-9-Linux-x86_64-standalone.zip",
        sha256 = "4d47395acbde19778ce44acaf14c009d35aaca30e12aeb65837fb38f5628fc36",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-9/Choreo-v2025.0.0-beta-9-macOS-aarch64-standalone.zip",
        sha256 = "ef7da01a1857a0ae902f8acec45940967bd602323b30b1e41f06d247d66a0248",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-9/Choreo-v2025.0.0-beta-9-macOS-x86_64-standalone.zip",
        sha256 = "d875f5e37349c6d100e4be29597380fa4f24bc946de8d42b60c257c2002309ed",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-9/Choreo-v2025.0.0-beta-9-Windows-aarch64-standalone.zip",
        sha256 = "5d8aab7961c5cb96fd21367d6d603d108d85e3b23f7e0a6832cf4ca9ab5821c7",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-9/Choreo-v2025.0.0-beta-9-Windows-x86_64-standalone.zip",
        sha256 = "43664b1f41fe629cdd6cd09c47c55896b6ac6f78acc6e2555a97e96c55300e5a",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
