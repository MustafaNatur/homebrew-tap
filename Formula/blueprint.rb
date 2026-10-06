class Blueprint < Formula
  desc "Draw a blueprint version of an Icon Composer icon"
  homepage "https://github.com/MustafaNatur/blueprint"
  url "https://github.com/MustafaNatur/blueprint/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "7c8a5cbb88a4864eddc72db1befb72c1ba0cc71053aa2ba5efda7c0f30e6ea11"

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
