# homebrew-sanctum

The official Homebrew tap for [Sanctum](https://sanctum.haus) — a privacy-first
AI platform that runs on your own hardware.

## Install

```sh
brew tap ogilthorp3/sanctum
brew install sanctum-cli
```

Then:

```sh
sanctum --version
sanctum doctor          # honest health across the LaunchAgent constellation
```

## What's here

| Formula | What it installs |
|---|---|
| `sanctum-cli` | The `sanctum` binary — routes prompts to Claude / Gemini / local MLX, provisions cloud backups and credentials, and reports service health. |

Source and full documentation:

- **CLI** — <https://github.com/Ogilthorp3/sanctum-cli>
- **Docs** — <https://sanctum.run>
- **Project** — <https://sanctum.haus>

## Licensing

The tap itself (this repository — the formula files) is trivial packaging
metadata. The software it installs is licensed separately: `sanctum-cli` is
**FSL-1.1-MIT** (Functional Source License with an MIT future grant). FSL is not
a registered SPDX identifier, which is why the formula declares
`license :cannot_represent` — see the formula for the note.

Read the licence in the [sanctum-cli
repository](https://github.com/Ogilthorp3/sanctum-cli/blob/main/LICENSE) before
redistributing.

## Security

Report vulnerabilities privately to `security@sanctum.run`, or through the
[sanctum-cli security
advisories](https://github.com/ogilthorp3/sanctum-cli/security/advisories/new) —
not as a public issue.
