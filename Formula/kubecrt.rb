class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources"
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    tag:      "v0.9.1",
    revision: "56be1141b406552ed043c29a87950cd519f7bbc6"
  head "https://github.com/blendle/kubecrt.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    buildpath.join("src/github.com/blendle/kubecrt").install buildpath.children
    cd "src/github.com/blendle/kubecrt" do
      system "make", "build"
      bin.install "bin/kubecrt"
    end
  end

  test do
    system "#{bin}/kubecrt", "--version"
  end
end
