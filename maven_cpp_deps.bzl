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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-8/ChoreoLib-cpp-2025.0.0-beta-8-headers.zip",
        sha256 = "142024485ea5066e109df1e0cc1c8693f2e3599d7cfb5d6e0813886a3a346ec6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-8/ChoreoLib-cpp-2025.0.0-beta-8-windowsx86-64.zip",
        sha256 = "21506d3de041c3ab2c84b76fd7e556a7545a1f38e0d51864fbb7c254c67ba6ef",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-8/ChoreoLib-cpp-2025.0.0-beta-8-linuxx86-64.zip",
        sha256 = "fe5b054811384affe30f0984b79972720d6cd9440fc825f19331ba599070eb52",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-8/ChoreoLib-cpp-2025.0.0-beta-8-osxuniversal.zip",
        sha256 = "c07b1ca170eb4c4eae303f1af0d4ddd33bc65e99f4d0838ef24cbe778af9395b",
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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-8/ChoreoLib-cpp-2025.0.0-beta-8-linuxathena.zip",
        sha256 = "b798923769bc7f0373b227accfc6b47fe1848c854c918d9773042dea11111b67",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-8/ChoreoLib-cpp-2025.0.0-beta-8-linuxarm32.zip",
        sha256 = "bae428fd8e931874ae2b371917fa80a16d432fec2712107f25ddc259d69a8a7e",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-8/ChoreoLib-cpp-2025.0.0-beta-8-linuxarm64.zip",
        sha256 = "70dfd8a4924d96dc4ccdf695269a12edd4c74ab366355aebe3f17445f85dc1ce",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-8/Choreo-v2025.0.0-beta-8-Linux-x86_64-standalone.zip",
        sha256 = "f34dbb0273019280947e41e220fb6af6279a0ac1e5a3308b5911259c8c660cc5",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-8/Choreo-v2025.0.0-beta-8-macOS-aarch64-standalone.zip",
        sha256 = "0ab46c2ce1c0c1b9bb4b4cbe57ab1c2e9cb5ee06bf345d53cfcbb6a28c02a79f",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-8/Choreo-v2025.0.0-beta-8-macOS-x86_64-standalone.zip",
        sha256 = "d053b2edaf2eb0e1d616fbf24555b83dd8eaec756bf233bef538ae856d2cbbea",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-8/Choreo-v2025.0.0-beta-8-Windows-aarch64-standalone.zip",
        sha256 = "385cfc7dff87657fe902a8ca06706383767e06cc6279c84332814e23aaa5082d",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-8/Choreo-v2025.0.0-beta-8-Windows-x86_64-standalone.zip",
        sha256 = "b9b530590d1c3d6400a02547efec85bf5ca383c756af71224b70bd338c2a0a9c",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
