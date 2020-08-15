class Clarify < Formula
  desc "Clarify color codes numbers and uppercase letters"
  homepage "https://github.com/is4tomj/clarify"
  version "1.0.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/is4tomj/clarify/releases/download/v1.0.0/clarify_darwin_amd64.tar.gz"
    sha256 "48c798ae25ccf446d8caad7df4c4eeda92a5dda3b923bf165589e2f193d1d54e"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/is4tomj/clarify/releases/download/v1.0.0/clarify_linux_amd64.tar.gz"
      sha256 "42a18ece518531538297a5f58f391c0642097afc861181c5c889c94e8b30d53d"
    end
  end
  
  def install
    bin.install "clarify"
  end
  
  test do
    assert_match /\u001b[36;1mI\u001b[0mt is w\u001b[31m0\u001b[0mrking./, shell_output("echo 'It is w0rking' | #{bin}/clarify", 0)
  end
end
