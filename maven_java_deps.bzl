load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_choreolib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "choreo_choreolib_java",
        artifact = "choreo:ChoreoLib-java:2026.0.0",
        artifact_sha256 = "b4f5bdfba78635c9f3c84a00e5e2c2ea2d54a461a0edf5fa944b783bc3a15cb8",
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
