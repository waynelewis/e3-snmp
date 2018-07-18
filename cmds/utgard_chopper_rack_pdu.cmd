## cmds

require snmp,1.0.0
require iocStats,1856ef5
#require autosave,5.9.0

epicsEnvSet(TOP, "$(E3_CMD_TOP)")

epicsEnvSet(P, "LabS-Utgard-VIP:Rack-Chopper")
epicsEnvSet(R, "PDU")
epicsEnvSet("IOC",  "$(P)-$(R)")
epicsEnvSet("IOCST", "$(IOC):IocStats")


dbLoadRecords("iocAdminSoft.db","IOC=${IOCST}")

epicsEnvSet("MIBDIRS", "+$(TOP)/../mibs")
epicsEnvSet("DB_TOP", "$(TOP)/../template/")

devSnmpSetSnmpVersion("10.4.0.121","SNMP_VERSION_2c")

# MIB file Prefix
epicsEnvSet("PDU1", "10.4.0.121")

dbLoadTemplate("$(DB_TOP)/raritan-PX3-5190R-ess.substitutions", "PREFIX=$(IOC):, PDU_IP=$(PDU1)")

#devSnmpSetParam("DebugLevel",100)

iocInit()

dbl > "$(TOP)/$(IOC)_PVs.list"


