class Clauderun < Formula
  desc "Terminal speedometer and pixel runner game for your Claude Code token usage"
  homepage "https://github.com/emirsafian/claude-runner"
  url "https://github.com/emirsafian/claude-runner/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fdf24e06a45c46559a83fe74b1fb05e3289fcefba562357113d98d75c85a7394"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "clauderun"
    python = Formula["python@3.13"].opt_bin/"python3"
    (bin/"clauderun").write <<~SH
      #!/bin/sh
      exec env PYTHONPATH="#{libexec}" "#{python}" -m clauderun "$@"
    SH
  end

  test do
    system bin/"clauderun", "--once", "--width", "60"
  end
end
