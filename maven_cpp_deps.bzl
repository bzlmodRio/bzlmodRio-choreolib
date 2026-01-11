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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0/ChoreoLib-cpp-2026.0.0-headers.zip",
        sha256 = "8707cc34f7f4fb8368c667833dd73ccccc429923bfbe7504f0e9d5ec840da92a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0/ChoreoLib-cpp-2026.0.0-windowsx86-64.zip",
        sha256 = "05e2efd82da7622a254b2def704e2ac35873f5dea6c03a1bd405d7ed4e546571",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0/ChoreoLib-cpp-2026.0.0-linuxx86-64.zip",
        sha256 = "687454e0d5bc05fd82d818f34521b2b41932ec708b4cad142654bbfc93b5cb35",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0/ChoreoLib-cpp-2026.0.0-osxuniversal.zip",
        sha256 = "598eafeeede9aae9833ac72c72c5bd02f71a32a18f5776d58674129088ac0ded",
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
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0/ChoreoLib-cpp-2026.0.0-linuxathena.zip",
        sha256 = "ff90789505917f20d7271c73a027c1e3d3a51eea4f85bee040b0d962b223aa59",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0/ChoreoLib-cpp-2026.0.0-linuxarm32.zip",
        sha256 = "445320b7d7300ad1e94158feec8d6c532b3b48954b191080bf1779d02bf57567",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release/choreo/ChoreoLib-cpp/2026.0.0/ChoreoLib-cpp-2026.0.0-linuxarm64.zip",
        sha256 = "57b8b0251f454325612ca48dfdb7cbf407f55361d435e2001246bb8c0db2003f",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0/Choreo-v2026.0.0-Linux-x86_64-standalone.zip",
        sha256 = "d1c9a114df3d3d1869371228bd300f6c31331fbbde9c842611bfc221631efb9c",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0/Choreo-v2026.0.0-macOS-aarch64-standalone.zip",
        sha256 = "b214b4d1a0bb4d2ae837ba32d8a85ab03139d46c102819fa1272de6e110c4316",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0/Choreo-v2026.0.0-macOS-x86_64-standalone.zip",
        sha256 = "43e7b6fcdc2a744be883236e1cd587a695d405942a8b8952bb410b2276db5062",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0/Choreo-v2026.0.0-Windows-aarch64-standalone.zip",
        sha256 = "0a155a79ad00c4958740e22001f47bd33bf371f77739a6f581807414d9b543ed",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2026.0.0/Choreo-v2026.0.0-Windows-x86_64-standalone.zip",
        sha256 = "72dd7b0bc06eb0d7129f75e908e323b860005fb75f69137581938e95364a0dd7",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
