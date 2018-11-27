
#epicsEnvSet("DB_TOP", "$(SNMP_CMD_TOP)/../template/")
epicsEnvSet("MIBDIRS", "+$(SNMP_CMD_TOP)/../mibs/")
devSnmpSetSnmpVersion("PDU_IP","SNMP_VERSION_2c")
#dbLoadTemplate("$(DB_TOP)/raritan-PX3-5190R-ess.substitutions", "PREFIX=$(IOC):, PDU_IP=$(PDU_IP),RACK=$(RACK),PDU=$(PDU)")
dbLoadRecords("raritan-PX3-5190R-ess.db", "PREFIX=$(IOC):, PDU_IP=$(PDU_IP),RACK=$(RACK),PDU=$(PDU)")

