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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0-beta-1/ChoreoLib-cpp-2026.0.0-beta-1-headers.zip",
        sha256 = "7fe10e31c59f1f667f417583b5df0e167a43f452c0fc2ed33d983632aed8f737",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0-beta-1/ChoreoLib-cpp-2026.0.0-beta-1-windowsx86-64.zip",
        sha256 = "1ce1ab8d9f35195dc27752724770ab3630e39d2132bd9a9b5ac56b12cc3b5a79",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0-beta-1/ChoreoLib-cpp-2026.0.0-beta-1-linuxx86-64.zip",
        sha256 = "a106c0dd5366c7600be71045f0b15da69ddaf67d39d6c0d527bc55f6b82f688b",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0-beta-1/ChoreoLib-cpp-2026.0.0-beta-1-osxuniversal.zip",
        sha256 = "f56a81c01748e3c1742664e268bf6488e0a277a91230d10f877f8e2d25c23c6f",
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
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0-beta-1/Choreo-v2026.0.0-beta-1-Linux-x86_64-standalone.zip",
        sha256 = "3569f0343eb75329efb20d949320118c2ae121212adb37191aac3d76605ac0c9",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0-beta-1/Choreo-v2026.0.0-beta-1-macOS-aarch64-standalone.zip",
        sha256 = "31401e2534f033c9c44a4324ffb15cee3a1bae2e1b33927dbc31a4fdd2f0984e",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0-beta-1/Choreo-v2026.0.0-beta-1-macOS-x86_64-standalone.zip",
        sha256 = "ea7d968f3805db503212a6cdfd904521ff56356d8d82352744f2dcb956c7e7d1",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0-beta-1/Choreo-v2026.0.0-beta-1-Windows-aarch64-standalone.zip",
        sha256 = "3d9393a9af4cef09bbc8eedd44bc3858e772245427ca2e6d07ba980f41b4f8ce",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0-beta-1/Choreo-v2026.0.0-beta-1-Windows-x86_64-standalone.zip",
        sha256 = "709f7d8725bea357a52fca0d80cfc4e463200a4c04bcd62ec9b8ab5b8df24e84",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
