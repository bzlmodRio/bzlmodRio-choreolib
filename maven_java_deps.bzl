load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_choreolib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_choreo_lib_choreolib_java",
        artifact = "com.choreo.lib:ChoreoLib-java:2024.1.3",
        artifact_sha256 = "a78a7206cb0146b6d21650e50f44f7531f737805cd5eb6ff94aeae4cf7f5de56",
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
