import { Context } from "@aaxis/cucumber-utilities";
import { World, CallbackStepDefinition, When, Then } from "cucumber";
import LoginResolver from "../src/resolver/LoginResolver";
When(
  /^logged in tabitha account visit Mobile App with (.*) and (.*).$/,
  async function (this: Context | World, endpoint1: string, login1: string) {
    //Automatically generated.
    this.resolveEndpoint(endpoint1);
    LoginResolver.resolveLogin(login1, this);
    await this.invoke();
  }
);
When(/^Try to get user job account information from (.*).$/, async function (
  this: Context | World,
  endpoint2: string
) {
  //Automatically generated.
  this.resolveEndpoint(endpoint2);
  await this.invoke();
});
When(
  /^logged in tabitha account with wrong token to visit Mobile App with (.*) and (.*).$/,
  async function (this: Context | World, endpoint1: string, login1: string) {
    //Automatically generated.
    this.resolveEndpoint(endpoint1);
    LoginResolver.resolveLogin(login1, this);
    await this.invoke();
  }
);
Then(/^Validate response body$/, function (
  this: Context | World,
  callback: CallbackStepDefinition
) {
  //Automatically generated.
  callback();
});
