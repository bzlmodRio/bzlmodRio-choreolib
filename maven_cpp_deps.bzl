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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.1/ChoreoLib-cpp-2026.0.1-headers.zip",
        sha256 = "02d57a52804e8eb57bc9a75cdf34f99b81cd90f6dc485c4abe692311c219c125",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.1/ChoreoLib-cpp-2026.0.1-windowsx86-64.zip",
        sha256 = "d2c0c73ca507772923803fa9c4ddeede942f250b43a3a9540916e64a579cce39",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.1/ChoreoLib-cpp-2026.0.1-linuxx86-64.zip",
        sha256 = "b8247ec245e0b365fed5df6ddc448e5eda02cc04c103daaaab243cadd6e6e10d",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.1/ChoreoLib-cpp-2026.0.1-osxuniversal.zip",
        sha256 = "dae945d6313b2537a2fff0d630b33072798459a8be5a5fb3b705fe0ff7b04b37",
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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.1/ChoreoLib-cpp-2026.0.1-linuxathena.zip",
        sha256 = "80ef579558fec85f98b45d333dbd9f818130bbedc5d498b816d2a625432d897e",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.1/ChoreoLib-cpp-2026.0.1-linuxarm32.zip",
        sha256 = "89e00623f8d550ca18dd68f8bb87ff98a99de1f3b8461d9b968268304ac21d57",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.1/ChoreoLib-cpp-2026.0.1-linuxarm64.zip",
        sha256 = "16b36c36b7d632318a7b8e88491d2975c520ca61ada0ccf1d766cacab9afc098",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.1/Choreo-v2026.0.1-Linux-x86_64-standalone.zip",
        sha256 = "b1c14bd25a3dae155904fa6a2de2e859c18f89784332fac34048e9e93970b0a8",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.1/Choreo-v2026.0.1-macOS-aarch64-standalone.zip",
        sha256 = "ca57adf3f765371b735c00a1e37f1672a37fce7c6e635f66a455b4043a4aa464",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.1/Choreo-v2026.0.1-macOS-x86_64-standalone.zip",
        sha256 = "850c1001b2feccbcba79213c44c1dc19c52e14d5841f1be2f267088c5b11443c",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.1/Choreo-v2026.0.1-Windows-aarch64-standalone.zip",
        sha256 = "a2bbf2e8b0886337ed49b44df8899a28971d29859687144ece58b7c2876db529",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.1/Choreo-v2026.0.1-Windows-x86_64-standalone.zip",
        sha256 = "6b7beb2dba14e069022d8951bc068ca2114886503cd306bf5b047c3c2d247a68",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
