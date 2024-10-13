load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
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
    maybe(
        http_file,
        name = "bazelrio_choreo-cli_linux-x86_64",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-CLI-v2025.0.0-beta-3-Linux-x86_64",
        executable = True,
        sha256 = "1a8a0ad0693525e5fffe8fa2b63809e187b13caced56de58408ae37a31f72fb3",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo-cli_macos-aarch64",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-CLI-v2025.0.0-beta-3-macOS-aarch64",
        executable = True,
        sha256 = "e8dd5a77b1244e89c3e1132d645791d3fb9f3e435fd5acda1972cb09635822c5",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo-cli_macos-x86_64",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-CLI-v2025.0.0-beta-3-macOS-x86_64",
        executable = True,
        sha256 = "1ff9042b780f280d3649ab79b68fe0e65671b3702de851cb02d12c912344a571",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo-cli_windows-aarch64.exe",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-CLI-v2025.0.0-beta-3-Windows-aarch64.exe",
        executable = True,
        sha256 = "ed122b9c85cfa19c45382a88b27de1d67807fd8bc8bcd86506c9db381683508f",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo-cli_windows-x86_64.exe",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-CLI-v2025.0.0-beta-3-Windows-x86_64.exe",
        executable = True,
        sha256 = "c7d70917a489e73a0ecaa935aa285ae8325879de28c3632b97970feab451a6da",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo_linux-x86_64",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-v2025.0.0-beta-3-Linux-x86_64",
        executable = True,
        sha256 = "6191f4ed68bc9dc32e665672fe8592c7dd9ac53db022532219b379396b81543e",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo_macos-aarch64",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-v2025.0.0-beta-3-macOS-aarch64",
        executable = True,
        sha256 = "18e6eab64fce50ce78dae106c25d9ee193c1f6897e827663bcdeaeb497068ca1",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo_macos-x86_64",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-v2025.0.0-beta-3-macOS-x86_64",
        executable = True,
        sha256 = "647575d52ca96000c4ec97b8eb604b4cb1e0d091a728e3307b9c8a305ccff21e",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo_windows-aarch64.exe",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-v2025.0.0-beta-3-Windows-aarch64.exe",
        executable = True,
        sha256 = "0b5bd90a914e4a8250101694abc9f06fba1d66dd8e9d0be11d0fa7e8b7746b65",
    )
    maybe(
        http_file,
        name = "bazelrio_choreo_windows-x86_64.exe",
        url = "https://github.com/SleipnirGroup/Choreo/releases/download/v2025.0.0-beta-3/Choreo-v2025.0.0-beta-3-Windows-x86_64.exe",
        executable = True,
        sha256 = "f286da8a5b1a3d782831a34d0bb00f76b904a99c7c233c05fbb3c20ce924207d",
    )

def setup_legacy_bzlmodrio_choreolib_cpp_dependencies():
    __setup_bzlmodrio_choreolib_cpp_dependencies(None)

setup_bzlmodrio_choreolib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_cpp_dependencies,
)
