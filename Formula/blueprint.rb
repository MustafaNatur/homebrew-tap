class Blueprint < Formula
  desc "Draw a blueprint version of an app icon for debug builds"
  homepage "https://github.com/MustafaNatur/blueprint"
  url "https://github.com/MustafaNatur/blueprint/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "caadb73ff24e4ebb55a1ed3663b0b1197488fa7abe9230588047590a3726d64d"

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
