load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_choreolib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_headers",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.1.2/ChoreoLib-cpp-2024.1.2-headers.zip",
        sha256 = "2f56c346aa4b32342ec203b64d7c239c013e620a3ae944bd10aab920e615ebcf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_windowsx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.1.2/ChoreoLib-cpp-2024.1.2-windowsx86-64.zip",
        sha256 = "e2a3f70d73e44d300de8ac0502d783ba7ba80acf9c7d2a1a7b045395f29c6dad",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_linuxx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.1.2/ChoreoLib-cpp-2024.1.2-linuxx86-64.zip",
        sha256 = "6a99131f0fefb3114f8c62c9ea11c454fe86e133b970cfe3ffdc125bf38ff637",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_osxuniversal",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.1.2/ChoreoLib-cpp-2024.1.2-osxuniversal.zip",
        sha256 = "8bec8fa36ec80ad5e16465d1366dc67f90ceadde4d95116c5f222dc218e9d019",
        build_file_content = cc_library_shared,
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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.1.2/ChoreoLib-cpp-2024.1.2-linuxathena.zip",
        sha256 = "d1a6eb00ff168dad884be10be2320343fb65006279052e446e9e555a180eeb00",
        build_file_content = cc_library_shared,
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
