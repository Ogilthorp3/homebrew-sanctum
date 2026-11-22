# Security Policy

`homebrew-sanctum` is the official Homebrew tap for Sanctum (`sanctum-cli`).
Because a Homebrew formula executes during `brew install` and pins every build
and runtime archive by SHA-256, we treat tap integrity and supply-chain
security as high priority.

## Reporting a Vulnerability

**Do not open a public GitHub issue for a security problem.** Public issues are
visible to everyone and can put users at risk before a fix ships.

Instead, report privately through either:

- **GitHub Security Advisories** — the preferred channel. Open a draft advisory
  at <https://github.com/Ogilthorp3/homebrew-sanctum/security/advisories/new>
  (or <https://github.com/Ogilthorp3/sanctum-cli/security/advisories/new> for
  issues in `sanctum-cli` itself).
- **Email** — `security@sanctum.run`.

Please include:

- The affected formula and commit or tag (`brew info ogilthorp3/sanctum/sanctum-cli`).
- Your macOS version and Homebrew version (`brew --version`).
- A clear description of the issue, reproduction steps, and impact.

## What to Expect

- **Acknowledgement** within 3 business days.
- **Triage + initial assessment** within 7 business days.
- **Fix + coordinated disclosure** — we aim to ship a fix and publish an
  advisory within 90 days, sooner for actively-exploited issues.

## Supply-Chain Posture

- `Formula/sanctum-cli.rb` installs offline (`PIP_NO_INDEX=1`) from pinned,
  SHA-256-verified build and runtime `resource` blocks mirrored from
  `sanctum-cli/uv.lock`.
- Starting with `v1.0.0`, the formula tracks the Sigstore-signed release sdist
  (`sanctum_cli-<version>.tar.gz`) verified against the release's signed
  `SHA256SUMS.txt` (`cosign` keyless OIDC + GitHub SLSA build provenance).
- Tap CI (`test-formula.yml`) runs on GitHub-hosted `macos-latest` runners with
  SHA-pinned actions and least-privilege permissions (`contents: read`).

## Scope

In scope:

- Formula definitions under `Formula/`, SHA-256 pins, install blocks, and CI
  workflows in this repository.

Out of scope:

- Vulnerabilities inside upstream PyPI or Homebrew core dependencies (please
  report upstream and notify us so we can bump our pins).
- Issues inside `sanctum-cli` runtime code — report those in
  [Ogilthorp3/sanctum-cli](https://github.com/Ogilthorp3/sanctum-cli/security/advisories/new).
