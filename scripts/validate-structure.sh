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
  "CODEX.md"
  "PROGRAMME.md"
  "ROADMAP.md"
  "JOURNAL.md"
  "SECURITY.md"
  "CONTRIBUTING.md"
  "LICENSE"
  ".gitignore"
  ".gitattributes"
  ".github/SECURITY_REVIEW.md"
  ".github/pull_request_template.md"
  ".github/workflows/validate-repository.yml"
  ".github/workflows/security-check.yml"
  "scripts/security-scan.sh"
  "docs/publication-model.md"
)

required_dirs=(
  "templates"
  "portfolio"
  "15-laboratoire-final-jury"
  "30-jours-cloud-operations-belgique"
  "docs"
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
  "15-laboratoire-final-jury"
)

template_files=(
  "templates/lab-report-template.md"
  "templates/runbook-template.md"
  "templates/incident-report-template.md"
  "templates/rca-template.md"
  "templates/weekly-learning-log-template.md"
  "templates/jury-defense-template.md"
  "templates/interview-answer-template.md"
  "templates/evidence-template.md"
  "templates/module-readme-template.md"
)

portfolio_files=(
  "portfolio/README.md"
  "portfolio/case-study-cloud-incident.md"
  "portfolio/case-study-monitoring.md"
  "portfolio/case-study-terraform.md"
  "portfolio/cv-bullet-points-fr.md"
  "portfolio/cv-bullet-points-en.md"
)

final_lab_files=(
  "15-laboratoire-final-jury/README.md"
  "15-laboratoire-final-jury/01-contexte-et-besoins.md"
  "15-laboratoire-final-jury/02-architecture.md"
  "15-laboratoire-final-jury/03-implementation.md"
  "15-laboratoire-final-jury/04-supervision.md"
  "15-laboratoire-final-jury/05-securite.md"
  "15-laboratoire-final-jury/06-automatisation.md"
  "15-laboratoire-final-jury/07-gestion-des-incidents.md"
  "15-laboratoire-final-jury/08-defense-jury.md"
)

challenge_files=(
  "30-jours-cloud-operations-belgique/README.md"
  "30-jours-cloud-operations-belgique/PLAN-30-JOURS.md"
  "30-jours-cloud-operations-belgique/SECURITY-CHECKLIST.md"
  "30-jours-cloud-operations-belgique/PUBLICATION-GUIDE.md"
  "30-jours-cloud-operations-belgique/journal/README.md"
  "30-jours-cloud-operations-belgique/journal/jour-01-orientation-cloud-ops.md"
  "30-jours-cloud-operations-belgique/templates/daily-log-template.md"
  "30-jours-cloud-operations-belgique/templates/linkedin-post-template.md"
  "30-jours-cloud-operations-belgique/templates/publication-safety-checklist.md"
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

for module in "${module_dirs[@]}"; do
  [[ "$module" == "00-orientation" || "$module" == "15-laboratoire-final-jury" ]] && continue
  require_path "$module/interview-questions.md"
done

for file in "${template_files[@]}"; do
  require_path "$file"
done

for file in "${portfolio_files[@]}"; do
  require_path "$file"
done

for file in "${final_lab_files[@]}"; do
  require_path "$file"
done

for file in "${challenge_files[@]}"; do
  require_path "$file"
done

if [[ "$missing" -ne 0 ]]; then
  echo "Repository structure validation failed." >&2
  exit 1
fi

echo "Repository structure validation succeeded."
