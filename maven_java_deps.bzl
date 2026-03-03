load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_choreolib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "choreo_choreolib_java",
        artifact = "choreo:ChoreoLib-java:2026.0.2",
        artifact_sha256 = "c43e550c8db10af2d47db09f9b433bc5f1b6f02b17b33fafb2393a08c9a38606",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release"],
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
        "https://frcmaven.wpi.edu/artifactory/sleipnirgroup-mvn-release",
    ]

    return artifacts, repositories
