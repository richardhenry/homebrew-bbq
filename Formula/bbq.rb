class Bbq < Formula
  desc "CLI and TUI for managing git worktrees"
  homepage "https://github.com/richardhenry/bbq"
  url "https://github.com/richardhenry/bbq/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "835a7a0c35a12cf3f2c55b42a46d2dadb9bd6f62c318d3b7fbe10902b2c7ca34"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/bbq-cli")
  end

  test do
    assert_match "bbq", shell_output("#{bin}/bbq --help")
  end
end
