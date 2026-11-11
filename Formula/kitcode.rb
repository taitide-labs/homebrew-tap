class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.7"
  if OS.mac?
    url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.7/kitcode-x86_64-apple-darwin.tar.xz"
    sha256 "d57cc08b0bb3ea9c9d308672467741022665b3bf24fb7d1f3980670554129ae1"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.7/kitcode-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "21ce045f0794eaa06c21de2d6e018046279ea6ca033904d0dc8f4796bec613bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.7/kitcode-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b055c352cc24da58e4cd37af55b7f42d7d3c1b7146f0765842b63afffada6be2"
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
