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

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../demo_src/buttons.c ../../demo_src/leds.c ../../demo_src/usb_descriptors.c ../../demo_src/usb_device.c ../../demo_src/usb_device_cdc.c ../../demo_src/usb_events.c system.c ../../demo_src/main.c ../../demo_src/app_device_cdc_basic.c ../../demo_src/app_led_usb_status.c ../../demo_src/adc.c user_commands.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/319695064/buttons.p1 ${OBJECTDIR}/_ext/319695064/leds.p1 ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1 ${OBJECTDIR}/_ext/319695064/usb_device.p1 ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1 ${OBJECTDIR}/_ext/319695064/usb_events.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/_ext/319695064/main.p1 ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1 ${OBJECTDIR}/_ext/319695064/adc.p1 ${OBJECTDIR}/user_commands.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/319695064/buttons.p1.d ${OBJECTDIR}/_ext/319695064/leds.p1.d ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1.d ${OBJECTDIR}/_ext/319695064/usb_device.p1.d ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1.d ${OBJECTDIR}/_ext/319695064/usb_events.p1.d ${OBJECTDIR}/system.p1.d ${OBJECTDIR}/_ext/319695064/main.p1.d ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1.d ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1.d ${OBJECTDIR}/_ext/319695064/adc.p1.d ${OBJECTDIR}/user_commands.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/319695064/buttons.p1 ${OBJECTDIR}/_ext/319695064/leds.p1 ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1 ${OBJECTDIR}/_ext/319695064/usb_device.p1 ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1 ${OBJECTDIR}/_ext/319695064/usb_events.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/_ext/319695064/main.p1 ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1 ${OBJECTDIR}/_ext/319695064/adc.p1 ${OBJECTDIR}/user_commands.p1

# Source Files
SOURCEFILES=../../demo_src/buttons.c ../../demo_src/leds.c ../../demo_src/usb_descriptors.c ../../demo_src/usb_device.c ../../demo_src/usb_device_cdc.c ../../demo_src/usb_events.c system.c ../../demo_src/main.c ../../demo_src/app_device_cdc_basic.c ../../demo_src/app_led_usb_status.c ../../demo_src/adc.c user_commands.c


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
${OBJECTDIR}/_ext/319695064/buttons.p1: ../../demo_src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/buttons.p1  ../../demo_src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/buttons.d ${OBJECTDIR}/_ext/319695064/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/leds.p1: ../../demo_src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/leds.p1  ../../demo_src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/leds.d ${OBJECTDIR}/_ext/319695064/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_descriptors.p1: ../../demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_descriptors.p1  ../../demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_descriptors.d ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_device.p1: ../../demo_src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_device.p1  ../../demo_src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_device.d ${OBJECTDIR}/_ext/319695064/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1: ../../demo_src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1  ../../demo_src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.d ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_events.p1: ../../demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_events.p1  ../../demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_events.d ${OBJECTDIR}/_ext/319695064/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/main.p1: ../../demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/main.p1  ../../demo_src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/main.d ${OBJECTDIR}/_ext/319695064/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1: ../../demo_src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1  ../../demo_src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.d ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1: ../../demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1  ../../demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.d ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/adc.p1: ../../demo_src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/adc.p1  ../../demo_src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/adc.d ${OBJECTDIR}/_ext/319695064/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/user_commands.p1: user_commands.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user_commands.p1.d 
	@${RM} ${OBJECTDIR}/user_commands.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/user_commands.p1  user_commands.c 
	@-${MV} ${OBJECTDIR}/user_commands.d ${OBJECTDIR}/user_commands.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/user_commands.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/319695064/buttons.p1: ../../demo_src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/buttons.p1  ../../demo_src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/buttons.d ${OBJECTDIR}/_ext/319695064/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/leds.p1: ../../demo_src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/leds.p1  ../../demo_src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/leds.d ${OBJECTDIR}/_ext/319695064/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_descriptors.p1: ../../demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_descriptors.p1  ../../demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_descriptors.d ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_device.p1: ../../demo_src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_device.p1  ../../demo_src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_device.d ${OBJECTDIR}/_ext/319695064/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1: ../../demo_src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1  ../../demo_src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.d ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/usb_events.p1: ../../demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/usb_events.p1  ../../demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/usb_events.d ${OBJECTDIR}/_ext/319695064/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/main.p1: ../../demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/main.p1  ../../demo_src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/main.d ${OBJECTDIR}/_ext/319695064/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1: ../../demo_src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1  ../../demo_src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.d ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1: ../../demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1  ../../demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.d ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/319695064/adc.p1: ../../demo_src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/319695064" 
	@${RM} ${OBJECTDIR}/_ext/319695064/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/319695064/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/319695064/adc.p1  ../../demo_src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/319695064/adc.d ${OBJECTDIR}/_ext/319695064/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/319695064/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/user_commands.p1: user_commands.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user_commands.p1.d 
	@${RM} ${OBJECTDIR}/user_commands.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib $(COMPARISON_BUILD)  --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/user_commands.p1  user_commands.c 
	@-${MV} ${OBJECTDIR}/user_commands.d ${OBJECTDIR}/user_commands.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/user_commands.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=none  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"        $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  --double=32 --float=32 --emi=bytewrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=-asm,-asmfile,-speed,+space,-debug,-local --addrqual=require --mode=pro -P -N255 -I"../../demo_src" -I"/home/jsars/PruebasPic/cdc_basic/firmware/picdem_fs_usb.x" --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,-init,-keep,-no_startup,-download,-config,-clib,+plib --output=+mcof,-elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	@echo Normalizing hex file
	@"/opt/microchip/mplabx/v4.05/mplab_ide/platform/../mplab_ide/modules/../../bin/hexmate" --edf="/opt/microchip/mplabx/v4.05/mplab_ide/platform/../mplab_ide/modules/../../dat/en_msgs.txt" dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex

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
