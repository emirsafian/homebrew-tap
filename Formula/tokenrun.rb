class Tokenrun < Formula
  desc "Terminal speedometer and pixel runner game for your AI coding token usage"
  homepage "https://github.com/emirsafian/token-runner"
  url "https://github.com/emirsafian/token-runner/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d318a784fe5203ffc651f429c5d98a6339c7a3a19c06f19e304e5530b8d689a1"
  license "MIT"

  def install
    libexec.install "tokenrun"
    (bin/"tokenrun").write <<~SH
      #!/bin/sh
      exec env PYTHONPATH="#{libexec}" python3 -m tokenrun "$@"
    SH
  end

  test do
    system bin/"tokenrun", "--once", "--width", "60"
  end
end
