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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0/ChoreoLib-cpp-2025.0.0-headers.zip",
        sha256 = "6c1e4e222f5cf0170098e32312d9112232c341d8d166082d663566e850ca6505",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0/ChoreoLib-cpp-2025.0.0-windowsx86-64.zip",
        sha256 = "267abea33f52d07c89d0a92bbf94d009ded1a485dcde44c9ae9a6a1055033cd4",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0/ChoreoLib-cpp-2025.0.0-linuxx86-64.zip",
        sha256 = "90519590e4824f98f97d8bb6860fe7c51dbdce911484a31af075411d05f7d263",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0/ChoreoLib-cpp-2025.0.0-osxuniversal.zip",
        sha256 = "fc3f6ddb94f8c4ec32a8524d14f7015003db77350b88ccc57e4b6810226eeaf6",
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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0/ChoreoLib-cpp-2025.0.0-linuxathena.zip",
        sha256 = "92b1c72848379853808a97c73793bb45078cc99abfbcece067f72338b53f3b9c",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0/ChoreoLib-cpp-2025.0.0-linuxarm32.zip",
        sha256 = "023977b80c36e3c9591ee9f174e4b7df7e877bc39d98ea51ef7eee84a55bb3f2",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0/ChoreoLib-cpp-2025.0.0-linuxarm64.zip",
        sha256 = "feb23ad1ed8494247603ec5df2529ba3257eb5c0c80684941971ed14903dea74",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0/Choreo-v2025.0.0-Linux-x86_64-standalone.zip",
        sha256 = "8972cc4021cf6e26e4bc17ea30e1d2536292d85867d4cb9809b6bde0dda3bfab",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0/Choreo-v2025.0.0-macOS-aarch64-standalone.zip",
        sha256 = "c8d09d1135f457c66d4bae73e5fc3775718d97509b354da4aed87741f1dcf4e6",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0/Choreo-v2025.0.0-macOS-x86_64-standalone.zip",
        sha256 = "307ce6fa14d640c9dc478d99dac0e70c893f841938ec4af052da445a09dfa0ca",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0/Choreo-v2025.0.0-Windows-aarch64-standalone.zip",
        sha256 = "161fa24db07bcfac804456d8e8d1548ffa8d6e6cedfaa8b9b3e0c0003c3d1815",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0/Choreo-v2025.0.0-Windows-x86_64-standalone.zip",
        sha256 = "23c32a6b29bf206909ae62b8e6fe45ced639966cd83b1d94e966ac2c42ebbe6f",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
