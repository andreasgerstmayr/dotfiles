#!/usr/bin/env python
"""simple script to find unreferenced Node.js components"""

import sys
import os
import glob
import subprocess
from collections import defaultdict


components = defaultdict(list)
for path in glob.glob("**/*", recursive=True):
    s = path.split("/")
    if s[0] in ["node_modules", "dist"]:
        continue
    b = os.path.basename(path)
    component = b.split(".")[0]
    if component == "index":
        component = os.path.basename(os.path.dirname(path))
    components[component].append(path)

for component, paths in components.items():
    subprocess.run(["clear"])
    print("#",component,paths)
    excludes = []
    for path in paths:
        excludes.append("-g")
        excludes.append("!" + path)

    cmd = ["rg", "--no-heading", "--color=always"] + excludes + [f"import.*{component}"]
    print("$", " ".join(cmd))

    p = subprocess.run(cmd, capture_output=True)
    sys.stdout.buffer.write(p.stdout)
    matches = len(p.stdout.splitlines())
    sys.stdout.flush()

    if matches >= 3:
        continue

    print()
    input()
