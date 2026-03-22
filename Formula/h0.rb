class H0 < Formula
  desc "Local-first sidecar harness for coding agents"
  homepage "https://github.com/Suryansh-23/h0"
  version "v0.1.0"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-darwin-arm64.tar.gz"
      sha256 "1aec98a6bd41aca63e48ac702aceb3266b0ef98673c7b5b9ad8007cb2541448e"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-darwin-x64.tar.gz"
      sha256 "b769326770cdfb7569305dfdaaf576a4b0391f5ff2b620255dbd1413e1b74507"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-linux-arm64.tar.gz"
      sha256 "ad76f69023aec8011cbd3799d047887023ccf5e08ad057f58b235e45fffd06cb"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-linux-x64.tar.gz"
      sha256 "6538a1eb36ff41d5b8dac549ca501039c8364e2cf63065c569c57c54a09e75ca"
    end
  end
  depends_on "sqlite"
  def install
    bin.install "h0"
    if OS.mac?
      libexec.install "vec0.dylib"
    else
      libexec.install "vec0.so"
    end
  end
  def caveats
    <<~EOS
      h0 uses sqlite-vec and requires extension-capable SQLite.
      This formula depends on Homebrew sqlite.
      After install, run:
        h0 doctor
    EOS
  end
  test do
    output = shell_output("#{bin}/h0 doctor", 1)
    assert_match "h0 doctor", output
  end
end
