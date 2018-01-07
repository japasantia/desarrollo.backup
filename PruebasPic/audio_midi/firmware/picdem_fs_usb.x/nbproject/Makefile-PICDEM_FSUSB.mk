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
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
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
SOURCEFILES_QUOTED_IF_SPACED=../demo_src/buttons.c ../demo_src/leds.c ../demo_src/usb_descriptors.c ../demo_src/usb_events.c ../demo_src/usb_device.c ../demo_src/app_device_audio_midi.c ../demo_src/app_led_usb_status.c ../demo_src/main.c ../demo_src/adc.c ../demo_src/system.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/300881143/buttons.p1 ${OBJECTDIR}/_ext/300881143/leds.p1 ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1 ${OBJECTDIR}/_ext/300881143/usb_events.p1 ${OBJECTDIR}/_ext/300881143/usb_device.p1 ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1 ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1 ${OBJECTDIR}/_ext/300881143/main.p1 ${OBJECTDIR}/_ext/300881143/adc.p1 ${OBJECTDIR}/_ext/300881143/system.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/300881143/buttons.p1.d ${OBJECTDIR}/_ext/300881143/leds.p1.d ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1.d ${OBJECTDIR}/_ext/300881143/usb_events.p1.d ${OBJECTDIR}/_ext/300881143/usb_device.p1.d ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1.d ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1.d ${OBJECTDIR}/_ext/300881143/main.p1.d ${OBJECTDIR}/_ext/300881143/adc.p1.d ${OBJECTDIR}/_ext/300881143/system.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/300881143/buttons.p1 ${OBJECTDIR}/_ext/300881143/leds.p1 ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1 ${OBJECTDIR}/_ext/300881143/usb_events.p1 ${OBJECTDIR}/_ext/300881143/usb_device.p1 ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1 ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1 ${OBJECTDIR}/_ext/300881143/main.p1 ${OBJECTDIR}/_ext/300881143/adc.p1 ${OBJECTDIR}/_ext/300881143/system.p1

# Source Files
SOURCEFILES=../demo_src/buttons.c ../demo_src/leds.c ../demo_src/usb_descriptors.c ../demo_src/usb_events.c ../demo_src/usb_device.c ../demo_src/app_device_audio_midi.c ../demo_src/app_led_usb_status.c ../demo_src/main.c ../demo_src/adc.c ../demo_src/system.c


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
${OBJECTDIR}/_ext/300881143/buttons.p1: ../demo_src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/buttons.p1  ../demo_src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/buttons.d ${OBJECTDIR}/_ext/300881143/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/leds.p1: ../demo_src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/leds.p1  ../demo_src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/leds.d ${OBJECTDIR}/_ext/300881143/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/usb_descriptors.p1: ../demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/usb_descriptors.p1  ../demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/usb_descriptors.d ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/usb_events.p1: ../demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/usb_events.p1  ../demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/usb_events.d ${OBJECTDIR}/_ext/300881143/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/usb_device.p1: ../demo_src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/usb_device.p1  ../demo_src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/usb_device.d ${OBJECTDIR}/_ext/300881143/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1: ../demo_src/app_device_audio_midi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1  ../demo_src/app_device_audio_midi.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.d ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1: ../demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1  ../demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.d ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/main.p1: ../demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/main.p1  ../demo_src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/main.d ${OBJECTDIR}/_ext/300881143/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/adc.p1: ../demo_src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/adc.p1  ../demo_src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/adc.d ${OBJECTDIR}/_ext/300881143/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/system.p1: ../demo_src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/system.p1  ../demo_src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/system.d ${OBJECTDIR}/_ext/300881143/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/300881143/buttons.p1: ../demo_src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/buttons.p1  ../demo_src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/buttons.d ${OBJECTDIR}/_ext/300881143/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/leds.p1: ../demo_src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/leds.p1  ../demo_src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/leds.d ${OBJECTDIR}/_ext/300881143/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/usb_descriptors.p1: ../demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/usb_descriptors.p1  ../demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/usb_descriptors.d ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/usb_events.p1: ../demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/usb_events.p1  ../demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/usb_events.d ${OBJECTDIR}/_ext/300881143/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/usb_device.p1: ../demo_src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/usb_device.p1  ../demo_src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/usb_device.d ${OBJECTDIR}/_ext/300881143/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1: ../demo_src/app_device_audio_midi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1  ../demo_src/app_device_audio_midi.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.d ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/app_device_audio_midi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1: ../demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1  ../demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.d ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/main.p1: ../demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/main.p1  ../demo_src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/main.d ${OBJECTDIR}/_ext/300881143/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/adc.p1: ../demo_src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/adc.p1  ../demo_src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/adc.d ${OBJECTDIR}/_ext/300881143/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/300881143/system.p1: ../demo_src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/300881143" 
	@${RM} ${OBJECTDIR}/_ext/300881143/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/300881143/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/300881143/system.p1  ../demo_src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/300881143/system.d ${OBJECTDIR}/_ext/300881143/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/300881143/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=icd3  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     --rom=default,-7dc0-7fff --ram=default,-3f4-3ff,-f9c-f9c,-fd4-fd4,-fdb-fdf,-fe3-fe7,-feb-fef,-ffd-fff  $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --rom=default,-0-FFF,-1006-1007,-1016-1017 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=pro -P -N255 -I"../demo_src" -I"." --warn=0 --asmlist -DXPRJ_PICDEM_FSUSB=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x2000 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
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
