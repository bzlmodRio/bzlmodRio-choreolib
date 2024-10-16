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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-5/ChoreoLib-cpp-2025.0.0-beta-5-headers.zip",
        sha256 = "ff71fe8b8472ff6f1448ab3ee57b19b0441fbf5b50db2fd99bf26b127121122e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_windowsx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-5/ChoreoLib-cpp-2025.0.0-beta-5-windowsx86-64.zip",
        sha256 = "853a3cf575fca5b525ef0cdde47ea2f7e54450a1b45638beb56e0ecd70c573fc",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxx86-64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-5/ChoreoLib-cpp-2025.0.0-beta-5-linuxx86-64.zip",
        sha256 = "8653402f0f99268eae22464a25c1678b7b7e2991007eba879e5e5d133165bca7",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_osxuniversal",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-5/ChoreoLib-cpp-2025.0.0-beta-5-osxuniversal.zip",
        sha256 = "1f0b3c91519249b11ca528952b221d2e99199fdfcb6f3d62db447a9574b8e88a",
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
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-5/ChoreoLib-cpp-2025.0.0-beta-5-linuxathena.zip",
        sha256 = "b7a2bc55afb2a843badece90ed2af94da6d99264c7952bfa9aab24f87488c00d",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm32",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-5/ChoreoLib-cpp-2025.0.0-beta-5-linuxarm32.zip",
        sha256 = "ed3ef552b851b7d97c94884a4fe4e497d94457e9bb3757e525615806b858c631",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_choreo_choreolib-cpp_linuxarm64",
        url = "https://SleipnirGroup.github.io/ChoreoLib/dep/choreo/ChoreoLib-cpp/2025.0.0-beta-5/ChoreoLib-cpp-2025.0.0-beta-5-linuxarm64.zip",
        sha256 = "a32772cd49cc68c112be7adc7e1c09fbad264fe2861a96d1a1fb2ede12c04e29",
        build_file = "@bzlmodrio-choreolib//private/cpp/ChoreoLib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_linux-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-5/Choreo-v2025.0.0-beta-5-Linux-x86_64-standalone.zip",
        sha256 = "9f98dbdcfdc70d701af86ae8fafc2c34d09de3ad11367ffa03ae733d672b53c2",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-5/Choreo-v2025.0.0-beta-5-macOS-aarch64-standalone.zip",
        sha256 = "7d43dfff7725e3ac46ca5b4d2406732509662de2ed6943ce851063d38592f2d4",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_macos-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-5/Choreo-v2025.0.0-beta-5-macOS-x86_64-standalone.zip",
        sha256 = "64d62240f1fa3804b1e7c52c23f2a0fa4cadeb13229ebbac6eb6277305861c1f",
        build_file_content = """exports_files(["choreo", "choreo-cli", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-aarch64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-5/Choreo-v2025.0.0-beta-5-Windows-aarch64-standalone.zip",
        sha256 = "13870d16b82255ac029d529d41eeac11eaf59641b371bb10d516cd5565c479fa",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )
    maybe(
        http_archive,
        name = "bazelrio_choreo_windows-x86_64-standalone",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-5/Choreo-v2025.0.0-beta-5-Windows-x86_64-standalone.zip",
        sha256 = "e5758171cf63e6db817658f4cb795a3428631f66d672755b56a9c6dea9652a99",
        build_file_content = """exports_files(["choreo.exe", "choreo-cli.exe", ])""",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
