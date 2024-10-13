alias(
    name = "Choreo",
    actual = select({
        "@rules_bzlmodrio_toolchains//conditions:linux_x86_64": "@bazelrio_choreo_linux-x86_64//file:downloaded",
        "@rules_bzlmodrio_toolchains//conditions:osx": "@bazelrio_choreo_macos-x86_64//file:downloaded",
        "@rules_bzlmodrio_toolchains//conditions:windows": "@bazelrio_choreo_windows-x86_64.exe//file:downloaded",
    }),
)
