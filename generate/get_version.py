from get_choreolib_dependencies import get_choreolib_dependencies


def main():
    group = get_choreolib_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
