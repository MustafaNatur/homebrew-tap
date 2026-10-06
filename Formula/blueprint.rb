class Blueprint < Formula
  desc "Draw a blueprint version of an Icon Composer icon"
  homepage "https://github.com/MustafaNatur/blueprint"
  url "https://github.com/MustafaNatur/blueprint/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d088c0219c60bf8e598405da94be4c680bf11937a43c5089546f4920e165c62b"

  depends_on xcode: ["26.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/blueprint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blueprint --version")
  end
end
