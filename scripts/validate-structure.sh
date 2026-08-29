#!/usr/bin/env bash
set -euo pipefail

missing=0

require_path() {
  local path="$1"
  if [[ ! -e "$path" ]]; then
    echo "Missing required path: $path" >&2
    missing=1
  fi
}

required_files=(
  "README.md"
  "PROGRAMME.md"
  "ROADMAP.md"
  "JOURNAL.md"
  "SECURITY.md"
  "CONTRIBUTING.md"
  ".gitignore"
)

required_dirs=(
  "templates"
  "portfolio"
  "15-laboratoire-final-jury"
)

module_dirs=(
  "00-orientation"
  "01-reseaux-tcp-ip"
  "02-windows-server-introduction"
  "03-powershell-introduction"
  "04-administration-windows-server"
  "05-az-104-azure-administrator"
  "06-microsoft-365-administration"
  "07-linux-server-administration"
  "08-bash-scripting"
  "09-containerisation"
  "10-aws-cloud-practitioner"
  "11-terraform"
  "12-vmware-vsphere"
  "13-observabilite-supervision"
  "14-securisation-systemes-services"
)

for file in "${required_files[@]}"; do
  require_path "$file"
done

for dir in "${required_dirs[@]}"; do
  require_path "$dir"
done

for dir in "${module_dirs[@]}"; do
  require_path "$dir"
  require_path "$dir/README.md"
done

require_path "portfolio/README.md"
require_path "15-laboratoire-final-jury/README.md"

for module in "${module_dirs[@]}"; do
  [[ "$module" == "00-orientation" ]] && continue
  require_path "$module/interview-questions.md"
done

if [[ "$missing" -ne 0 ]]; then
  echo "Repository structure validation failed." >&2
  exit 1
fi

echo "Repository structure validation succeeded."
