## cmds

require snmp,1.0.0
require iocStats,1856ef5
#require autosave,5.9.0

epicsEnvSet(TOP, "$(E3_CMD_TOP)")

epicsEnvSet(P, "Raritan")
epicsEnvSet(R, "PDU")
epicsEnvSet("IOC",  "$(P)-$(R)")
epicsEnvSet("IOCST", "$(IOC):IocStats")


dbLoadRecords("iocAdminSoft.db","IOC=${IOCST}")

epicsEnvSet("PDU1", "10.0.6.58")
epicsEnvSet("MIBDIRS", "+$(TOP)/../mibs")

devSnmpSetSnmpVersion("$(PDU1)","SNMP_VERSION_2c")

dbLoadRecords("raritan-PX3-5190R-ess.db", "PREFIX=$(IOC):, PDU_IP=$(PDU1)")

#devSnmpSetParam("DebugLevel",100)

iocInit()

dbl > "$(TOP)/$(IOC)_PVs.list"


