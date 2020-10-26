import {CallbackStepDefinition, Then, World} from "cucumber";
import {Context} from "@aaxis/cucumber-utilities";

Then(
    /^set access token from (.*) to (.*) header$/,
    function (
        this: Context | World,
        variableName: string,
        bodyName: string,
        callback: CallbackStepDefinition
    ) {
        const requestInfo = this.getStore().getCurrentRequestInfo();
        const headerValue = this.getStore().scenarioVariables[variableName]
        requestInfo.addHeader(bodyName, `Bearer ${headerValue}`);
        callback();
    }
);
