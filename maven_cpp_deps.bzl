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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.2/ChoreoLib-cpp-2026.0.2-headers.zip",
        sha256 = "748411d1f482b9dde02685d0edfba7e0f8796777de5817d72d3d92a522c4ddbb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.2/ChoreoLib-cpp-2026.0.2-windowsx86-64.zip",
        sha256 = "a13d37c6a8042e5dcf2068634953d2c80e8024040083c1b02a80fc485e17bda6",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.2/ChoreoLib-cpp-2026.0.2-linuxx86-64.zip",
        sha256 = "840f85502a569e772c28bff5885ac4eeadbd4cbb8fdfab2dbe9ad88191727519",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.2/ChoreoLib-cpp-2026.0.2-osxuniversal.zip",
        sha256 = "43257f431693a933706b27a1b60c20da3abe7500fcd394323dac3c23a55a28f3",
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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.2/ChoreoLib-cpp-2026.0.2-linuxathena.zip",
        sha256 = "4b97d568c2a118091c66f3f7a6f9a07342be5c16749be2f0685381b99952cde5",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.2/ChoreoLib-cpp-2026.0.2-linuxarm32.zip",
        sha256 = "037d2b2af55210d2e777a237a4ed81bb1f6828570bbfa6e2d3c7594ed11db4d1",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.2/ChoreoLib-cpp-2026.0.2-linuxarm64.zip",
        sha256 = "9223d3127d76a0dd4445c00db46698506dda569962aa05a7989d5a6033405773",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.2/Choreo-v2026.0.2-Linux-x86_64-standalone.zip",
        sha256 = "9d780086edabdd30b94fc53f5ea76d49532be17085e2158d947fcbf5b2c9e839",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.2/Choreo-v2026.0.2-macOS-aarch64-standalone.zip",
        sha256 = "789d0841f1ab10f1dd238cd0dd4b67b0fd49b7128b383952b6466f8fe2a567c8",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.2/Choreo-v2026.0.2-macOS-x86_64-standalone.zip",
        sha256 = "81e7ea09d44298fbf8be9706980fda707a8ced9aae9493819a562da84d7ef418",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.2/Choreo-v2026.0.2-Windows-aarch64-standalone.zip",
        sha256 = "ec9b6cbeaf62ed9b9e6574a23cfaeb0b099df17f2dd54b46afc75abf42a6aa05",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.2/Choreo-v2026.0.2-Windows-x86_64-standalone.zip",
        sha256 = "90082e2fd9d019bd2b9fc13377c8ee60689e35182434ac40c7165f0fd928071f",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
