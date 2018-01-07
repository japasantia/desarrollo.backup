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
ifeq "$(wildcard nbproject/Makefile-local-BasicCDC.mk)" "nbproject/Makefile-local-BasicCDC.mk"
include nbproject/Makefile-local-BasicCDC.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=BasicCDC
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

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/leds.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/buttons.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_descriptors.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_events.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device_cdc.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device.c system.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_led_usb_status.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_device_cdc_basic.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/main.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/adc.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/898845853/leds.p1 ${OBJECTDIR}/_ext/898845853/buttons.p1 ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1 ${OBJECTDIR}/_ext/898845853/usb_events.p1 ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1 ${OBJECTDIR}/_ext/898845853/usb_device.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1 ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/898845853/main.p1 ${OBJECTDIR}/_ext/898845853/adc.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/898845853/leds.p1.d ${OBJECTDIR}/_ext/898845853/buttons.p1.d ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1.d ${OBJECTDIR}/_ext/898845853/usb_events.p1.d ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1.d ${OBJECTDIR}/_ext/898845853/usb_device.p1.d ${OBJECTDIR}/system.p1.d ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1.d ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1.d ${OBJECTDIR}/_ext/898845853/main.p1.d ${OBJECTDIR}/_ext/898845853/adc.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/898845853/leds.p1 ${OBJECTDIR}/_ext/898845853/buttons.p1 ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1 ${OBJECTDIR}/_ext/898845853/usb_events.p1 ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1 ${OBJECTDIR}/_ext/898845853/usb_device.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1 ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/898845853/main.p1 ${OBJECTDIR}/_ext/898845853/adc.p1

# Source Files
SOURCEFILES=C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/leds.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/buttons.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_descriptors.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_events.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device_cdc.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device.c system.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_led_usb_status.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_device_cdc_basic.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/main.c C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/adc.c


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
	${MAKE}  -f nbproject/Makefile-BasicCDC.mk dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/898845853/leds.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/leds.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/leds.d ${OBJECTDIR}/_ext/898845853/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/buttons.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/buttons.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/buttons.d ${OBJECTDIR}/_ext/898845853/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_descriptors.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_descriptors.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_descriptors.d ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_events.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_events.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_events.d ${OBJECTDIR}/_ext/898845853/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.d ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_device.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_device.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_device.d ${OBJECTDIR}/_ext/898845853/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.d ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.d ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/main.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/main.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/main.d ${OBJECTDIR}/_ext/898845853/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/adc.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/adc.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/adc.d ${OBJECTDIR}/_ext/898845853/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/898845853/leds.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/leds.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/leds.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/leds.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/leds.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/leds.d ${OBJECTDIR}/_ext/898845853/leds.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/leds.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/buttons.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/buttons.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/buttons.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/buttons.d ${OBJECTDIR}/_ext/898845853/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_descriptors.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_descriptors.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_descriptors.d ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_events.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_events.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_events.d ${OBJECTDIR}/_ext/898845853/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.d ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/usb_device.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/usb_device.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/usb_device.d ${OBJECTDIR}/_ext/898845853/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.d ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.d ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/main.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/main.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/main.d ${OBJECTDIR}/_ext/898845853/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/898845853/adc.p1: C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/898845853" 
	@${RM} ${OBJECTDIR}/_ext/898845853/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/898845853/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/898845853/adc.p1  C:/PruebasProgramas/Pic/SystemPic18.X/cdc_basic/demo_src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/898845853/adc.d ${OBJECTDIR}/_ext/898845853/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/898845853/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"       --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	@echo Normalizing hex file
	@"C:/Program Files (x86)/Microchip/MPLABX/v3.20/mplab_ide/mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files (x86)/Microchip/MPLABX/v3.20/mplab_ide/mplab_ide/modules/../../dat/en_msgs.txt" dist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex -odist/${CND_CONF}/${IMAGE_TYPE}/picdem_fs_usb.x.${IMAGE_TYPE}.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/BasicCDC
	${RM} -r dist/BasicCDC

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
