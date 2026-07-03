class SanctumCli < Formula
  include Language::Python::Virtualenv

  desc "Unified terminal binary for Sanctum — router, wizard, doctor"
  homepage "https://github.com/Ogilthorp3/sanctum-cli"
  url "https://github.com/Ogilthorp3/sanctum-cli/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "cfaf4c51337f7f64a1d57827a42b3f76d8fbae9545155e6a53a127d3bb19686a"
  # FSL-1.1-MIT (Functional Source License, MIT future grant) — not a
  # registered SPDX identifier, so Homebrew can't express it directly.
  license :cannot_represent

  depends_on "python@3.12"
  depends_on "restic"
  # jiter (a transitive dep via anthropic) ships a prebuilt wheel whose
  # .so lacks Mach-O headerpad, so Homebrew can't rewrite its install name
  # ("Updated load commands do not fit in the header") and the install
  # fails. Building that one package from source gives it the headerpad,
  # which needs Rust at build time.
  depends_on "rust" => :build
  depends_on "rclone" => :optional

  def install
    venv_root = libexec
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv_root
    system venv_root/"bin/pip", "install", "--upgrade", "pip"
    # Install sanctum-cli with all runtime dependencies from PyPI.
    # The pyproject pins the direct deps (typer, pydantic, pyyaml, rich,
    # platformdirs, httpx, anthropic, google-genai); pip resolves the
    # transitive closure. Build jiter from source (see the rust build dep
    # above) so its extension is relocatable.
    system venv_root/"bin/pip", "install", "--no-binary", "jiter", buildpath
    # Symlink the entrypoint into Homebrew's bin so `sanctum` is on PATH.
    bin.install_symlink venv_root/"bin/sanctum"
  end

  test do
    # Smoke test: the help screen should render. Doesn't touch the
    # filesystem or network beyond what Click's --help does.
    assert_match "sanctum", shell_output("#{bin}/sanctum --help")
  end
end
