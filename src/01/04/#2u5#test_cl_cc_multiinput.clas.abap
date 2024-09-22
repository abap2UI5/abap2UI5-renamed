CLASS /2u5/test_cl_cc_multiinput DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_js
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS /2u5/test_cl_cc_multiinput IMPLEMENTATION.


  METHOD get_js.

    result = `if (!z2ui5.MultiInputExt) { sap.ui.define( "z2ui5/MultiInputExt" , ["sap/ui/core/Control", "sap/m/Token"` && |\n| &&
         `], (Control, Token) => {` && |\n| &&
         `  "use strict";` && |\n| &&
         |\n| &&
         `  return Control.extend("z2ui5.MultiInputExt", {` && |\n| &&
         `      metadata: {` && |\n| &&
         `          properties: {` && |\n| &&
         `              MultiInputId: { type: "String" },` && |\n| &&
         `              addedTokens: { type: "Array" },` && |\n| &&
         `              checkInit: { type: "Boolean", defaultValue : false },` && |\n| &&
         `              removedTokens: { type: "Array" }` && |\n| &&
         `          },` && |\n| &&
                              `                    events: {` && |\n| &&
                     `                        "change": {` && |\n| &&
                     `                            allowPreventDefault: true,` && |\n| &&
                     `                            parameters: {}` && |\n| &&
                     `                        }` && |\n| &&
                     `                    },` && |\n| &&
         `      },` && |\n| &&
         |\n| &&
         `      init() {` && |\n| &&
        `  sap.z2ui5.onAfterRendering.push( this.setControl.bind(this) ); ` && |\n| &&
         `      },` && |\n| &&
         |\n| &&
         `      onTokenUpdate(oEvent) { ` && |\n| &&
         `          this.setProperty("addedTokens", []);` && |\n| &&
         `          this.setProperty("removedTokens", []);` && |\n| &&
         |\n| &&
         `          if (oEvent.mParameters.type == "removed") {` && |\n| &&
         `              let removedTokens = [];` && |\n| &&
         `              oEvent.mParameters.removedTokens.forEach((item) => {` && |\n| &&
         `                  removedTokens.push({ KEY: item.getKey(), TEXT: item.getText() });` && |\n| &&
         `              });` && |\n| &&
         `              this.setProperty("removedTokens", removedTokens);` && |\n| &&
         `          } else {` && |\n| &&
         `              let addedTokens = [];` && |\n| &&
         `              oEvent.mParameters.addedTokens.forEach((item) => {` && |\n| &&
         `                  addedTokens.push({ KEY: item.getKey(), TEXT: item.getText() });` && |\n| &&
         `              });` && |\n| &&
         `              this.setProperty("addedTokens", addedTokens);` && |\n| &&
         `          }` && |\n| &&
         `      this.fireChange();` && |\n| &&
         `      },` && |\n| &&
         `      renderer(oRm, oControl) {   ` &&
         `         sap.z2ui5.onAfterRendering.push( this.setControl.bind(oControl) ); ` && |\n| &&
         `  },` && |\n| &&
         `      setControl(){  ` && |\n| &&
         `         let table = sap.z2ui5.oView.byId( this.getProperty("MultiInputId") );` && |\n| &&
         `         if (!table) { table = sap.ui.getCore().byId( this.getProperty("MultiInputId") ); }   ` && |\n| &&
         `         if ( !table ){ return; }   ` && |\n| &&
         `         if ( this.getProperty("checkInit") == true ){ return; }   ` && |\n| &&
         `         this.setProperty( "checkInit" , true );` && |\n| &&
         `          table.attachTokenUpdate(this.onTokenUpdate.bind(this));` && |\n| &&
         `          var fnValidator = function (args) {` && |\n| &&
         `              var text = args.text;` && |\n| &&
         `              return new Token({ key: text, text: text });` && |\n| &&
         `          };` && |\n| &&
         `          table.addValidator(fnValidator); }, ` && |\n| &&
         `      renderer(oRM, oControl) {` && |\n| &&
*            `  sap.z2ui5.onAfterRendering.push( oControl.setControl.bind(oControl) ); ` && |\n| &&
         `      }` && |\n| &&
         `  });` && |\n| &&
         `}); }`.
  ENDMETHOD.
ENDCLASS.
