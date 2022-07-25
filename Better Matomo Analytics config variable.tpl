___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Better Matomo Analytics config variable",
  "description": "Configuration variable for Matomo Analytics tags to carry over several settings to every tag that uses it.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "instanceURL",
    "displayName": "Instance URL",
    "simpleValueType": true,
    "valueHint": "https://stats.example.com/",
    "help": "The address of your Matomo Web Analytics Suite account.",
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^https://.*"
        ],
        "errorMessage": "Instance URL has to start with https://"
      },
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "websiteID",
    "displayName": "Site ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "The unique ID for your site in Matomo Web Analytics.",
    "valueHint": "1"
  },
  {
    "type": "TEXT",
    "name": "analyticsDomains",
    "displayName": "Analytics domains",
    "simpleValueType": true,
    "lineCount": 1,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^((?!,).)*$"
        ]
      }
    ],
    "help": "The domain(s) tracked by Matomo Web Analytics code. If necessary, add multiple domains separated by coma. Adding multiple domains will enable cross domain options. They need to start with \"http://\" or \"https://\".",
    "valueHint": "https://example.com"
  },
  {
    "type": "GROUP",
    "name": "customDimensions",
    "displayName": "Custom dimensions",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "customDimensionsPairs",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Custom dimensions\u0027 index",
            "name": "cdIndex",
            "type": "TEXT",
            "valueHint": "Insert the index number",
            "isUnique": true,
            "valueValidators": [
              {
                "type": "POSITIVE_NUMBER"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "Insert custom dimension\u0027s value"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "dataCollectionSettings",
    "displayName": "Data collection",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "fieldsToSet",
        "displayName": "Fields to set",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Field",
            "name": "field",
            "type": "SELECT",
            "selectItems": [
              {
                "value": "page_url",
                "displayValue": "Page URL"
              },
              {
                "value": "page_title",
                "displayValue": "Page title"
              },
              {
                "value": "page_referrer",
                "displayValue": "Page referrer"
              },
              {
                "value": "user_id",
                "displayValue": "User ID"
              },
              {
                "value": "send_beacon",
                "displayValue": "Use navigator.sendBeacon"
              },
              {
                "value": "enableLinkTracking",
                "displayValue": "Track outlinks and downloads"
              },
              {
                "value": "enableContentTracking",
                "displayValue": "Interactions with popups and content"
              },
              {
                "value": "countSessionsPrecisely",
                "displayValue": "Count session time precisely"
              },
              {
                "value": "cookieDomain",
                "displayValue": "Set cookie domain"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "privacySettings",
    "displayName": "Privacy and cookies",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "RADIO",
        "name": "cookieConsent",
        "displayName": "Specify cookie consent method",
        "radioItems": [
          {
            "value": "useGoogleConsentAPI",
            "displayValue": "Use Google Consent API"
          },
          {
            "value": "useCookieConsentGiven",
            "displayValue": "Use Matomo cookie consent functions"
          },
          {
            "value": "disableCookies",
            "displayValue": "Disable visitor cookies"
          }
        ],
        "simpleValueType": true,
        "help": "Consent can be set using Google Consent API or using a custom variable",
        "defaultValue": "useGoogleConsentAPI"
      },
      {
        "type": "TEXT",
        "name": "CookieConsentGiven",
        "displayName": "Cookie Consent Given Variable",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "variable should be \"true\" or \"false\" (as text).",
        "enablingConditions": [
          {
            "paramName": "cookieConsent",
            "paramValue": "useCookieConsentGiven",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "setSecureCookie",
        "checkboxText": "Use secure cookies",
        "simpleValueType": true,
        "help": "If turned on, you’ll receive information from first-party cookies over a secure connection. Only websites with the HTTPS protocol will be able to access these cookies.",
        "enablingConditions": [
          {
            "paramName": "cookieConsent",
            "paramValue": "disableCookies",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "setVisitorCookieTimeout",
        "checkboxText": "Remove the visitor cookie at custom time",
        "simpleValueType": true,
        "help": "The visitor cookie (_pk_id.*) is removed after 13 months by default. You can delete it at a different time.",
        "enablingConditions": [
          {
            "paramName": "cookieConsent",
            "paramValue": "disableCookies",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "visitorCookieTimeout",
        "selectItems": [
          {
            "value": 300,
            "displayValue": "5 minutes"
          },
          {
            "value": 600,
            "displayValue": "10 minutes"
          },
          {
            "value": 900,
            "displayValue": "15 minutes"
          },
          {
            "value": 1800,
            "displayValue": "30 minutes"
          },
          {
            "value": 3600,
            "displayValue": "1 hour"
          },
          {
            "value": 86400,
            "displayValue": "24 hours"
          },
          {
            "value": 604800,
            "displayValue": "1 week"
          },
          {
            "value": 2419200,
            "displayValue": "1 month"
          },
          {
            "value": 14515200,
            "displayValue": "6 months"
          },
          {
            "value": 29030400,
            "displayValue": "12 months"
          },
          {
            "value": 58060800,
            "displayValue": "24 months"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "setVisitorCookieTimeout",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "setSessionCookieTimeout",
        "checkboxText": "Remove the session cookie at custom time",
        "simpleValueType": true,
        "help": "The session cookie (_pk_ses.*) is removed after 30 minutes by default. You can delete it at a different time.",
        "enablingConditions": [
          {
            "paramName": "cookieConsent",
            "paramValue": "disableCookies",
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "sessionCookieTimeout",
        "selectItems": [
          {
            "value": 300,
            "displayValue": "5 minutes"
          },
          {
            "value": 600,
            "displayValue": "10 minutes"
          },
          {
            "value": 900,
            "displayValue": "15 minutes"
          },
          {
            "value": 1800,
            "displayValue": "30 minutes"
          },
          {
            "value": 3600,
            "displayValue": "1 hour"
          },
          {
            "value": 86400,
            "displayValue": "24 hours"
          },
          {
            "value": 604800,
            "displayValue": "1 week"
          },
          {
            "value": 2419200,
            "displayValue": "1 month"
          },
          {
            "value": 14515200,
            "displayValue": "6 months"
          },
          {
            "value": 29030400,
            "displayValue": "12 months"
          },
          {
            "value": 58060800,
            "displayValue": "24 months"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "setSessionCookieTimeout",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "otherOptions",
    "displayName": "Other options",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "enableJSErrorTracking",
        "checkboxText": "Detect JavaScript errors",
        "simpleValueType": true,
        "help": "If turned on, you\u0027ll record all kinds of JavaScript errors on your website. The errors will be saved as custom events with the error type and the URL of the page where they occurred. You\u0027ll see them under Analytics \u003e Reports \u003e Custom events or if you create a custom report."
      },
      {
        "type": "CHECKBOX",
        "name": "dontTrackPageViews",
        "checkboxText": "Track page views manually",
        "simpleValueType": true,
        "help": "If turned on, you can use a virtual page view tag or custom JavaScript code to track page views manually."
      },
      {
        "type": "CHECKBOX",
        "name": "useAlternativeCDNSource",
        "checkboxText": "Use an alternative CDN Source",
        "simpleValueType": true,
        "help": "If turned on, the tracking code we use Cloudflare CDN instead of jsdelivr.net"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Introduzca aquí su código de plantilla.
const log = require('logToConsole');
log('data =', data);

data.matomoCheck=true;

// Las variables deben devolver un valor.
return data;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 27/4/2022, 10:02:24


