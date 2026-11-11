class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.3"
  if OS.mac?
    url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.3/kitcode-x86_64-apple-darwin.tar.xz"
    sha256 "7dffde76e809fec9f537aab0b02b99dafa4be1865c19c6181ec88b1bb44c112f"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.3/kitcode-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "875ee12c962a211c5245b91ca1793e051978e939fa5c7539362ae5ee01a5e0f6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.3/kitcode-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c1445d57d2100522d580d16a43f51957740a27087b38acafc0e2378025fd1721"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "kitcode"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "kitcode"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "kitcode"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "kitcode"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
