load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_choreolib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_choreo_lib_choreolib_java",
        artifact = "com.choreo.lib:ChoreoLib-java:2024.1.2",
        artifact_sha256 = "266bc5fe97efa92b0b97db8d8abaece81501cfd1413783fa7867df39a20aa1af",
        server_urls = ["https://SleipnirGroup.github.io/ChoreoLib/dep"],
    )

def setup_legacy_bzlmodrio_choreolib_java_dependencies():
    __setup_bzlmodrio_choreolib_java_dependencies(None)

setup_bzlmodrio_choreolib_java_dependencies = module_extension(
    __setup_bzlmodrio_choreolib_java_dependencies,
)

def get_bzlmodrio_choreolib_java_dependencies():
    artifacts = [
        "com.google.code.gson:gson:2.10.1",
    ]
    repositories = [
        "https://repo1.maven.org/maven2",
        "https://frcmaven.wpi.edu/release",
        "https://SleipnirGroup.github.io/ChoreoLib/dep",
    ]

    return artifacts, repositories
