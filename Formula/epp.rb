class Epp < Formula
  desc "Small templating engine that allows the use of environmental variables."
  homepage "https://github.com/blendle/epp"
  url "https://github.com/blendle/epp.git",
    :tag => "v2.0.0",
    :revision => "8917de94a1146c42f7ebcdee7ba4fcb52d5f9c56"
  head "https://github.com/blendle/epp.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "3c3a050e3d6b21901211a5639a21a471864be3ae945397408adca3fa9806c4e5" => :high_sierra
  end

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    buildpath.join("src/github.com/blendle/epp").install buildpath.children
    cd "src/github.com/blendle/epp" do
      system "dep", "ensure", "-vendor-only"
      system "make", "build"
      bin.install "bin/epp"
    end
  end

  test do
    system "#{bin}/epp", "-version"
  end
end
