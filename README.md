# Blendle Homebrew tap

[![Build Status](https://travis-ci.org/blendle/homebrew-blendle.svg?branch=master)](https://travis-ci.org/blendle/homebrew-blendle)

Homebrew tap for tools not (yet) submitted to Homebrew Core.

## Usage

```
brew tap blendle/blendle
brew install ...
```

On Linux, install [Linuxbrew](http://linuxbrew.sh) first.

## Bottling a new version

* edit the formula as you see fit

  ```
  brew edit Formula/<formula>
  ```

* build a new bottle (binary) of the changes

  ```
  brew install Formula/<formula> --build-bottle
  ```

* tar the bottle, and retrieve the Ruby code required

  ```
  brew bottle Formula/<formula> --root-url=https://homebrew-blendle.storage.googleapis.com
  ```

* copy the returned code back into the formula Ruby file

  ```
  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "9e1da44221d6ce25d8f0c2e88cb633fd1e1da99e75034f631d7e82ea1ea2a337" => :sierra
  end
  ```

* upload the generated `*.tar.gz` file to Google Cloud Storage

  ```
  gsutil cp *.bottle.tar.gz gs://homebrew-blendle
  ```

* commit the changed file to the Git repository

  ```
  git add Formula/<formula>.rb
  git commit
  git push
  ```
