#!/usr/bin/env bash
set -euo pipefail

# Public-safe baseline scan for this repository.
# This does not replace GitHub secret scanning, push protection, or manual review.

failures=0

report_failure() {
  local message="$1"
  echo "SECURITY CHECK FAILED: $message" >&2
  failures=1
}

scan_content_pattern() {
  local label="$1"
  local pattern="$2"

  if grep -RInE --exclude-dir=.git --exclude='*.gitkeep' -e "$pattern" .; then
    report_failure "$label"
  fi
}

echo "Running public-safe security scan..."

scan_content_pattern "AWS access key-like value detected" 'AKIA[0-9A-Z]{16}|ASIA[0-9A-Z]{16}'
scan_content_pattern "GitHub PAT-like value detected" 'ghp_[A-Za-z0-9_]{20,}|github_pat_[A-Za-z0-9_]{20,}'
scan_content_pattern "OpenAI sk-style key-like value detected" 'sk-[A-Za-z0-9_-]{20,}'
scan_content_pattern "Slack token-like value detected" 'xox[baprs]-[A-Za-z0-9-]{20,}'
scan_content_pattern "Private key block detected" '-----BEGIN [A-Z ]*PRIVATE KEY-----'
scan_content_pattern "Sensitive assignment detected" '(password|passwd|token|secret|api_key|apikey|client_secret)[[:space:]]*=[[:space:]]*["'\'']?[^"'\'' <>`{}][^"'\''[:space:]]{2,}'
scan_content_pattern "Tenant/subscription UUID-like identifier detected" '(tenant|subscription|account)[^[:cntrl:]]{0,40}[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}'

sensitive_files="$(
  find . -path ./.git -prune -o -type f \( \
    -name '.env' -o \
    -name '.env.*' -o \
    -name '*.pem' -o \
    -name '*.key' -o \
    -name '*.pfx' -o \
    -name '*.p12' -o \
    -name '*.tfstate' -o \
    -name '*.tfvars' -o \
    -name 'credentials.json' -o \
    -name 'secrets.json' \
  \) -print
)"

if [[ -n "$sensitive_files" ]]; then
  echo "$sensitive_files" >&2
  report_failure "Sensitive file type detected"
fi

if [[ "$failures" -ne 0 ]]; then
  echo "Security scan failed. Review findings before commit or push." >&2
  exit 1
fi

echo "Security scan passed."
