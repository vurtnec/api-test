import {World} from "cucumber";
import {Context} from "@aaxis/cucumber-utilities";

const qs = require('qs');


export default class LoginResolver{
    static resolveLogin(params: string, context: Context | World) {
        const requestInfo = context.getStore().getCurrentRequestInfo().requestConfig;
        requestInfo.data = qs.stringify(Object.assign(Object.assign({}, requestInfo.data), context.getStore().requestHelper.parseData(params)));
    }
}

