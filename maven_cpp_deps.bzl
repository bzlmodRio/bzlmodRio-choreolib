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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-6/ChoreoLib-cpp-2025.0.0-beta-6-headers.zip",
        sha256 = "4de9d2096a1705caae3a382dbcd7baa3bc063134f6c13a915c4f041faf5d7355",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-6/ChoreoLib-cpp-2025.0.0-beta-6-windowsx86-64.zip",
        sha256 = "b9ad696081fa55dc4ec131e935257675a67809daf00ee4ee616202d6a3f2ec24",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-6/ChoreoLib-cpp-2025.0.0-beta-6-linuxx86-64.zip",
        sha256 = "91509454ceadeca341d0c454f8efec5bf0e9a36e5c5620285ed33016184fb96f",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-6/ChoreoLib-cpp-2025.0.0-beta-6-osxuniversal.zip",
        sha256 = "76ab069f55ab5994376a10c96ef410499b538498b8698fc51be17fc2e3f83239",
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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-6/ChoreoLib-cpp-2025.0.0-beta-6-linuxathena.zip",
        sha256 = "b0b4a40feef38ff8616f27356cc474a65065f9752c8a9b4dc82b2801bf77a6b2",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-6/ChoreoLib-cpp-2025.0.0-beta-6-linuxarm32.zip",
        sha256 = "0b807d3b5d886fbc8da7248556c79f1c40785a7a2efc3cea3ce188a13bdcaa9c",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-6/ChoreoLib-cpp-2025.0.0-beta-6-linuxarm64.zip",
        sha256 = "f50598e35ea2a446fd1a5b42e7ca5d1c10fa6116561b7ca285854de083d93193",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-6/Choreo-v2025.0.0-beta-6-Linux-x86_64-standalone.zip",
        sha256 = "565b61237fa84cf489d26a4eef2ea80b0be1efa5fa83003432ce68ca0315c29a",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-6/Choreo-v2025.0.0-beta-6-macOS-aarch64-standalone.zip",
        sha256 = "066873c536f7df735ffcce8ac3cf314bf0e46d825c96c7dfb6d4033a32338ffa",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-6/Choreo-v2025.0.0-beta-6-macOS-x86_64-standalone.zip",
        sha256 = "35ae79ff56701f740b6107ee3b1203edc82f3024555ae5d8500a16241ad54e43",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-6/Choreo-v2025.0.0-beta-6-Windows-aarch64-standalone.zip",
        sha256 = "b9855f7c7c0495b69908fcd2a5a42362b55d53c9e2629613b65e596c9baf1a34",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-6/Choreo-v2025.0.0-beta-6-Windows-x86_64-standalone.zip",
        sha256 = "96721256632a62be8220f0bc2330e90c2635b5c2a0c5d3e65473d37f0765b0ad",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
