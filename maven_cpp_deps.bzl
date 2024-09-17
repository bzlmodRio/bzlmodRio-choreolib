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
        "bazelrio_com_choreo_lib_choreolib-cpp_headers",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.3/ChoreoLib-cpp-2024.2.3-headers.zip",
        sha256 = "c99cc4532fbdce8e91a57d9ac58f24f947e1c2854c34af9fab6a315c53a76591",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_windowsx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.3/ChoreoLib-cpp-2024.2.3-windowsx86-64.zip",
        sha256 = "cd417a1d757b612ebe5facb72f5cb2f2ad4e829c1cb60e35cde5ec154184a2b2",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_linuxx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.3/ChoreoLib-cpp-2024.2.3-linuxx86-64.zip",
        sha256 = "ed3ccc2a91939b8c8143d2987cb8d72e8d50c5d798c78e5218868410da0a25fb",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_osxuniversal",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.3/ChoreoLib-cpp-2024.2.3-osxuniversal.zip",
        sha256 = "d9eb9e23826bd93c2bcfdd6d26bc8b4262a0276996233be3ee49bc5dca8c10e9",
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
        "bazelrio_com_choreo_lib_choreolib-cpp_linuxathena",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.3/ChoreoLib-cpp-2024.2.3-linuxathena.zip",
        sha256 = "1199623095e41b0792a48a1e5d3d2131b11b22bebd696d820adfc0fa56b7c91b",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
