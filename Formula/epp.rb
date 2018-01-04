class Epp < Formula
  desc "Small templating engine that allows the use of environmental variables."
  homepage "https://github.com/blendle/epp"
  url "https://github.com/blendle/epp.git",
    :tag => "v2.1.0",
    :revision => "4fffc632ad83289cd79c1ed346e73d46f9b39c90"
  head "https://github.com/blendle/epp.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "5cc68b70e5ac009f03619c8890ea45c4cec81d4553cb01e35fb708dcb9ec1174" => :high_sierra
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
