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
epicsEnvSet("SNMP_USER", "public")
epicsEnvSet("USER_R", "$(SNMP_USER)")
epicsEnvSet("USER_W", "guru")
epicsEnvSet("PDU1", "10.0.6.58")

dbLoadRecords("$(TOP)/../template/raritan-pdu-info.template"         "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1)")
dbLoadRecords("$(TOP)/../template/raritan-pdu-inlet.template",       "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1)")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=1")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=2")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=3")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=4")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=5")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=6")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=7")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet.template",      "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), OUTLET_ID=8")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=1")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=2")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=3")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=4")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=5")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=6")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=7")
dbLoadRecords("$(TOP)/../template/raritan-pdu-outlet-ctrl.template", "P=$(IOC):, USER=$(USER_W), HOST=$(PDU1), OUTLET_ID=8")
dbLoadRecords("$(TOP)/../template/raritan-pdu-extsensor.template" ,  "P=$(IOC):, USER=$(USER_R), HOST=$(PDU1), EXT_SENSOR_ID=1")


#devSnmpSetParam("DebugLevel",100)

iocInit()

dbl > "$(TOP)/$(IOC)_PVs.list"


