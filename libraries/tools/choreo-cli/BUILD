alias(
    name = "choreo-cli",
    actual = select({
        "@rules_bzlmodrio_toolchains//conditions:linux_x86_64": "@bazelrio_choreo_linux-x86_64-standalone//:choreo-cli",
        "@rules_bzlmodrio_toolchains//conditions:osx": "@bazelrio_choreo_macos-x86_64-standalone//:choreo-cli",
        "@rules_bzlmodrio_toolchains//conditions:windows": "@bazelrio_choreo_windows-x86_64-standalone//:choreo-cli.exe",
    }),
)
