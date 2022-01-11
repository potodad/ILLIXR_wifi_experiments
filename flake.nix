{
  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.illixr-runtime =
    with import nixpkgs { system = "x86_64-linux"; };
    clangStdenv.mkDerivation {
      pname = "illixr-runtime";
      version = "2.2.1-latest";
      src = self;
      configurePhase = ''
        export NIX_FLAKES=ON
      '';
      buildPhase = ''
        mkdir -p $out/lib
        mkdir -p $out/bin
        mkdir -p $out/obj
        make -C $src/runtime main.dbg.exe
      '';
      installPhase = ''
        # So far the installation is handled by 'Makefile's,
        # but please keep this 'installPhase' and comments,
        # or please disable 'installPhase'.
      '';
      buildInputs = [
        libGL
        x11
        glew
        sqlite
        pkgconfig
        glfw
      ];
    };

    packages.x86_64-linux.illixr-plugin =
    with import nixpkgs { system = "x86_64-linux"; };
    clangStdenv.mkDerivation {
      pname = "illixr-plugin";
      version = "2.2.1-latest";
      src = self;
      configurePhase = ''
        export NIX_FLAKES=ON
      '';
      buildPhase = ''
        mkdir -p $out/lib
        mkdir -p $out/bin
        mkdir -p $out/obj
        make -C $src/runtime plugin.dbg.so
      '';
      installPhase = ''
        # So far the installation is handled by 'Makefile's,
        # but please keep this 'installPhase' and comments,
        # or please disable 'installPhase'.
      '';
      buildInputs = [
        libGL
        glew
        boost
        opencv3
        eigen
        glfw
        x11
      ];
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.illixr-runtime;
  };
}