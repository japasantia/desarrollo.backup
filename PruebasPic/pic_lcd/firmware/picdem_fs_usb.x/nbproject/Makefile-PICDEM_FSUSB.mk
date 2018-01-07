#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-PICDEM_FSUSB.mk)" "nbproject/Makefile-local-PICDEM_FSUSB.mk"
include nbproject/Makefile-local-PICDEM_FSUSB.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PICDEM_FSUSB
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=--mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../src/leds.c ../../src/buttons.c ../../lcd_lib/AdafruitGfx.c ../../lcd_lib/glcdfont.c ../../lcd_lib/TftLcd.c ../../lcd_lib/TftLcdIO.c ../../lcd_lib/TftTouchScreen.c ../../src/usb_descriptors.c ../../src/usb_device.c ../../src/usb_device_cdc.c ../../src/usb_events.c system.c user_commands.c ../../src/app_device_cdc_basic.c ../../src/app_led_usb_status.c ../../src/main.c ../../src/adc.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1445274692/leds.p1 ${OBJECTDIR}/_ext/1445274692/buttons.p1 ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1 ${OBJECTDIR}/_ext/789052275/glcdfont.p1 ${OBJECTDIR}/_ext/789052275/TftLcd.p1 ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1 ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1 ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1 ${OBJECTDIR}/_ext/1445274692/usb_device.p1 ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1445274692/usb_events.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/user_commands.p1 ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1 ${OBJECTDIR}/_ext/1445274692/main.p1 ${OBJECTDIR}/_ext/1445274692/adc.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1445274692/leds.p1.d ${OBJECTDIR}/_ext/1445274692/buttons.p1.d ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1.d ${OBJECTDIR}/_ext/789052275/glcdfont.p1.d ${OBJECTDIR}/_ext/789052275/TftLcd.p1.d ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1.d ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1.d ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1.d ${OBJECTDIR}/_ext/1445274692/usb_device.p1.d ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1.d ${OBJECTDIR}/_ext/1445274692/usb_events.p1.d ${OBJECTDIR}/system.p1.d ${OBJECTDIR}/user_commands.p1.d ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1.d ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1.d ${OBJECTDIR}/_ext/1445274692/main.p1.d ${OBJECTDIR}/_ext/1445274692/adc.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1445274692/leds.p1 ${OBJECTDIR}/_ext/1445274692/buttons.p1 ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1 ${OBJECTDIR}/_ext/789052275/glcdfont.p1 ${OBJECTDIR}/_ext/789052275/TftLcd.p1 ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1 ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1 ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1 ${OBJECTDIR}/_ext/1445274692/usb_device.p1 ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1445274692/usb_events.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/user_commands.p1 ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1 ${OBJECTDIR}/_ext/1445274692/main.p1 ${OBJECTDIR}/_ext/1445274692/adc.p1

# Source Files
SOURCEFILES=../../src/leds.c ../../src/buttons.c ../../lcd_lib/AdafruitGfx.c ../../lcd_lib/glcdfont.c ../../lcd_lib/TftLcd.c ../../lcd_lib/TftLcdIO.c ../../lcd_lib/TftTouchScreen.c ../../src/usb_descriptors.c ../../src/usb_device.c ../../src/usb_device_cdc.c ../../src/usb_events.c system.c user_commands.c ../../src/app_device_cdc_basic.c ../../src/app_led_usb_status.c ../../src/main.c ../../src/adc.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-PICDEM_FSUSB.mk dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1445274692/leds.p1: ../../src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/leds.p1  ../../src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/leds.d ${OBJECTDIR}/_ext/1445274692/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/buttons.p1: ../../src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/buttons.p1  ../../src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/buttons.d ${OBJECTDIR}/_ext/1445274692/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1: ../../lcd_lib/AdafruitGfx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1  ../../lcd_lib/AdafruitGfx.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.d ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/glcdfont.p1: ../../lcd_lib/glcdfont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/glcdfont.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/glcdfont.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/glcdfont.p1  ../../lcd_lib/glcdfont.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/glcdfont.d ${OBJECTDIR}/_ext/789052275/glcdfont.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/glcdfont.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/TftLcd.p1: ../../lcd_lib/TftLcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcd.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcd.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/TftLcd.p1  ../../lcd_lib/TftLcd.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/TftLcd.d ${OBJECTDIR}/_ext/789052275/TftLcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/TftLcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/TftLcdIO.p1: ../../lcd_lib/TftLcdIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/TftLcdIO.p1  ../../lcd_lib/TftLcdIO.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/TftLcdIO.d ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1: ../../lcd_lib/TftTouchScreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1  ../../lcd_lib/TftTouchScreen.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.d ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1: ../../src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1  ../../src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.d ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_device.p1: ../../src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_device.p1  ../../src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_device.d ${OBJECTDIR}/_ext/1445274692/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1: ../../src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1  ../../src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.d ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_events.p1: ../../src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_events.p1  ../../src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_events.d ${OBJECTDIR}/_ext/1445274692/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/user_commands.p1: user_commands.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user_commands.p1.d 
	@${RM} ${OBJECTDIR}/user_commands.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/user_commands.p1  user_commands.c 
	@-${MV} ${OBJECTDIR}/user_commands.d ${OBJECTDIR}/user_commands.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/user_commands.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1: ../../src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1  ../../src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.d ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1: ../../src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1  ../../src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.d ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/main.p1: ../../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/main.p1  ../../src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/main.d ${OBJECTDIR}/_ext/1445274692/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/adc.p1: ../../src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/adc.p1  ../../src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/adc.d ${OBJECTDIR}/_ext/1445274692/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1445274692/leds.p1: ../../src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/leds.p1  ../../src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/leds.d ${OBJECTDIR}/_ext/1445274692/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/buttons.p1: ../../src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/buttons.p1  ../../src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/buttons.d ${OBJECTDIR}/_ext/1445274692/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1: ../../lcd_lib/AdafruitGfx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1  ../../lcd_lib/AdafruitGfx.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.d ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/AdafruitGfx.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/glcdfont.p1: ../../lcd_lib/glcdfont.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/glcdfont.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/glcdfont.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/glcdfont.p1  ../../lcd_lib/glcdfont.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/glcdfont.d ${OBJECTDIR}/_ext/789052275/glcdfont.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/glcdfont.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/TftLcd.p1: ../../lcd_lib/TftLcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcd.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcd.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/TftLcd.p1  ../../lcd_lib/TftLcd.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/TftLcd.d ${OBJECTDIR}/_ext/789052275/TftLcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/TftLcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/TftLcdIO.p1: ../../lcd_lib/TftLcdIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/TftLcdIO.p1  ../../lcd_lib/TftLcdIO.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/TftLcdIO.d ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/TftLcdIO.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1: ../../lcd_lib/TftTouchScreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/789052275" 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1.d 
	@${RM} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1  ../../lcd_lib/TftTouchScreen.c 
	@-${MV} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.d ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/789052275/TftTouchScreen.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1: ../../src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1  ../../src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.d ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_device.p1: ../../src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_device.p1  ../../src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_device.d ${OBJECTDIR}/_ext/1445274692/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1: ../../src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1  ../../src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.d ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/usb_events.p1: ../../src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/usb_events.p1  ../../src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/usb_events.d ${OBJECTDIR}/_ext/1445274692/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/user_commands.p1: user_commands.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user_commands.p1.d 
	@${RM} ${OBJECTDIR}/user_commands.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/user_commands.p1  user_commands.c 
	@-${MV} ${OBJECTDIR}/user_commands.d ${OBJECTDIR}/user_commands.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/user_commands.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1: ../../src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1  ../../src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.d ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1: ../../src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1  ../../src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.d ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/main.p1: ../../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/main.p1  ../../src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/main.d ${OBJECTDIR}/_ext/1445274692/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1445274692/adc.p1: ../../src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1445274692" 
	@${RM} ${OBJECTDIR}/_ext/1445274692/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1445274692/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1445274692/adc.p1  ../../src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/1445274692/adc.d ${OBJECTDIR}/_ext/1445274692/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1445274692/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"        $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  --double=32 --float=32 --emi=bytewrite --rom=default,-0-1FFF,-2006-2007,-2016-2017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"/media/jsars/74D0704FD0701996/PasantiaCendit/Desarrollo/PruebasPic/pic_lcd/src" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	@echo Normalizing hex file
	@"/opt/microchip/mplabx/v3.50/mplab_ide/platform/../mplab_ide/modules/../../bin/hexmate" --edf="/opt/microchip/mplabx/v3.50/mplab_ide/platform/../mplab_ide/modules/../../dat/en_msgs.txt" dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PICDEM_FSUSB
	${RM} -r dist/PICDEM_FSUSB

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
