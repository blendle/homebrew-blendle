class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources."
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    :tag => "v0.6.1",
    :revision => "6cd24196f610a98d0d197d8d7cefb250e3cd63a7"
  head "https://github.com/blendle/kubecrt.git"

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "8a43e06d80b873d58b9de584997c7a7362a9420fb3c8032c9b7529fd7aff37ec" => :high_sierra
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
