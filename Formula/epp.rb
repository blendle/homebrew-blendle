require "language/go"

class Epp < Formula
  desc "Small templating engine that allows the use of environmental variables."
  homepage "https://github.com/blendle/epp"
  url "https://github.com/blendle/epp.git",
    :tag => "v1.1.1",
    :revision => "225bdbacaf52f2d42f2ceaefded96a8ddd08f8fe"
  head "https://github.com/blendle/epp.git"

  depends_on "go" => :build

  go_resource "github.com/blendle/epp" do
    url "https://github.com/blendle/epp.git",
        :revision => "225bdbacaf52f2d42f2ceaefded96a8ddd08f8fe"
  end

  go_resource "github.com/flosch/pongo2" do
    url "https://github.com/flosch/pongo2.git",
        :revision => "1d0f0d3af150c4a65dfd424d742f7374819e7d29"
  end

  go_resource "github.com/juju/errors" do
    url "https://github.com/juju/errors.git",
        :revision => "6f54ff6318409d31ff16261533ce2c8381a4fd5d"
  end

  def install
    ENV["GOPATH"] = buildpath
    Language::Go.stage_deps(resources, buildpath/"src")

    system "make", "build"
    bin.install "bin/epp"
  end

  test do
    system "#{bin}/epp", "-version"
  end
end
