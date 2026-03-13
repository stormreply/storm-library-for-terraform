#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

python3 - "$REPO_ROOT/catalog.yaml" "$REPO_ROOT/docs/CATALOG.md" <<'EOF'
import sys
import yaml

catalog_file = sys.argv[1]
output_file = sys.argv[2]

with open(catalog_file) as f:
    data = yaml.safe_load(f)

entries = sorted(
    [(name, meta) for name, meta in data["catalog"].items() if meta.get("id", 0) != 0],
    key=lambda x: x[1].get("id", 0)
)

lines = []
lines.append("")
lines.append("<table>")
lines.append("<tr align=\"left\" valign=\"top\">")
lines.append("  <th width=\"25%\">SLT Member Repository</th>")
lines.append("  <th>Description</th>")
lines.append("  <th>Architecture</th>")
lines.append("</tr>")

for name, meta in entries:
    ref = meta.get("reference", "")
    desc = meta.get("description", "")
    if isinstance(desc, str):
        desc = " ".join(desc.split())
    authors = meta.get("authors", "")
    img_url = f"{ref}/blob/main/assets/architecture.drawio.svg"

    lines.append("<tr align=\"left\" valign=\"top\">")
    lines.append(f"  <td><a href=\"{ref}\"><b>{name}</b></a><br/>by<br/>{authors}</td>")
    lines.append(f"  <td>{desc}</td>")
    lines.append(f"  <td><img src=\"{img_url}\" width=\"200\"/></td>")
    lines.append("</tr>")

lines.append("</table>")
lines.append("")

with open(output_file, "w") as f:
    f.write("\n".join(lines))

print(f"Generated {output_file} with {len(entries)} entries.")
EOF
