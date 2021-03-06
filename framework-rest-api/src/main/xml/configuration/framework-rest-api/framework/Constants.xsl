<?xml version="1.0" encoding="UTF-8"?>
	<!-- *****************************************************************
	*	Copyright 2016 SysInt Pty Ltd (Australia)
	*	
	*	Licensed under the Apache License, Version 2.0 (the "License");
	*	you may not use this file except in compliance with the License.
	*	You may obtain a copy of the License at
	*	
	*	    http://www.apache.org/licenses/LICENSE-2.0
	*	
	*	Unless required by applicable law or agreed to in writing, software
	*	distributed under the License is distributed on an "AS IS" BASIS,
	*	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	*	See the License for the specific language governing permissions and
	*	limitations under the License.
	**********************************************************************-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="" version="1.0">
	<!--========================================================================
		Purpose:
		A collection of constant DataPower variable and context definitions (URIs) for common use across
		stylesheets within the DataPower SecureTokenService policy flows.
		
		History:
		2016-12-12	v1.0	N.A. , Tim Goodwill		Initial Version.

		========================================================================-->
	<!--============== Global Variable Declarations =================-->
	<!--
		Local File Path variable names
	-->
	<xsl:variable name="SERVICE_SCHEMA_ROOT_FOLDER" select="'local:///service-schema/'"/>
	<xsl:variable name="JSON_RESTAPI_ROOT_FOLDER" select="'local:///Json_RestAPI/'"/>
	<!--
		'Json_RestAPI' context variable names
	-->
	<xsl:variable name="ERROR_ADD_DETAILS_VAR_NAME" select="'var://context/framework-soa-esb/errorSubDescription'"/>
	<xsl:variable name="ERROR_CODE_VAR_NAME" select="'var://context/framework-soa-esb/errorCode'"/>
	<xsl:variable name="ERROR_DOMAIN_VAR_NAME" select="'var://context/framework-soa-esb/errorDomain'"/>
	<xsl:variable name="ERROR_MSG_VAR_NAME" select="'var://context/framework-soa-esb/errorMsg'"/>
	<xsl:variable name="ERROR_ORIG_LOC_VAR_NAME" select="'var://context/framework-soa-esb/errorOriginatorLoc'"/>
	<xsl:variable name="ERROR_ORIG_NAME_VAR_NAME" select="'var://context/framework-soa-esb/errorSubCode'"/>
	<xsl:variable name="ERROR_PROVIDER_NAME_VAR_NAME" select="'var://context/framework-soa-esb/errorProviderName'"/>
	<xsl:variable name="ERROR_SERVICE_NAME_VAR_NAME" select="'var://context/framework-soa-esb/errorServiceName'"/>
	<xsl:variable name="ERROR_SUBCODE_VAR_NAME" select="'var://context/framework-soa-esb/errorSubCode'"/>
	<xsl:variable name="EVENT_CODE_VAR_NAME" select="'var://context/framework-soa-esb/eventCode'"/>
	<xsl:variable name="EVENT_SUBCODE_VAR_NAME" select="'var://context/framework-soa-esb/eventSubCode'"/>
	<xsl:variable name="EVENT_MESSAGE_VAR_NAME" select="'var://context/framework-soa-esb/eventMsg'"/>
	<xsl:variable name="JWT_VALIDATION_ERROR_CODE_VAR_NAME" select="'var://context/Json_RestAPI/validationErrorCode'"/>
	<xsl:variable name="NEXT_RULE_NAME_VAR_NAME" select="'var://context/Json_RestAPI/nextRuleName'"/>
	<xsl:variable name="OPERATION_CONFIG_NODE_ID_VAR_NAME" select="'var://context/Json_RestAPI/operationConfigNodeId'"/>
	<xsl:variable name="OPERATION_CONFIG_PROVIDER_VAR_NAME" select="'var://context/Json_RestAPI/operationConfigProvider'"/>
	<xsl:variable name="POLICY_CONFIG_NODE_ID_VAR_NAME" select="'var://context/Json_RestAPI/operationConfigNodeId'"/>
	<xsl:variable name="REQ_HTTP_HEADERS_IN_VAR_NAME" select="'var://context/Json_RestAPI/requestHttpHeadersIn'"/>
	<xsl:variable name="REQ_HTTP_HEADERS_OUT_VAR_NAME" select="'var://context/Json_RestAPI/requestHttpHeadersOut'"/>
	<xsl:variable name="REQ_IN_MSG_FORMAT_VAR_NAME" select="'var://context/Json_RestAPI/requestInMsgFormat'"/>
	<xsl:variable name="REQ_OUT_MSG_FORMAT_VAR_NAME" select="'var://context/Json_RestAPI/requestOutMsgFormat'"/>
	<xsl:variable name="REQ_USER_NAME_VAR_NAME" select="'var://context/Json_RestAPI/requestUserName'"/>
	<xsl:variable name="RES_HTTP_HEADERS_IN_VAR_NAME" select="'var://context/Json_RestAPI/responseHttpHeadersIn'"/>
	<xsl:variable name="RES_HTTP_HEADERS_OUT_VAR_NAME" select="'var://context/Json_RestAPI/responseHttpHeadersOut'"/>
	<xsl:variable name="RES_IN_MSG_NAME_VAR_NAME" select="'var://context/Json_RestAPI/responseInMsgName'"/>
	<xsl:variable name="SERVICE_IDENTIFIER_VAR_NAME" select="'var://context/Json_RestAPI/serviceIdentifier'"/>
	<xsl:variable name="SERVICE_NAME_VAR_NAME" select="'var://context/Json_RestAPI/serviceName'"/>
	<xsl:variable name="STATS_LOG_REQ_ROOT_VAR_NAME" select="'var://context/Json_RestAPI/statsLogReqInMsgRoot'"/>
	<xsl:variable name="STATS_LOG_REQ_SIZE_VAR_NAME" select="'var://context/Json_RestAPI/statsLogReqInMsgSize'"/>
	<xsl:variable name="STATS_LOG_RES_SIZE_VAR_NAME" select="'var://context/Json_RestAPI/statsLogResInMsgSize'"/>
	<xsl:variable name="STATS_LOG_RES_ROOT_VAR_NAME" select="'var://context/Json_RestAPI/statsLogResOutMsgRoot'"/>
	<xsl:variable name="TIMER_START_VAR_NAME" select="'var://context/Json_RestAPI/timerStart'"/>
	<xsl:variable name="TRANSACTION_ID_VAR_NAME" select="'var://context/Json_RestAPI/transactionId'"/>
	
	<!--
		Custom context names
	-->
	<xsl:variable name="SERVICE_METADATA_CONTEXT_NAME" select="'var://context/SERVICE_METADATA/'"/>
	<xsl:variable name="RESULT_DOC_CONTEXT_NAME" select="'var://context/RESULT_DOC/'"/>
	<xsl:variable name="VALIDATE_RESULT_CONTEXT_NAME" select="'var://context/VALIDATE_RESULT/'"/>
	<!--
		Datapower pre-defined context names
	-->
	<xsl:variable name="INPUT_CONTEXT_NAME" select="'var://context/INPUT/'"/>
	<!-- 
		Log event key values
	-->
	<xsl:variable name="DP_INTERNAL_FAULT_EVENT_CODE" select="'0x00c30010'"/>
	<xsl:variable name="LOG_EVENT_KEY_SUCCESS" select="'ServiceComplete'"/>
	<xsl:variable name="LOG_EVENT_KEY_ERROR" select="'ServiceError'"/>
	<xsl:variable name="LOG_EVENT_KEY_EVENT" select="'ServiceEvent'"/>
	<!--
		Datapower defined xml names
	-->
	<!-- The SOA QMgr Group name -->
	<xsl:variable name="LOG_QMGR_GROUP_NAME" select="'SOA_Internal_Grp_RealTime_V1'"/>
	<!--
		Datapower pre-defined service variable names
	-->
	<xsl:variable name="DP_SERVICE_BACKEND_TIMEOUT" select="'var://service/mpgw/backend-timeout'"/>
	<xsl:variable name="DP_SERVICE_LOCAL_SERVICE_ADDRESS" select="'var://service/local-service-address'"/>
	<xsl:variable name="DP_SERVICE_CLIENT_SERVICE_ADDRESS" select="'var://service/client-service-address'"/>
	<xsl:variable name="DP_SERVICE_DOMAIN_NAME" select="'var://service/domain-name'"/>
	<xsl:variable name="DP_SERVICE_URI" select="'var://service/URI'"/>
	<xsl:variable name="DP_SERVICE_URL_IN" select="'var://service/URL-in'"/>
	<xsl:variable name="DP_SERVICE_URL_OUT" select="'var://service/URL-out'"/>
	<xsl:variable name="DP_SERVICE_MQ_CCSI" select="'var://service/mq-ccsi'"/>
	<xsl:variable name="DP_SERVICE_TIME_ELAPSED" select="'var://service/time-elapsed'"/>
	<xsl:variable name="DP_SERVICE_ERROR_CODE" select="'var://service/error-code'"/>
	<xsl:variable name="DP_SERVICE_ERROR_HEADERS" select="'var://service/error-headers'"/>
	<xsl:variable name="DP_SERVICE_ERROR_IGNORE" select="'var://service/error-ignore'"/>
	<xsl:variable name="DP_SERVICE_ERROR_MSG" select="'var://service/error-message'"/>
	<xsl:variable name="DP_SERVICE_ERROR_PROTOCOL_REASON_PHRASE" select="'var://service/error-protocol-reason-phrase'"/>
	<xsl:variable name="DP_SERVICE_ERROR_PROTOCOL_RESPONSE" select="'var://service/error-protocol-response'"/>
	<xsl:variable name="DP_SERVICE_ERROR_SUBCODE" select="'var://service/error-subcode'"/>
	<xsl:variable name="DP_SERVICE_FORMATTED_ERROR_MSG" select="'var://service/formatted-error-message'"/>
	<xsl:variable name="DP_SERVICE_HEADER_MANIFEST" select="'var://service/header-manifest'"/>
	<xsl:variable name="DP_LOCAL_ATTACHMENT_MANIFEST" select="'var://local/attachment-manifest'"/>
	<xsl:variable name="DP_SERVICE_STRICT_ERROR_MODE" select="'var://service/strict-error-mode'"/>
	<xsl:variable name="DP_SERVICE_PROCESSOR_NAME" select="'var://service/processor-name'"/>
	<xsl:variable name="DP_SERVICE_ROUTING_URL" select="'var://service/routing-url'"/>
	<xsl:variable name="DP_SERVICE_ROUTING_URL_DELAY_CONTENT_TYPE" select="'var://service/routing-url-delay-content-type-determination'"/>
	<xsl:variable name="DP_SERVICE_TRANSACTION_ID" select="'var://service/transaction-id'"/>
	<xsl:variable name="DP_SERVICE_TRANSACTION_RULE_TYPE" select="'var://service/transaction-rule-type'"/>
	<xsl:variable name="DP_SERVICE_FRONT_PROTOCOL" select="'var://service/wsm/front-protocol'"/>
	<xsl:variable name="DP_SERVICE_TRANSACTION_TIMEOUT" select="'var://service/transaction-timeout'"/>
	<xsl:variable name="DP_SERVICE_TRANSACTION_RULE_NAME" select="'var://service/transaction-rule-name'"/>
	<xsl:variable name="DP_SERVICE_WSM_OPERATION" select="'var://service/wsm/operation'"/>
	<!--
		Datapower pre-defined WSM context variable names
	-->
	<xsl:variable name="DP_CONTEXT_WSM_IDENT_CREDENTIALS" select="'var://context/WSM/identity/credentials'"/>
	<!--
		Datapower pre-defined log level (priority) values
	-->
	<xsl:variable name="DP_LOG_LEVEL_EMERG" select="'emerg'"/>
	<xsl:variable name="DP_LOG_LEVEL_ALERT" select="'alert'"/>
	<xsl:variable name="DP_LOG_LEVEL_CRITIC" select="'critic'"/>
	<xsl:variable name="DP_LOG_LEVEL_ERROR" select="'error'"/>
	<xsl:variable name="DP_LOG_LEVEL_WARN" select="'warn'"/>
	<xsl:variable name="DP_LOG_LEVEL_NOTICE" select="'notice'"/>
	<xsl:variable name="DP_LOG_LEVEL_INFO" select="'info'"/>
	<xsl:variable name="DP_LOG_LEVEL_DEBUG" select="'debug'"/>
	<!--
		'propkey://' properties prefix and property keys
	-->
	<xsl:variable name="PROP_URI_PREFIX" select="'propkey://'"/>
	<xsl:variable name="PROPKEY_LOGCAT_STATS" select="'propkey://logCategory/dpdirectStats'"/>
	<xsl:variable name="PROPKEY_LOGCAT_SERVICE" select="'propkey://logCategory/dpdirectService'"/>
	<xsl:variable name="LOGCAT_STATS_SUFFIX" select="'_DPDirectStats'"/>
	<xsl:variable name="LOGCAT_SERVICE_SUFFIX" select="'_DPDirectService'"/>
	<!-- 
		Miscellaneous variables
	-->
	<xsl:variable name="GATEWAY_BASE_ADDR" select="'https://dpdirect.org'"/>
	<xsl:variable name="JWT_ISSUE_URI" select="'/jwtTokenService/issue'"/>
	<xsl:variable name="STS_VALIDATE_URI" select="'/jwtTokenService/validate'"/>
	<xsl:variable name="JWT_TOKEN_NS" select="'x-gateway'"/>
	<xsl:variable name="JWT_TOKEN_LABLE" select="concat($JWT_TOKEN_NS, '-token')"/>
	<xsl:variable name="JWT_VALID_RESPONSE" select="'VALID'"/>
	<xsl:variable name="JWT_EXPIRED_CODE" select="'token_expired'"/>
	<xsl:variable name="DP_MANUAL_REJECT_EVENT_CODE" select="'0x00d30003'"/>
	<xsl:variable name="DP_FALLBACK_ERROR_CODE" select="'ERROR0001'"/>
	<xsl:variable name="SERVICES_PROXY_NAME_SUFFIX" select="'_ServicesProxy'"/>
	<xsl:variable name="RULE_NAME_PREFIX" select="'JSONAPI_Services_V1_'"/>
</xsl:stylesheet>
