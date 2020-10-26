import {Before, CallbackStepDefinition, HookScenarioResult, World} from "cucumber";
import {Context} from "@aaxis/cucumber-utilities";

Before(function (
    this: Context | World,
    scenario: HookScenarioResult,
    callback: CallbackStepDefinition | undefined
) {
    this.getStore().globalConfig.baseURL = 'https://api2.ferguson.com'
    callback && callback();
});
