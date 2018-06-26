## cmds

require snmp,1.0.0.1
require iocStats,1856ef5
#require autosave,5.9.0

epicsEnvSet(TOP, "$(E3_CMD_TOP)")

epicsEnvSet(P, "Raritan")
epicsEnvSet(R, "PDU")
epicsEnvSet("IOC",  "$(P)-$(R)")
epicsEnvSet("IOCST", "$(IOC):IocStats")


dbLoadRecords("iocAdminSoft.db","IOC=${IOCST}")

devSnmpSetSnmpVersion("10.0.6.58","SNMP_VERSION_2c")

epicsEnvSet("MIBDIRS", "+$(TOP)/../mibs")
# MIB file Prefix
epicsEnvSet("M", "PDU2-MIB::")

dbLoadRecords("$(TOP)/../template/raritan-pdu-info.template"        "P=$(IOC):, HOST=10.0.6.58")
dbLoadRecords("$(TOP)/../template/raritan-pdu-inlet.template",      "P=$(IOC):, HOST=10.0.6.58")
dbLoadRecords("$(TOP)/../template/raritan-pdu-extsensor.template" , "P=$(IOC):, HOST=10.0.6.58, EXT_SENSOR_ID=1")

#devSnmpSetParam("DebugLevel",100)

iocInit()

dbl > "$(TOP)/$(IOC)_PVs.list"


