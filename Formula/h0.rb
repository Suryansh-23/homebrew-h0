class H0 < Formula
  desc "Local-first sidecar harness for coding agents"
  homepage "https://github.com/Suryansh-23/h0"
  version "v0.1.1"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.1/h0-v0.1.1-darwin-arm64.tar.gz"
      sha256 "c14a5f5c50686b133d75ea08749f15edfd78cbb472dd1102fcf20e572525b06c"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.1/h0-v0.1.1-darwin-x64.tar.gz"
      sha256 "f6dba00ff4adea7ddbd64be824493144e8e4fbd611e1d2350b57963cd46bd991"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.1/h0-v0.1.1-linux-arm64.tar.gz"
      sha256 "6a5c14c9861d300fd3a84bda1bb730fd3ed0dd7f76eb9b57104b1a47d88850c8"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.1/h0-v0.1.1-linux-x64.tar.gz"
      sha256 "f93146a858da2aa4b5a8c41cc46324d9864b2831bdbaceca24ba8674ebfd6866"
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
