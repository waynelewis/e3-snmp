## cmds

require snmp,1.0.0.1
require iocStats,1856ef5
#require autosave,5.9.0

epicsEnvSet(TOP, "$(E3_CMD_TOP)")

epicsEnvSet(P, "Raritan")
epicsEnvSet(R, "Pdu")
epicsEnvSet("IOC",  "$(P):$(R)")
epicsEnvSet("IOCST", "$(IOC):IocStats")

#dbLoadRecords("iocAdminSoft.db","IOC=${IOCST}")

epicsEnvSet("MIBDIRS", "+$(TOP)/mibs")
# MIB file Prefix
epicsEnvSet("M", "PDU2-MIB::")

#dbLoadRecords("db/snmpv2-mib.db",          "P=$(IOC):, HOST=10.0.6.58, COM=public, V2C=SNMP_VERSION_2c")
#dbLoadRecords("db/raritan-pdu-info.db",    "P=$(IOC):, HOST=10.0.6.58, COM=public, V2C=SNMP_VERSION_2c")
#dbLoadRecords("db/raritan-pdu-inlet.db",   "P=$(IOC):, HOST=10.0.6.58, COM=public, V2C=SNMP_VERSION_2c")
dbLoadRecords("raritan-pdu-extsensor.db", "P=$(IOC):, HOST=10.0.6.58, EXT_SENSOR_ID=1")
devSnmpSetDebug(2)
iocInit()

#dbl > "$(TOP)/$(IOC)-$(SYS)_PVs.list"


