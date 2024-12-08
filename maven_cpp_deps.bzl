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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-7/ChoreoLib-cpp-2025.0.0-beta-7-headers.zip",
        sha256 = "86a6cf785341f20520f7a8ab6c40a9cfd827c689cf30da17e36f85b15e893509",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-7/ChoreoLib-cpp-2025.0.0-beta-7-windowsx86-64.zip",
        sha256 = "fe758708eb66d373f08f67bde87f31fe3a021b7e54c078d3c850def4c6b906ee",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-7/ChoreoLib-cpp-2025.0.0-beta-7-linuxx86-64.zip",
        sha256 = "a6f50fc82766041ae23d1a057dbc15296ef4f3294b823af3e11be1b331f26691",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-7/ChoreoLib-cpp-2025.0.0-beta-7-osxuniversal.zip",
        sha256 = "44870ed64d05d4edd334928732c8cfd07e4a7dec1415978e84bc082c1e82c727",
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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-7/ChoreoLib-cpp-2025.0.0-beta-7-linuxathena.zip",
        sha256 = "1d54a563925b4d5bd80ac5d67087dbf4281da35f9f1b8f62a30359b128b7d015",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-7/Choreo-v2025.0.0-beta-7-Linux-x86_64-standalone.zip",
        sha256 = "8816752ade309c36c00aec7d3795b4ae4cc570029ecbd1a176a25a22e1495248",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-7/Choreo-v2025.0.0-beta-7-macOS-aarch64-standalone.zip",
        sha256 = "79006b3d4ec5a8b63ac2265eeb3e1d0e433a9a9a58ea9c6cc3a8414b6ec6d288",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-7/Choreo-v2025.0.0-beta-7-macOS-x86_64-standalone.zip",
        sha256 = "beecb2a2c9cf1c98f009e649fbdde59c2b3dbbdb3f556cb360206e2f889ff6fa",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-7/Choreo-v2025.0.0-beta-7-Windows-aarch64-standalone.zip",
        sha256 = "867edc723b54c393affcfd765e5de25c48b91bfe959b2cebc56e314b0a225863",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-7/Choreo-v2025.0.0-beta-7-Windows-x86_64-standalone.zip",
        sha256 = "6a7b94d6479d2bc4914d3919348bde743a8ae96496a8d18872d1e75378381472",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
