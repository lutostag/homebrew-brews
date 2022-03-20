class Justprep < Formula
  desc "pre-processor for the just command-line utility"
  homepage "https://github.com/MadBomber/justprep"
  url "https://github.com/MadBomber/justprep/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "7b482e617d562afb277565f2fc5f331ea0a1d72e548730a19e9117f58852e5df"
  license "MIT"

  depends_on "crystal" => :build

  def install
    chdir "crystal" do
      system "crystal", "build", "--no-debug", "--release", "-p", "-o", "bin/justprep", "justprep.cr", "version.cr"
      system "strip", "./bin/justprep"
      bin.install "./bin/justprep"
    end
  end

  test do
    system "#{bin}/justprep", "--version"
  end
end
