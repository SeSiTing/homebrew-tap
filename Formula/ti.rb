# 由 `npm run formula` 生成，不要手改。
class Ti < Formula
  desc "极简 coding agent —— 一个 loop、三个工具、零运行时 npm 依赖"
  homepage "https://github.com/SeSiTing/ti-agent"
  url "https://github.com/SeSiTing/ti-agent/releases/download/v0.0.5/ti_0.0.5.tar.gz"
  sha256 "a1318d4d24d2af6417b985e2f855f72c263bb9c1c6b457fd67bcb018cc003703"
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
