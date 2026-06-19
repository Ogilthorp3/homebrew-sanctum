class SanctumCli < Formula
  include Language::Python::Virtualenv

  desc "Unified terminal binary for Sanctum — router, wizard, doctor"
  homepage "https://github.com/Ogilthorp3/sanctum-cli"
  url "https://github.com/Ogilthorp3/sanctum-cli/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "0e6b3b8051a4bc7bce8c95a2e90ec2e5d08eebca86db73ede19fa1c3c14302f4"
  # FSL-1.1-MIT (Functional Source License, MIT future grant) — not a
  # registered SPDX identifier, so Homebrew can't express it directly.
  license :cannot_represent

  depends_on "python@3.12"
  depends_on "restic"
  depends_on "rclone" => :optional

  def install
    venv_root = libexec
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv_root
    system venv_root/"bin/pip", "install", "--upgrade", "pip"
    # Install sanctum-cli with all runtime dependencies from PyPI.
    # The pyproject pins the direct deps (typer, pydantic, pyyaml, rich,
    # platformdirs, httpx, anthropic, google-genai); pip resolves the
    # transitive closure.
    system venv_root/"bin/pip", "install", buildpath
    # Symlink the entrypoint into Homebrew's bin so `sanctum` is on PATH.
    bin.install_symlink venv_root/"bin/sanctum"
  end

  test do
    # Smoke test: the help screen should render. Doesn't touch the
    # filesystem or network beyond what Click's --help does.
    assert_match "sanctum", shell_output("#{bin}/sanctum --help")
  end
end
