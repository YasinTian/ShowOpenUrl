ARCHS = arm64
THEOS_DEVICE_IP = 192.168.5.237

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = showOpenUrl
showOpenUrl_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
