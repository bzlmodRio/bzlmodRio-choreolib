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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-2/ChoreoLib-cpp-2025.0.0-beta-2-headers.zip",
        sha256 = "5040ecca1d71b9a397fc6e61046316aa4c9dc98f2ad735c0ae57adae262623b7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-2/ChoreoLib-cpp-2025.0.0-beta-2-windowsx86-64.zip",
        sha256 = "19e8366b1f5725c009fc5b6aa7c0c4a8bb7c23fc440a92f5c39d449ea692fc83",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-2/ChoreoLib-cpp-2025.0.0-beta-2-linuxx86-64.zip",
        sha256 = "caba5c07c1457f1b9641ad9eec7ad3548de341390b9c64652006aeea9d14fdfc",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-2/ChoreoLib-cpp-2025.0.0-beta-2-osxuniversal.zip",
        sha256 = "e6db865be60aef574043b1f8d9e4bfb02229f92a8a07e011408f5c43b6264931",
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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-2/ChoreoLib-cpp-2025.0.0-beta-2-linuxathena.zip",
        sha256 = "e4309c35dd0d47a23088c0ba2a77b2f3f67ccb3eb0bacea2f6465cded8814b90",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-2/ChoreoLib-cpp-2025.0.0-beta-2-linuxarm32.zip",
        sha256 = "c932c5ac5ef2e87f6c97dbac4d2b8de79f527ec8bfcd423a32e1b6fa1c623c26",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-2/ChoreoLib-cpp-2025.0.0-beta-2-linuxarm64.zip",
        sha256 = "82640c97478e01bde7033502ccf8f848b0e7ea18e1cda1071720028afc6b63f3",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
