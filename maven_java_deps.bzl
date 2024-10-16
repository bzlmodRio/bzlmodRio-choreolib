load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_choreolib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "choreo_choreolib_java",
        artifact = "choreo:ChoreoLib-java:2025.0.0-beta-5",
        artifact_sha256 = "8d196b03b4074db445dcfd759aa0da82aeadfc395e85b95db96d5614b39d46ed",
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
