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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.3/ChoreoLib-cpp-2025.0.3-headers.zip",
        sha256 = "2f2e67b361445d352fcdeb6a0b273c6df45d76f2c174a5d8f3ec92bdf1ae7de6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.3/ChoreoLib-cpp-2025.0.3-windowsx86-64.zip",
        sha256 = "5c59b8f673c3d54ffbf07ee4b9047483f05a10ba2e8d77a6c0db7dd3b2774a2f",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.3/ChoreoLib-cpp-2025.0.3-linuxx86-64.zip",
        sha256 = "4329629d4f537ba7a3307aeb19f63b0dcb711f0b9e814b0afcc3722dd48e792f",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.3/ChoreoLib-cpp-2025.0.3-osxuniversal.zip",
        sha256 = "64edf7ec2640907fd07fe1c06f92b6037f6d283842d1a4e10684a8d71da9d603",
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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.3/ChoreoLib-cpp-2025.0.3-linuxathena.zip",
        sha256 = "25f4669aa68ba00f97a2d2a3be24c05488e52bb30ed75f7f5bb80540472fb09c",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.3/ChoreoLib-cpp-2025.0.3-linuxarm32.zip",
        sha256 = "2bbdfdabc8636116b17693196ddf6dc73253d90ee544c1e132dfacd7c848f433",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.3/ChoreoLib-cpp-2025.0.3-linuxarm64.zip",
        sha256 = "bf4a9a21de547127a639875961ef41f3f9fc8ee13379895c1313d5f2440195a2",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.3/Choreo-v2025.0.3-Linux-x86_64-standalone.zip",
        sha256 = "b01ede9f9b0f1097c34412fc0982c22de4d7629e3a9f72baa971b8c3fc356992",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.3/Choreo-v2025.0.3-macOS-aarch64-standalone.zip",
        sha256 = "fdfe116d802a71bac78dbfa4c679629b37dc3d8064245d8ab20a8f9e061f7107",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.3/Choreo-v2025.0.3-macOS-x86_64-standalone.zip",
        sha256 = "34836344cded7e22226c1be2d4579a4d89de038466c88be1c8f366f9b1dca0f6",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.3/Choreo-v2025.0.3-Windows-aarch64-standalone.zip",
        sha256 = "1edbb340b8eb8ae0f9b70acc9baaa4e796e96c859a51fc4cf890263f62335a74",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.3/Choreo-v2025.0.3-Windows-x86_64-standalone.zip",
        sha256 = "4ec5e4c0f2d163a042f1e392cf0c15cdcff80bab2ac0afe21923604ac9ded39b",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
