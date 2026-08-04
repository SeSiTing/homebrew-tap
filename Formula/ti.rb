# 由 `npm run formula` 生成，不要手改。
class Ti < Formula
  desc "极简 coding agent —— 一个 loop、三个工具、零运行时 npm 依赖"
  homepage "https://github.com/SeSiTing/ti-agent"
  url "https://github.com/SeSiTing/ti-agent/releases/download/v0.0.2/ti_0.0.2.tar.gz"
  sha256 "e2e32b6ccf4d8849179614c33de57229100c94bf454dd075a0b5d75cfaecfd70"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "package.json", "dist"
    bin.install_symlink libexec/"dist/index.js" => "ti"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ti --version")
    assert_match "ti · ", shell_output("#{bin}/ti --help")
  end
end
