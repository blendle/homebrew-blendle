class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources."
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    :tag => "v0.6.0",
    :revision => "7e2d38e076b3b6fd43d05b74096316dbee47cf72"
  head "https://github.com/blendle/kubecrt.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "7bb5ef0a916cd4056b23f61edc6e12516395d9d8c9593e5dd5a4e845aeeacbf4" => :high_sierra
  end

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    buildpath.join("src/github.com/blendle/kubecrt").install buildpath.children
    cd "src/github.com/blendle/kubecrt" do
      system "dep", "ensure", "-vendor-only"
      system "make", "build"
      bin.install "bin/kubecrt"
    end
  end

  test do
    system "#{bin}/kubecrt", "--version"
  end
end
