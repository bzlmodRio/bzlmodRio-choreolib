alias(
    name = "Choreo-CLI",
    actual = select({
        "@rules_bzlmodrio_toolchains//conditions:linux_x86_64": "@bazelrio_choreo-cli_linux-x86_64//file:downloaded",
        "@rules_bzlmodrio_toolchains//conditions:osx": "@bazelrio_choreo-cli_macos-x86_64//file:downloaded",
        "@rules_bzlmodrio_toolchains//conditions:windows": "@bazelrio_choreo-cli_windows-x86_64//file:downloaded",
    }),
)
