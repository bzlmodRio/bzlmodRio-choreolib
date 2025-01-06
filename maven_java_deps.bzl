load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_choreolib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "choreo_choreolib_java",
        artifact = "choreo:ChoreoLib-java:2025.0.0",
        artifact_sha256 = "d14f9c297405fd62609441e05fc228f4d293eb928b11855165393e16392554c0",
        server_urls = ["https://lib.choreo.autos/dep"],
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
        "https://lib.choreo.autos/dep",
    ]

    return artifacts, repositories
