class Blueprint < Formula
  desc "Draw a blueprint version of an app icon for debug builds"
  homepage "https://github.com/MustafaNatur/blueprint"
  url "https://github.com/MustafaNatur/blueprint/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "dacdc3a5d2c422dc28fe7f67c54484e606f1e252066cbe80a01edf69aa559b66"
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
