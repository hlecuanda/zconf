INSTALL = install
INSTALL_DATA = $(INSTALL) -m 644
I3CONFIG_DIR = $(HOME)/.config/i3
I3CONFIG     = $(I3CONFIG_DIR)/config
I3STATUS_DIR = $(HOME)/.config/i3status
I3STATUS     = $(I3STATUS_DIR)/config

.PHONY                          : install changes

install                         : i3config i3status

changes                         :
	cp -afv $(I3CONFIG) i3.config
	cp -afv $(I3STATUS) i3status.config
	git add .
	git commit -m "Changes from $$(date +%Y%m%d)"
	git fetch

i3config                        : $(I3CONFIG)

i3status                        : $(I3STATUS)

$(I3CONFIG)                     : i3.config | $(I3CONFIG_DIR)
	$(INSTALL_DATA) $< $@

$(I3STATUS)                     : i3status.config | $(I3STATUS_DIR)
	$(INSTALL_DATA) $< $@

$(I3CONFIG_DIR) $(I3STATUS_DIR) :
	mkdir -pv $@
