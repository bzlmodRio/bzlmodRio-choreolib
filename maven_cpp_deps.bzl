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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.3/ChoreoLib-cpp-2026.0.3-headers.zip",
        sha256 = "f7b5d92ab13a6770c43ffb488c6ec452e5894401fc4159889284df240c305f7f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.3/ChoreoLib-cpp-2026.0.3-windowsx86-64.zip",
        sha256 = "b8aa7c4fcb3762f37f0fd1c16bc108f89f781736b63c6540a83a4779c42e2b15",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.3/ChoreoLib-cpp-2026.0.3-linuxx86-64.zip",
        sha256 = "95d28f48a2393119bd0e516ae0baec148fd928114a67d81028d1bbe0a3026772",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.3/ChoreoLib-cpp-2026.0.3-osxuniversal.zip",
        sha256 = "b9fce7a8a29b154862c6e2ecce3e501737f2b261ab3a97a07ac1add92deafb2c",
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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.3/ChoreoLib-cpp-2026.0.3-linuxathena.zip",
        sha256 = "e08139e13c12aa7f3c27ef2d63eaf63e0743ebae1da2ba0efef45d16004939b1",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.3/ChoreoLib-cpp-2026.0.3-linuxarm32.zip",
        sha256 = "7d181c6286a24fc1f939ba1eb228598fa3545698725d4dece5c332c38812a291",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.3/ChoreoLib-cpp-2026.0.3-linuxarm64.zip",
        sha256 = "ff8df4645216510eff0515758df09a7069a24933875de11d28bff7781f452398",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.3/Choreo-v2026.0.3-Linux-x86_64-standalone.zip",
        sha256 = "e70d421d067ed3faeaeae4ad537ab7e82eabce98354e694820b612190ab1de4b",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.3/Choreo-v2026.0.3-macOS-aarch64-standalone.zip",
        sha256 = "df9bf5c383d129bcb2965c97f1f3c9bb1ece553a28a190a605edb457df308e12",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.3/Choreo-v2026.0.3-macOS-x86_64-standalone.zip",
        sha256 = "4b0f1836f26ec75bf14b08820b55f9be7fe9dd711df76ec11a397917bc4295f5",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.3/Choreo-v2026.0.3-Windows-aarch64-standalone.zip",
        sha256 = "1307205574d2d7e4fbf7d6eb80a7d6cad3b5620c316880b2d54484154f98459f",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.3/Choreo-v2026.0.3-Windows-x86_64-standalone.zip",
        sha256 = "bd81fba4f210b105003660d8963ee8ad4fe92340d0216f055544b89bf3ba73c3",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
