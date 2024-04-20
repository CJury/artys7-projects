# artys7 project
Sandbox for artys7 projects using build tools from [f4pga][f4pga-link]

[f4pga-link]:https://f4pga.org/

## Install

To build the project first follow the instructions from <https://symbiflow-examples.readthedocs.io/en/latest/getting.html> for setting up the xc7 build environment.

Install the arch def for the spartan 7 family
```
	export INSTALL_DIR=~/opt/f4pga
	wget -qO- https://storage.googleapis.com/symbiflow-arch-defs/artifacts/prod/foss-fpga-tools/symbiflow-arch-defs/continuous/install/20220404-212755/symbiflow-arch-defs-xc7s50_test-afbfe04.tar.xz | tar -xJC $INSTALL_DIR/xc7/install
```

Currently the spartan7 arch defs only have the pinmap for the xc7s50fgga484-1 part, so for other spartan family devices will have to be generated manually from [f4pga-arch-defs][f4pga-arch-defs-link], and then copied to the f4pga install directory.

Currently [f4pga-arch-defs][f4pga-arch-defs-link] doesn't provide any instructions on how to do this and it requires some trawling through the build system to figure out, so providing the pinmap at least for xc7s50csga324-1 (which I'm using) here.

```
	cp pinmaps/xc7s50csga324-1.pinmap.csv "$INSTALL_DIR/xc7/share/f4pga/arch/xc7s50_test/xc7s50csga324-1/pinmap.csv"
```

[f4pga-arch-defs-link]:https://github.com/f4pga/f4pga-arch-defs.git

## Build

Enter the xc7 conda env

```
	source "$INSTALL_DIR/xc7/conda/etc/profile.d/conda.sh"
	conda activate xc7
```

And build something

```
	make -C counter/
```

To load on a device the download target is provided

```
	make -C counter/ download
```
