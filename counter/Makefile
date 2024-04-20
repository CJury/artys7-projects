
PART := xc7s50csga324-1
DEVICE_TYPE := spartan7
DEVICE := xc7s50_test
BOARD := arty_s7_50

# BUILD_DIR := "./build/$(PART)"
BUILD_DIR := $(CURDIR)/build/$(PART)

SRC_DIR := "$(CURDIR)"

TOP := top

all: write_bitstream

$(BUILD_DIR)/.synth: counter.v artys7.xdc
	mkdir -p $(BUILD_DIR)
	cd "$(BUILD_DIR)" && symbiflow_synth -t $(TOP) -v "$(SRC_DIR)"/counter.v -d "$(DEVICE_TYPE)" -p "$(PART)" -x "$(SRC_DIR)"/artys7.xdc
	touch $@

$(BUILD_DIR)/.pack: $(BUILD_DIR)/.synth
	cd $(BUILD_DIR) && symbiflow_pack -e $(TOP).eblif -d $(DEVICE)
	touch $@

$(BUILD_DIR)/.place: $(BUILD_DIR)/.pack
	cd $(BUILD_DIR) && symbiflow_place -e $(TOP).eblif -d $(DEVICE)  -n $(TOP).net -P $(PART)
	touch $@

$(BUILD_DIR)/.route: $(BUILD_DIR)/.place
	cd $(BUILD_DIR) && symbiflow_route -e $(TOP).eblif -d $(DEVICE)
	touch $@

$(BUILD_DIR)/.fasm: $(BUILD_DIR)/.route
	cd $(BUILD_DIR) && symbiflow_write_fasm -e $(TOP).eblif -d $(DEVICE)
	touch $@

$(BUILD_DIR)/.bitstream: $(BUILD_DIR)/.fasm
	cd $(BUILD_DIR) && symbiflow_write_bitstream -d $(DEVICE_TYPE) -f $(TOP).fasm -p $(PART) -b $(TOP).bit
	touch $@

clean:
	rm -rf $(BUILD_DIR)

synth: $(BUILD_DIR)/.synth

pack: $(BUILD_DIR)/.pack

place: $(BUILD_DIR)/.place

route: $(BUILD_DIR)/.route

write_fasm: $(BUILD_DIR)/.fasm

write_bitstream: $(BUILD_DIR)/.bitstream

download:
	openFPGALoader -b $(BOARD) $(BUILD_DIR)/$(TOP).bit

.PHONY: all synth pack place route write_fasm write_bitstream clean test download
