import os
import subprocess
import sys
import zonpy

def extract_to(filename, dest):
    dest = os.path.join(sys.argv[2], dest)
    os.makedirs(dest, exist_ok=True)
    subprocess.run(["tar", "xf", filename, "--strip-components", "1", "-C", dest])
    print(f"Extracted {filename} to {dest}")

def main():
    if len(sys.argv) < 3:
        print("Usage: extract_deps.py <path to build.zig.zon> <output directory>")
        sys.exit(1)

    build_zig_zon = zonpy.load(sys.argv[1])
    deps = build_zig_zon["dependencies"]

    for key, value in deps.items():
        original_filename = value["url"].rsplit("/", 1)[-1][1:]
        filename = f"{key}-{original_filename}"
        extract_to(filename, value["hash"])

if __name__ == '__main__':
    main()
