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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.2/ChoreoLib-cpp-2025.0.2-headers.zip",
        sha256 = "493f3df4ccbf70dd6837c831c79ac22b3198f06648e3e618c93a0cf1f562e581",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.2/ChoreoLib-cpp-2025.0.2-windowsx86-64.zip",
        sha256 = "e0a9acfea4b86b341affeb4b838ffde1d916d6d9c8af5f189bd7029d75465356",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.2/ChoreoLib-cpp-2025.0.2-linuxx86-64.zip",
        sha256 = "042ebc25f9924083a32ef0e2b0341dd637ac274607633e6d1f35deee8e434343",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.2/ChoreoLib-cpp-2025.0.2-osxuniversal.zip",
        sha256 = "9efb0eba8526050c625af6e26b79f9b25446cc567f2e7dc1e03a9a1a7ea7b713",
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
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.2/ChoreoLib-cpp-2025.0.2-linuxathena.zip",
        sha256 = "a920db4113a8d6458afc43e014e68bfb1ae022849703b8bdfdc33b6d243bd5f2",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.2/ChoreoLib-cpp-2025.0.2-linuxarm32.zip",
        sha256 = "fab679b3ebaeb860cc9f8047263c7c12c0ebb96797c90c4ff7c1d584f40ca6d1",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://lib.choreo.autos/dep/choreo/ChoreoLib-cpp/2025.0.2/ChoreoLib-cpp-2025.0.2-linuxarm64.zip",
        sha256 = "04c17f2c3f88987410074442f6d1f01b86aa365063d38672ba5829b523ae57f2",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.2/Choreo-v2025.0.2-Linux-x86_64-standalone.zip",
        sha256 = "cfeff35a3e265c16337968304e1136a4acc3bcd923e146282b6dc763df578c45",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.2/Choreo-v2025.0.2-macOS-aarch64-standalone.zip",
        sha256 = "6a29b0e45f043f7f432c9f60945e5c45707ed7f5f1fe20614882cf1d0a57c198",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.2/Choreo-v2025.0.2-macOS-x86_64-standalone.zip",
        sha256 = "45bbd3887af66db9a715af9730d916a80192c5326528715cc19d9e32db25d9cd",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.2/Choreo-v2025.0.2-Windows-aarch64-standalone.zip",
        sha256 = "e2923b1a9e94b1b87cbceeb76c4b89a797312944cee09bc8eedfa8fc15feac5c",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.2/Choreo-v2025.0.2-Windows-x86_64-standalone.zip",
        sha256 = "e097a9c3afb5f7296317e8880e7e500f84eff45ac43b0170e0ffd4f5be313674",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
