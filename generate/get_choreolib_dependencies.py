import os

from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies
from bazelrio_gentool.deps.dependency_container import (
    ModuleDependency,
)
from bazelrio_gentool.deps.sha256_helper import get_hash

def _executable_tool(
    maven_dep,
    tool_name,
    group_id="edu.wpi.first.tools",
    native_platforms=None,
    lower_target_name=False,
):
    native_platforms = [
        "Linux-x86_64",
        "macOS-aarch64",
        "macOS-x86_64",
        "Windows-aarch64.exe",
        "Windows-x86_64.exe",
    ]

    
    maven_dep.create_single_file_binary(
        url_base = "https://github.com/SleipnirGroup/Choreo/releases/download",
        tool_name = tool_name,
        resources=native_platforms,
        version=maven_dep.version,
    )


def get_choreolib_dependencies(
    use_local_allwpilib=False,
    use_local_opencv=False,
    use_local_ni=True,
    allwpilib_version_override="2024.1.1",
    opencv_version_override="2024.4.8.0-4.bcr1",
    ni_version_override="2024.2.1.bcr1",
):
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(
            use_local_opencv=use_local_opencv,
            use_local_ni=use_local_ni,
            opencv_version_override=opencv_version_override,
            ni_version_override=ni_version_override,
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
        override_version=allwpilib_version_override,
    )

    group = vendordep_dependency(
        "bzlmodrio-choreolib",
        os.path.join(SCRIPT_DIR, f"vendor_dep.json"),
        fail_on_hash_miss=False,
        has_static_libraries=False,
        install_name_lookup={
            "ChoreoLib-cpp": dict(
                artifact_install_name="ChoreoLib",
                deps=[
                    allwpilib_dependency.container.get_cc_dependency("wpilibc-cpp"),
                    allwpilib_dependency.container.get_cc_dependency(
                        "wpilibNewCommands-cpp"
                    ),
                ],
            ),
        },
        maven_dependency_ignore_list=["gson"],
    )
    group.add_module_dependency(allwpilib_dependency)

    group.add_cc_meta_dependency(
        "choreolib-cpp",
        deps=[
            "ChoreoLib-cpp",
            "wpilibc-cpp",
            "wpilibNewCommands-cpp",
        ],
        platform_deps={},
        jni_deps={
            # TODO
        },
    )

    group.add_java_meta_dependency(
        "choreolib-java",
        group_id=f"choreo",
        deps=[
            "wpilibj-java",
            "wpilibNewCommands-java",
        ],
        maven_deps=[
            ("com.google.code.gson:gson", "2.10.1"),
        ],
    )

    _executable_tool(group, tool_name="Choreo-CLI", lower_target_name=True)
    _executable_tool(group, tool_name="Choreo", lower_target_name=True)

    return group
