-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.

CREATE TABLE AccountPolicy (id VARCHAR(36) NOT NULL, description VARCHAR(255), maxAuthenticationAttempts INTEGER, propagateSuspension INTEGER, PRIMARY KEY (id));
CREATE TABLE AccountPolicy_ExternalResource (accountPolicy_id VARCHAR(36), resource_id VARCHAR(255));
CREATE TABLE AccountRuleConfInstance (id VARCHAR(36) NOT NULL, serializedInstance CLOB, ACCOUNTPOLICY_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE ADynGroupMembership (id VARCHAR(36) NOT NULL, fiql VARCHAR(255), GROUP_ID VARCHAR(36), ANYTYPE_ID VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE ADynGroupMembership_AnyObject (aDynGroupMembership_id VARCHAR(36), anyObject_id VARCHAR(36));
CREATE TABLE AMembership (id VARCHAR(36) NOT NULL, anyObject_id VARCHAR(36), group_id VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE AnyAbout (id VARCHAR(36) NOT NULL, filter CLOB, ANYTYPE_ID VARCHAR(255), NOTIFICATION_ID VARCHAR(36), PRIMARY KEY (id), CONSTRAINT U_NYABOUT_NOTIFICATION_ID UNIQUE (NOTIFICATION_ID, ANYTYPE_ID));
CREATE TABLE AnyObject (id VARCHAR(36) NOT NULL, creationDate TIMESTAMP NOT NULL, creator VARCHAR(255) NOT NULL, lastChangeDate TIMESTAMP NOT NULL, lastModifier VARCHAR(255) NOT NULL, status VARCHAR(255), workflowId VARCHAR(255), REALM_ID VARCHAR(36), TYPE_ID VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE AnyObject_AnyTypeClass (anyObject_id VARCHAR(36), anyTypeClass_id VARCHAR(255));
CREATE TABLE AnyObject_ExternalResource (anyObject_id VARCHAR(36), resource_id VARCHAR(255));
CREATE TABLE AnyTemplatePullTask (id VARCHAR(36) NOT NULL, template CLOB, PULLTASK_ID VARCHAR(36), ANYTYPE_ID VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_NYTMTSK_PULLTASK_ID UNIQUE (PULLTASK_ID, ANYTYPE_ID));
CREATE TABLE AnyTemplateRealm (id VARCHAR(36) NOT NULL, template CLOB, REALM_ID VARCHAR(36), ANYTYPE_ID VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_NYTMRLM_REALM_ID UNIQUE (REALM_ID, ANYTYPE_ID));
CREATE TABLE AnyType (id VARCHAR(255) NOT NULL, kind VARCHAR(20), PRIMARY KEY (id));
CREATE TABLE AnyTypeClass (id VARCHAR(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE AnyType_AnyTypeClass (anyType_id VARCHAR(255), anyTypeClass_id VARCHAR(255));
CREATE TABLE APlainAttr (id VARCHAR(36) NOT NULL, OWNER_ID VARCHAR(36), schema_id VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE APlainAttrUniqueValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), schema_id VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_PLNTQVL_BOOLEANVALUE1 UNIQUE (booleanValue, schema_id), CONSTRAINT U_PLNTQVL_DATEVALUE1 UNIQUE (dateValue, schema_id), CONSTRAINT U_PLNTQVL_STRINGVALUE1 UNIQUE (stringValue, schema_id), CONSTRAINT U_PLNTQVL_DOUBLEVALUE1 UNIQUE (doubleValue, schema_id), CONSTRAINT U_PLNTQVL_LONGVALUE1 UNIQUE (longValue, schema_id));
CREATE TABLE APlainAttrValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE ARelationship (id VARCHAR(36) NOT NULL, left_anyObject_id VARCHAR(36), right_anyObject_id VARCHAR(36), TYPE_ID VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_RLTNSHP_TYPE_ID1 UNIQUE (TYPE_ID, left_anyObject_id, right_anyObject_id));
CREATE TABLE ConnInstance (id VARCHAR(36) NOT NULL, bundleName VARCHAR(255), connRequestTimeout INTEGER, connectorName VARCHAR(255), displayName VARCHAR(255), jsonConf CLOB, location VARCHAR(255), version VARCHAR(255), maxIdle INTEGER, maxObjects INTEGER, maxWait BIGINT, minEvictableIdleTimeMillis BIGINT, minIdle INTEGER, PRIMARY KEY (id), CONSTRAINT U_CNNNTNC_DISPLAYNAME UNIQUE (displayName));
CREATE TABLE ConnInstance_capabilities (connInstance_id VARCHAR(36), capability VARCHAR(20));
CREATE TABLE CPlainAttr (id VARCHAR(36) NOT NULL, schema_id VARCHAR(255), OWNER_ID VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE CPlainAttrUniqueValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), schema_id VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_CPLNQVL_BOOLEANVALUE UNIQUE (booleanValue, schema_id), CONSTRAINT U_CPLNQVL_DATEVALUE UNIQUE (dateValue, schema_id), CONSTRAINT U_CPLNQVL_STRINGVALUE UNIQUE (stringValue, schema_id), CONSTRAINT U_CPLNQVL_DOUBLEVALUE UNIQUE (doubleValue, schema_id), CONSTRAINT U_CPLNQVL_LONGVALUE UNIQUE (longValue, schema_id));
CREATE TABLE CPlainAttrValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE DerSchema (id VARCHAR(255) NOT NULL, expression VARCHAR(255), ANYTYPECLASS_ID VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE DynRoleMembership (id VARCHAR(36) NOT NULL, fiql VARCHAR(255), ROLE_ID VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE DynRoleMembership_User (dynRoleMembership_id VARCHAR(36), user_id VARCHAR(36));
CREATE TABLE ExternalResource (id VARCHAR(255) NOT NULL, createTraceLevel VARCHAR(20), deleteTraceLevel VARCHAR(20), enforceMandatoryCondition INTEGER, jsonConf CLOB, overrideCapabilities INTEGER, propagationPriority INTEGER, pullTraceLevel VARCHAR(20), randomPwdIfNotProvided INTEGER, updateTraceLevel VARCHAR(20), ACCOUNTPOLICY_ID VARCHAR(36), CONNECTOR_ID VARCHAR(36), PASSWORDPOLICY_ID VARCHAR(36), PULLPOLICY_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE ExternalResource_capOverride (resource_id VARCHAR(255), capabilityOverride VARCHAR(20));
CREATE TABLE ExternalResource_PropActions (resource_id VARCHAR(255), actionClassName VARCHAR(255));
CREATE TABLE GPlainAttr (id VARCHAR(36) NOT NULL, schema_id VARCHAR(255), OWNER_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE GPlainAttrUniqueValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), schema_id VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_GPLNQVL_BOOLEANVALUE UNIQUE (booleanValue, schema_id), CONSTRAINT U_GPLNQVL_DATEVALUE UNIQUE (dateValue, schema_id), CONSTRAINT U_GPLNQVL_STRINGVALUE UNIQUE (stringValue, schema_id), CONSTRAINT U_GPLNQVL_DOUBLEVALUE UNIQUE (doubleValue, schema_id), CONSTRAINT U_GPLNQVL_LONGVALUE UNIQUE (longValue, schema_id));
CREATE TABLE GPlainAttrValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE MailTemplate (id VARCHAR(255) NOT NULL, htmlTemplate CLOB, textTemplate CLOB, PRIMARY KEY (id));
CREATE TABLE Mapping (id VARCHAR(36) NOT NULL, connObjectLink VARCHAR(255), PROVISION_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE MappingItem (id VARCHAR(36) NOT NULL, connObjectKey INTEGER, extAttrName VARCHAR(255), intAttrName VARCHAR(255), intMappingType VARCHAR(22), mandatoryCondition VARCHAR(255), password INTEGER, purpose VARCHAR(20), MAPPING_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE MappingItem_Transformer (mappingItem_id VARCHAR(36), transformerClassName VARCHAR(255));
CREATE TABLE Notification (id VARCHAR(36) NOT NULL, active INTEGER, recipientAttrName VARCHAR(255), recipientAttrType VARCHAR(22), recipientsFIQL VARCHAR(255), recipientsProviderClassName VARCHAR(255), selfAsRecipient INTEGER, sender VARCHAR(255), subject VARCHAR(255), traceLevel VARCHAR(20), template_id VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE NotificationTask_recipients (notificationTask_id VARCHAR(36), address VARCHAR(255));
CREATE TABLE Notification_events (notification_id VARCHAR(36), event VARCHAR(255));
CREATE TABLE Notification_staticRecipients (notification_id VARCHAR(36), staticRecipients VARCHAR(255));
CREATE TABLE PasswordPolicy (id VARCHAR(36) NOT NULL, description VARCHAR(255), allowNullPassword INTEGER, historyLength INTEGER, PRIMARY KEY (id));
CREATE TABLE PasswordRuleConfInstance (id VARCHAR(36) NOT NULL, serializedInstance CLOB, PASSWORDPOLICY_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE PlainSchema (id VARCHAR(255) NOT NULL, cipherAlgorithm VARCHAR(20), conversionPattern VARCHAR(255), enumerationKeys CLOB, enumerationValues CLOB, mandatoryCondition VARCHAR(255), mimeType VARCHAR(255), multivalue INTEGER, readonly INTEGER, secretKey VARCHAR(255), type VARCHAR(20), uniqueConstraint INTEGER, validatorClass VARCHAR(255), ANYTYPECLASS_ID VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE Provision (id VARCHAR(36) NOT NULL, objectClass VARCHAR(255), serializedSyncToken CLOB, RESOURCE_ID VARCHAR(255), ANYTYPE_ID VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_PROVSON_RESOURCE_ID UNIQUE (RESOURCE_ID, ANYTYPE_ID));
CREATE TABLE Provision_AnyTypeClass (provision_id VARCHAR(36), anyTypeClass_id VARCHAR(255));
CREATE TABLE PullPolicy (id VARCHAR(36) NOT NULL, description VARCHAR(255), specification CLOB, PRIMARY KEY (id));
CREATE TABLE PullTask_actionsClassNames (pullTask_id VARCHAR(36), actionClassName VARCHAR(255));
CREATE TABLE PushPolicy (id VARCHAR(36) NOT NULL, description VARCHAR(255), specification CLOB, PRIMARY KEY (id));
CREATE TABLE PushTaskAnyFilter (id VARCHAR(36) NOT NULL, fiql VARCHAR(255), ANYTYPE_ID VARCHAR(255), PUSHTASK_ID VARCHAR(36), PRIMARY KEY (id), CONSTRAINT U_PSHTLTR_PUSHTASK_ID UNIQUE (PUSHTASK_ID, ANYTYPE_ID));
CREATE TABLE PushTask_actionsClassNames (pushTask_key VARCHAR(36), actionClassName VARCHAR(255));
CREATE TABLE Realm (id VARCHAR(36) NOT NULL, name VARCHAR(255), ACCOUNTPOLICY_ID VARCHAR(36), PARENT_ID VARCHAR(36), PASSWORDPOLICY_ID VARCHAR(36), PRIMARY KEY (id), CONSTRAINT U_REALM_ID UNIQUE (id, PARENT_ID));
CREATE TABLE Realm_actionsClassNames (realm_key VARCHAR(36), actionClassName VARCHAR(255));
CREATE TABLE RelationshipType (id VARCHAR(255) NOT NULL, description VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE Report (id VARCHAR(36) NOT NULL, active INTEGER, cronExpression VARCHAR(255), name VARCHAR(255) NOT NULL, template_id VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_REPORT_NAME UNIQUE (name));
CREATE TABLE ReportExec (id VARCHAR(36) NOT NULL, endDate TIMESTAMP, message CLOB, startDate TIMESTAMP, status VARCHAR(255), execResult BLOB, REPORT_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE ReportletConfInstance (id VARCHAR(36) NOT NULL, serializedInstance CLOB, REPORT_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE ReportTemplate (id VARCHAR(255) NOT NULL, csvTemplate CLOB, foTemplate CLOB, htmlTemplate CLOB, PRIMARY KEY (id));
CREATE TABLE SecurityQuestion (id VARCHAR(36) NOT NULL, content VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_SCRTSTN_CONTENT UNIQUE (content));
CREATE TABLE SyncopeConf (id VARCHAR(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE SyncopeDomain (id VARCHAR(255) NOT NULL, adminCipherAlgorithm VARCHAR(20), adminPwd VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE SyncopeGroup (id VARCHAR(36) NOT NULL, creationDate TIMESTAMP NOT NULL, creator VARCHAR(255) NOT NULL, lastChangeDate TIMESTAMP NOT NULL, lastModifier VARCHAR(255) NOT NULL, status VARCHAR(255), workflowId VARCHAR(255), name VARCHAR(255), REALM_ID VARCHAR(36), GROUPOWNER_ID VARCHAR(36), USEROWNER_ID VARCHAR(36), PRIMARY KEY (id), CONSTRAINT U_SYNCGRP_NAME UNIQUE (name));
CREATE TABLE SyncopeGroup_AnyTypeClass (group_id VARCHAR(36), anyTypeClass_id VARCHAR(255));
CREATE TABLE SyncopeGroup_ExternalResource (group_id VARCHAR(36), resource_id VARCHAR(255));
CREATE TABLE SyncopeLogger (logName VARCHAR(255) NOT NULL, logLevel VARCHAR(20) NOT NULL, logType VARCHAR(20) NOT NULL, PRIMARY KEY (logName));
CREATE TABLE SyncopeRole (id VARCHAR(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE SyncopeRole_entitlements (role_id VARCHAR(255), entitlement VARCHAR(255));
CREATE TABLE SyncopeRole_Realm (role_id VARCHAR(255), realm_id VARCHAR(36));
CREATE TABLE SyncopeUser (id VARCHAR(36) NOT NULL, creationDate TIMESTAMP NOT NULL, creator VARCHAR(255) NOT NULL, lastChangeDate TIMESTAMP NOT NULL, lastModifier VARCHAR(255) NOT NULL, status VARCHAR(255), workflowId VARCHAR(255), changePwdDate TIMESTAMP, cipherAlgorithm VARCHAR(20), failedLogins INTEGER, lastLoginDate TIMESTAMP, mustChangePassword INTEGER, password VARCHAR(255), securityAnswer VARCHAR(255), suspended INTEGER, token CLOB, tokenExpireTime TIMESTAMP, username VARCHAR(255), REALM_ID VARCHAR(36), SECURITYQUESTION_ID VARCHAR(36), PRIMARY KEY (id), CONSTRAINT U_SYNCPSR_USERNAME UNIQUE (username));
CREATE TABLE SyncopeUser_AnyTypeClass (user_id VARCHAR(36), anyTypeClass_id VARCHAR(255));
CREATE TABLE SyncopeUser_ExternalResource (user_id VARCHAR(36), resource_id VARCHAR(255));
CREATE TABLE SyncopeUser_passwordHistory (user_id VARCHAR(36), passwordHistoryValue VARCHAR(255));
CREATE TABLE SyncopeUser_SyncopeRole (user_id VARCHAR(36), role_id VARCHAR(255));
CREATE TABLE Task (id VARCHAR(36) NOT NULL, DTYPE VARCHAR(31), active INTEGER, cronExpression VARCHAR(255), description VARCHAR(255), jobDelegateClassName VARCHAR(255), name VARCHAR(255), startAt TIMESTAMP, anyKey VARCHAR(255), anyTypeKind VARCHAR(20), executed INTEGER, htmlBody CLOB, sender VARCHAR(255), subject VARCHAR(255), textBody CLOB, traceLevel VARCHAR(20), NOTIFICATION_ID VARCHAR(36), matchingRule VARCHAR(20), performCreate INTEGER, performDelete INTEGER, performUpdate INTEGER, pullStatus INTEGER, unmatchingRule VARCHAR(20), RESOURCE_ID VARCHAR(255), pullMode VARCHAR(23), reconciliationFilterBuilderClassName VARCHAR(255), DESTINATIONREALM_ID VARCHAR(36), anyType VARCHAR(255), attributes CLOB, connObjectKey VARCHAR(255), objectClassName VARCHAR(255), oldConnObjectKey VARCHAR(255), operation VARCHAR(20), PRIMARY KEY (id));
CREATE TABLE TaskExec (id VARCHAR(36) NOT NULL, endDate TIMESTAMP, message CLOB, startDate TIMESTAMP, status VARCHAR(255), TASK_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE TypeExtension (id VARCHAR(36) NOT NULL, GROUP_ID VARCHAR(36), ANYTYPE_ID VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_TYPXNSN_GROUP_ID UNIQUE (GROUP_ID, ANYTYPE_ID));
CREATE TABLE TypeExtension_AnyTypeClass (typeExtension_id VARCHAR(36), anyTypeClass_id VARCHAR(255));
CREATE TABLE UDynGroupMembership (id VARCHAR(36) NOT NULL, fiql VARCHAR(255), GROUP_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE UDynGroupMembership_User (uDynGroupMembership_id VARCHAR(36), user_id VARCHAR(36));
CREATE TABLE UMembership (id VARCHAR(36) NOT NULL, user_id VARCHAR(36), group_id VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE UPlainAttr (id VARCHAR(36) NOT NULL, OWNER_ID VARCHAR(36), schema_id VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE UPlainAttrUniqueValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), schema_id VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_PLNTQVL_BOOLEANVALUE UNIQUE (booleanValue, schema_id), CONSTRAINT U_PLNTQVL_DATEVALUE UNIQUE (dateValue, schema_id), CONSTRAINT U_PLNTQVL_STRINGVALUE UNIQUE (stringValue, schema_id), CONSTRAINT U_PLNTQVL_DOUBLEVALUE UNIQUE (doubleValue, schema_id), CONSTRAINT U_PLNTQVL_LONGVALUE UNIQUE (longValue, schema_id));
CREATE TABLE UPlainAttrValue (id VARCHAR(36) NOT NULL, binaryValue BLOB, booleanValue INTEGER, dateValue TIMESTAMP, doubleValue DOUBLE, longValue BIGINT, stringValue VARCHAR(255), ATTRIBUTE_ID VARCHAR(36), PRIMARY KEY (id));
CREATE TABLE URelationship (id VARCHAR(36) NOT NULL, user_id VARCHAR(36), anyObject_id VARCHAR(36), TYPE_ID VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_RLTNSHP_TYPE_ID UNIQUE (TYPE_ID, user_id, anyObject_id));
CREATE TABLE VirSchema (id VARCHAR(255) NOT NULL, extAttrName VARCHAR(255), readonly INTEGER, ANYTYPECLASS_ID VARCHAR(255), PROVISION_ID VARCHAR(36), PRIMARY KEY (id));
CREATE INDEX I_CCNTSRC_ACCOUNTPOLICY_ID ON AccountPolicy_ExternalResource (accountPolicy_id);
CREATE INDEX I_CCNTSRC_ELEMENT ON AccountPolicy_ExternalResource (resource_id);
CREATE INDEX I_CCNTTNC_ACCOUNTPOLICY ON AccountRuleConfInstance (ACCOUNTPOLICY_ID);
CREATE INDEX I_DYNGSHP_ANYTYPE ON ADynGroupMembership (ANYTYPE_ID);
CREATE INDEX I_DYNGSHP_GROUP ON ADynGroupMembership (GROUP_ID);
CREATE INDEX I_DYNGJCT_ADYNGROUPMEMBERSHIP_ID ON ADynGroupMembership_AnyObject (aDynGroupMembership_id);
CREATE INDEX I_DYNGJCT_ELEMENT ON ADynGroupMembership_AnyObject (anyObject_id);
CREATE INDEX I_MMBRSHP_LEFTEND1 ON AMembership (anyObject_id);
CREATE INDEX I_MMBRSHP_RIGHTEND1 ON AMembership (group_id);
CREATE INDEX I_NYABOUT_ANYTYPE ON AnyAbout (ANYTYPE_ID);
CREATE INDEX I_NYABOUT_NOTIFICATION ON AnyAbout (NOTIFICATION_ID);
CREATE INDEX I_NYOBJCT_REALM ON AnyObject (REALM_ID);
CREATE INDEX I_NYOBJCT_TYPE ON AnyObject (TYPE_ID);
CREATE INDEX I_NYBJLSS_ANYOBJECT_ID ON AnyObject_AnyTypeClass (anyObject_id);
CREATE INDEX I_NYBJLSS_ELEMENT ON AnyObject_AnyTypeClass (anyTypeClass_id);
CREATE INDEX I_NYBJSRC_ANYOBJECT_ID ON AnyObject_ExternalResource (anyObject_id);
CREATE INDEX I_NYBJSRC_ELEMENT ON AnyObject_ExternalResource (resource_id);
CREATE INDEX I_NYTMTSK_ANYTYPE ON AnyTemplatePullTask (ANYTYPE_ID);
CREATE INDEX I_NYTMTSK_PULLTASK ON AnyTemplatePullTask (PULLTASK_ID);
CREATE INDEX I_NYTMRLM_ANYTYPE ON AnyTemplateRealm (ANYTYPE_ID);
CREATE INDEX I_NYTMRLM_REALM ON AnyTemplateRealm (REALM_ID);
CREATE INDEX I_NYTYLSS_ANYTYPE_ID ON AnyType_AnyTypeClass (anyType_id);
CREATE INDEX I_NYTYLSS_ELEMENT ON AnyType_AnyTypeClass (anyTypeClass_id);
CREATE INDEX I_PLINTTR_OWNER ON APlainAttr (OWNER_ID);
CREATE INDEX I_PLINTTR_SCHEMA ON APlainAttr (schema_id);
CREATE INDEX I_PLNTQVL_ATTRIBUTE1 ON APlainAttrUniqueValue (ATTRIBUTE_ID);
CREATE INDEX I_PLNTQVL_SCHEMA1 ON APlainAttrUniqueValue (schema_id);
CREATE INDEX I_PLNTRVL_ATTRIBUTE1 ON APlainAttrValue (ATTRIBUTE_ID);
CREATE INDEX I_RLTNSHP_LEFTEND1 ON ARelationship (left_anyObject_id);
CREATE INDEX I_RLTNSHP_RIGHTEND1 ON ARelationship (right_anyObject_id);
CREATE INDEX I_RLTNSHP_TYPE1 ON ARelationship (TYPE_ID);
CREATE INDEX I_CNNNLTS_CONNINSTANCE_ID ON ConnInstance_capabilities (connInstance_id);
CREATE INDEX I_CPLNTTR_OWNER ON CPlainAttr (OWNER_ID);
CREATE INDEX I_CPLNTTR_SCHEMA ON CPlainAttr (schema_id);
CREATE INDEX I_CPLNQVL_ATTRIBUTE ON CPlainAttrUniqueValue (ATTRIBUTE_ID);
CREATE INDEX I_CPLNQVL_SCHEMA ON CPlainAttrUniqueValue (schema_id);
CREATE INDEX I_CPLNRVL_ATTRIBUTE ON CPlainAttrValue (ATTRIBUTE_ID);
CREATE INDEX I_DRSCHEM_ANYTYPECLASS ON DerSchema (ANYTYPECLASS_ID);
CREATE INDEX I_DYNRSHP_ROLE ON DynRoleMembership (ROLE_ID);
CREATE INDEX I_DYNR_SR_DYNROLEMEMBERSHIP_ID ON DynRoleMembership_User (dynRoleMembership_id);
CREATE INDEX I_DYNR_SR_ELEMENT ON DynRoleMembership_User (user_id);
CREATE INDEX I_XTRNSRC_ACCOUNTPOLICY ON ExternalResource (ACCOUNTPOLICY_ID);
CREATE INDEX I_XTRNSRC_CONNECTOR ON ExternalResource (CONNECTOR_ID);
CREATE INDEX I_XTRNSRC_PASSWORDPOLICY ON ExternalResource (PASSWORDPOLICY_ID);
CREATE INDEX I_XTRNSRC_PULLPOLICY ON ExternalResource (PULLPOLICY_ID);
CREATE INDEX I_XTRNRRD_RESOURCE_ID ON ExternalResource_capOverride (resource_id);
CREATE INDEX I_XTRNTNS_RESOURCE_ID ON ExternalResource_PropActions (resource_id);
CREATE INDEX I_GPLNTTR_OWNER ON GPlainAttr (OWNER_ID);
CREATE INDEX I_GPLNTTR_SCHEMA ON GPlainAttr (schema_id);
CREATE INDEX I_GPLNQVL_ATTRIBUTE ON GPlainAttrUniqueValue (ATTRIBUTE_ID);
CREATE INDEX I_GPLNQVL_SCHEMA ON GPlainAttrUniqueValue (schema_id);
CREATE INDEX I_GPLNRVL_ATTRIBUTE ON GPlainAttrValue (ATTRIBUTE_ID);
CREATE INDEX I_MAPPING_PROVISION ON Mapping (PROVISION_ID);
CREATE INDEX I_MPPNGTM_MAPPING ON MappingItem (MAPPING_ID);
CREATE INDEX I_MPPNRMR_MAPPINGITEM_ID ON MappingItem_Transformer (mappingItem_id);
CREATE INDEX I_NTFCTON_TEMPLATE ON Notification (template_id);
CREATE INDEX I_NTFCNTS_NOTIFICATIONTASK_ID ON NotificationTask_recipients (notificationTask_id);
CREATE INDEX I_NTFCNTS_NOTIFICATION_ID ON Notification_events (notification_id);
CREATE INDEX I_NTFCNTS_NOTIFICATION_ID1 ON Notification_staticRecipients (notification_id);
CREATE INDEX I_PSSWTNC_PASSWORDPOLICY ON PasswordRuleConfInstance (PASSWORDPOLICY_ID);
CREATE INDEX I_PLNSCHM_ANYTYPECLASS ON PlainSchema (ANYTYPECLASS_ID);
CREATE INDEX I_PROVSON_ANYTYPE ON Provision (ANYTYPE_ID);
CREATE INDEX I_PROVSON_RESOURCE ON Provision (RESOURCE_ID);
CREATE INDEX I_PRVSLSS_ELEMENT ON Provision_AnyTypeClass (anyTypeClass_id);
CREATE INDEX I_PRVSLSS_PROVISION_ID ON Provision_AnyTypeClass (provision_id);
CREATE INDEX I_PLLTNMS_PULLTASK_ID ON PullTask_actionsClassNames (pullTask_id);
CREATE INDEX I_PSHTLTR_ANYTYPE ON PushTaskAnyFilter (ANYTYPE_ID);
CREATE INDEX I_PSHTLTR_PUSHTASK ON PushTaskAnyFilter (PUSHTASK_ID);
CREATE INDEX I_PSHTNMS_PUSHTASK_KEY ON PushTask_actionsClassNames (pushTask_key);
CREATE INDEX I_REALM_ACCOUNTPOLICY ON Realm (ACCOUNTPOLICY_ID);
CREATE INDEX I_REALM_PARENT ON Realm (PARENT_ID);
CREATE INDEX I_REALM_PASSWORDPOLICY ON Realm (PASSWORDPOLICY_ID);
CREATE INDEX I_RLM_NMS_REALM_KEY ON Realm_actionsClassNames (realm_key);
CREATE INDEX I_REPORT_TEMPLATE ON Report (template_id);
CREATE INDEX I_RPORTXC_REPORT ON ReportExec (REPORT_ID);
CREATE INDEX I_RPRTTNC_REPORT ON ReportletConfInstance (REPORT_ID);
CREATE INDEX I_SYNCGRP_GROUPOWNER ON SyncopeGroup (GROUPOWNER_ID);
CREATE INDEX I_SYNCGRP_REALM ON SyncopeGroup (REALM_ID);
CREATE INDEX I_SYNCGRP_USEROWNER ON SyncopeGroup (USEROWNER_ID);
CREATE INDEX I_SYNCLSS_ELEMENT ON SyncopeGroup_AnyTypeClass (anyTypeClass_id);
CREATE INDEX I_SYNCLSS_GROUP_ID ON SyncopeGroup_AnyTypeClass (group_id);
CREATE INDEX I_SYNCSRC_ELEMENT ON SyncopeGroup_ExternalResource (resource_id);
CREATE INDEX I_SYNCSRC_GROUP_ID ON SyncopeGroup_ExternalResource (group_id);
CREATE INDEX I_SYNCNTS_ROLE_ID ON SyncopeRole_entitlements (role_id);
CREATE INDEX I_SYNCRLM_ELEMENT ON SyncopeRole_Realm (realm_id);
CREATE INDEX I_SYNCRLM_ROLE_ID ON SyncopeRole_Realm (role_id);
CREATE INDEX I_SYNCPSR_REALM ON SyncopeUser (REALM_ID);
CREATE INDEX I_SYNCPSR_SECURITYQUESTION ON SyncopeUser (SECURITYQUESTION_ID);
CREATE INDEX I_SYNCLSS_ELEMENT1 ON SyncopeUser_AnyTypeClass (anyTypeClass_id);
CREATE INDEX I_SYNCLSS_USER_ID ON SyncopeUser_AnyTypeClass (user_id);
CREATE INDEX I_SYNCSRC_ELEMENT1 ON SyncopeUser_ExternalResource (resource_id);
CREATE INDEX I_SYNCSRC_USER_ID ON SyncopeUser_ExternalResource (user_id);
CREATE INDEX I_SYNCTRY_USER_ID ON SyncopeUser_passwordHistory (user_id);
CREATE INDEX I_SYNCPRL_ELEMENT ON SyncopeUser_SyncopeRole (role_id);
CREATE INDEX I_SYNCPRL_USER_ID ON SyncopeUser_SyncopeRole (user_id);
CREATE INDEX I_TASK_DESTINATIONREALM ON Task (DESTINATIONREALM_ID);
CREATE INDEX I_TASK_DTYPE ON Task (DTYPE);
CREATE INDEX I_TASK_NOTIFICATION ON Task (NOTIFICATION_ID);
CREATE INDEX I_TASK_RESOURCE ON Task (RESOURCE_ID);
CREATE INDEX I_TSKEXEC_TASK ON TaskExec (TASK_ID);
CREATE INDEX I_TYPXNSN_ANYTYPE ON TypeExtension (ANYTYPE_ID);
CREATE INDEX I_TYPXNSN_GROUP ON TypeExtension (GROUP_ID);
CREATE INDEX I_TYPXLSS_ELEMENT ON TypeExtension_AnyTypeClass (anyTypeClass_id);
CREATE INDEX I_TYPXLSS_TYPEEXTENSION_ID ON TypeExtension_AnyTypeClass (typeExtension_id);
CREATE INDEX I_DYNGSHP_GROUP1 ON UDynGroupMembership (GROUP_ID);
CREATE INDEX I_DYNG_SR_ELEMENT ON UDynGroupMembership_User (user_id);
CREATE INDEX I_DYNG_SR_UDYNGROUPMEMBERSHIP_ID ON UDynGroupMembership_User (uDynGroupMembership_id);
CREATE INDEX I_MMBRSHP_LEFTEND ON UMembership (user_id);
CREATE INDEX I_MMBRSHP_RIGHTEND ON UMembership (group_id);
CREATE INDEX I_UPLNTTR_OWNER ON UPlainAttr (OWNER_ID);
CREATE INDEX I_UPLNTTR_SCHEMA ON UPlainAttr (schema_id);
CREATE INDEX I_PLNTQVL_ATTRIBUTE ON UPlainAttrUniqueValue (ATTRIBUTE_ID);
CREATE INDEX I_PLNTQVL_SCHEMA ON UPlainAttrUniqueValue (schema_id);
CREATE INDEX I_PLNTRVL_ATTRIBUTE ON UPlainAttrValue (ATTRIBUTE_ID);
CREATE INDEX I_RLTNSHP_LEFTEND ON URelationship (user_id);
CREATE INDEX I_RLTNSHP_RIGHTEND ON URelationship (anyObject_id);
CREATE INDEX I_RLTNSHP_TYPE ON URelationship (TYPE_ID);
CREATE INDEX I_VIRSCHM_ANYTYPECLASS ON VirSchema (ANYTYPECLASS_ID);
CREATE INDEX I_VIRSCHM_PROVISION ON VirSchema (PROVISION_ID);