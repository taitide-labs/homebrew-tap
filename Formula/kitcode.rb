class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.13/kitcode-aarch64-apple-darwin.tar.gz"
      sha256 "4d14a8b225f7b51ba51a20b1bd0fecf3655de53f5a84fec109a5855b45f9f91b"
    end
    on_intel do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.13/kitcode-x86_64-apple-darwin.tar.gz"
      sha256 "bdbb801aee204ffbda54f6cecbc7b2e69d9ed2317ed8a7fdd79cdd77c6261830"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.13/kitcode-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b661e49306f6b8592e04844699df0a85f98b41930782dfd28337e575cf24980"
    end
    on_intel do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.13/kitcode-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19a9c9e01cea511e88b244d248a84646255654fd8e57234f96de29c4723b5095"
    end
  end

  def install
    bin.install "kitcode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kitcode --version")
  end
end
