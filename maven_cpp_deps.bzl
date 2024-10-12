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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-3/ChoreoLib-cpp-2025.0.0-beta-3-headers.zip",
        sha256 = "3756af7d74ff05ca0c7de51a3c2c99888898a8ea17976fba859522ba8ad1401d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-3/ChoreoLib-cpp-2025.0.0-beta-3-windowsx86-64.zip",
        sha256 = "a22bb9b8a6d4edfcdb6ed7f54accd5910b4ff4332adeb7eb73f83e83a8ed621e",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-3/ChoreoLib-cpp-2025.0.0-beta-3-linuxx86-64.zip",
        sha256 = "d066736ebec690936b6bb0f44359fb20e34ca9f760800fc183a2325d073fc3e6",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-3/ChoreoLib-cpp-2025.0.0-beta-3-osxuniversal.zip",
        sha256 = "dcc637e7c3984c033c7b52d5f420cf17eb5249bcbf732dd70ce01d2a05d71b0a",
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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-3/ChoreoLib-cpp-2025.0.0-beta-3-linuxathena.zip",
        sha256 = "b7233c897e0f9070297885a5a478a36e185ff513577c61ce4ac7b4cf3e606a40",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-3/ChoreoLib-cpp-2025.0.0-beta-3-linuxarm32.zip",
        sha256 = "4f4e4c3aba2c0e8741a584793b6ccad510b54ed5dfec25aeaba4565f498a7ca9",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-3/ChoreoLib-cpp-2025.0.0-beta-3-linuxarm64.zip",
        sha256 = "9154afc232ba0d1566d28ccf16d9c0798450f4bd3349049d32bda0be3a877098",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
