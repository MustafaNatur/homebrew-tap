class Blueprint < Formula
  desc "Draw a blueprint version of an app icon for debug builds"
  homepage "https://github.com/MustafaNatur/blueprint"
  url "https://github.com/MustafaNatur/blueprint/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "2030630db41b1c402e52b6375872e924cf0128b72d17184bdc148e7950a34cb3"
  license "MIT"

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
