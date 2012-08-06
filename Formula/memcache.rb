require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Memcache < Formula
  homepage 'http://pecl.php.net/package/memcache/2.2.6'
  url 'http://pecl.php.net/get/memcache-2.2.6.tgz'
  sha1 'be0b12fa09ed127dc35c0da29a576a9112be1bde'
  version "2.2.6"

  # required by phpize
  depends_on 'autoconf'

  def install
    cd "memcache-#{version}" do
      system "phpize"
      system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
      system "make"
      prefix.install "modules/memcache.so"
    end
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test memcache`.
    system "ls #{prefix}/memcache.so"
  end

  def caveats; <<-EOS.undent
    To use this software:
      * Add the following line to php.ini:
      * extension="#{prefix}/memcache.so"
      * Restart your webserver.
      * Write a PHP page that calls "phpinfo();"
      * Load it in a browser and look for the info on the memcache module.
      * If you see it, you have been successful!
    EOS
  end
end
