export PATH="$PATH:/usr/local/bin"

# Setup Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

# Setup Cargo (Rust)
export PATH="$PATH:$HOME/.cargo/bin"

# Setup Flutter (Dart)
export PATH="$PATH:$HOME/Documents/flutter/bin"

# Setup Pip (Python)
export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# Setup Racer (Rust)
export PATH="$PATH:$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Setup RVM (Ruby)
export PATH="$PATH:$HOME/.rvm/bin"

# Setup NVM (Node.JS)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Setup Cabal (Haskell)
GHC_INSTALLS="$(dirname $(dirname $(dirname $(stack exec -- which ghc))))"
for ghc_install in $GHC_INSTALLS/ghc-*; do
    export PATH="$ghc_install/bin:$PATH"
done
export PATH="$HOME/.cabal/bin:$PATH"

# Setup Stack (Haskell)
export PATH="$PATH:$HOME/.local/bin"

# Setup pdf-tools (Emacs)
# See https://github.com/politza/pdf-tools#server-prerequisites
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# Setup makeinfo (Remacs)
# See https://github.com/Wilfred/remacs#getting-started.
export PATH="/usr/local/opt/texinfo/bin:$PATH"

# Setup Nix
export NIX_IGNORE_SYMLINK_STORE=1

# Setup OCaml
eval $(opam env)
