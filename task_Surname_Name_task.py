import argparse

def add(a: int, b: int) -> int:
    return a + b

def main(arguments):
    """Main function
    """
    print("OK")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", type=argparse.FileType("r", encoding="utf-8"),
                        required=True, help="A path to stop words")

    args = parser.parse_args()

    main(args)
