___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Event ID - Único",
  "description": "Gerador de Event ID único",
  "categories": [
    "UTILITY"
  ],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "company_data",
    "displayName": "Developed by tagsepixel.com.br"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromDataLayer = require('copyFromDataLayer');
const setInWindow = require('setInWindow');
const copyFromWindow = require('copyFromWindow');
const getTimestampMillis = require('getTimestampMillis');
const generateRandom = require('generateRandom');

return getGtmStart() + getPageLoadId() + getGtmUniqueEventId() + '_' + 'tagsepixel' + getEventName();


function getGtmStart() {
    let gtmStart = copyFromDataLayer('gtm.start');

    if (gtmStart) {
        return gtmStart + '_';
    }

    return '';
}

function getGtmUniqueEventId() {
    return copyFromDataLayer('gtm.uniqueEventId') || '0';
}

function getPageLoadId() {
  let eventId = copyFromWindow('gtmPageLoadId');

  if (!eventId) {
    eventId = getTimestampMillis() + generateRandom(100000, 999999) + '_';
    setInWindow('gtmPageLoadId', eventId, false);
  }

  return eventId;
}

function getEventName() {
    let eventName = copyFromDataLayer('event');

    if (eventName) {
        return '_' + eventName;
    }

    return '';
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "gtm.start"
              },
              {
                "type": 1,
                "string": "gtm.uniqueEventId"
              },
              {
                "type": 1,
                "string": "event"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtmPageLoadId"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
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

Created on 04/02/2022, 20:50:00


