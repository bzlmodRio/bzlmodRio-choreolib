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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.2/ChoreoLib-cpp-2024.2.2-headers.zip",
        sha256 = "026b58d203b218cf52d656eb686370b9d9734acfba9064eaa7fc33a0bbd32a6f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_windowsx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.2/ChoreoLib-cpp-2024.2.2-windowsx86-64.zip",
        sha256 = "d612add11b457f936b23cc7fac94b7ae5e58e3266aaf98fcc523b33a97f2fb72",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_linuxx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.2/ChoreoLib-cpp-2024.2.2-linuxx86-64.zip",
        sha256 = "8d3f494b14db201410582f8e40b11f348b410f3135365a3b9b423711fadd8e73",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_choreo_lib_choreolib-cpp_osxuniversal",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.2/ChoreoLib-cpp-2024.2.2-osxuniversal.zip",
        sha256 = "afa750c5761e4743bc81a6434a571b90faf94f4661d1547f92006f507a2eaccb",
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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/com/choreo/lib/ChoreoLib-cpp/2024.2.2/ChoreoLib-cpp-2024.2.2-linuxathena.zip",
        sha256 = "23f2446587b8ce3493a17d21fa569f628d12bce6df6363470b577299234b012a",
        build_file_content = cc_library_shared,
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
