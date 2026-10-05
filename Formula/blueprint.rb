class Blueprint < Formula
  desc "Draw a blueprint version of an Icon Composer icon"
  homepage "https://github.com/MustafaNatur/blueprint"
  url "https://github.com/MustafaNatur/blueprint/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7473e36286285dbed686f315278ddf55750151df7366e8036d76529ea56bdfd7"

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
