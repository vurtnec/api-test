**Feature**: Login

**Scenario Outline**: Login Successfully

  **Given** request authorization "<token>"

  **And** request header "<headers>"

  **When** login with "<queryRequest>"

  **Then** the user should be login successfully

  **And** the response path [data] should be validated by "<responseRule>"

  **Examples**:

| token | headers | queryRequest | responseRule |
| ----- | ------- | ------------ | ------------ |
| test/example/fg.data.ts[token] | {\'app-header\':\'react-native-app\'} | test/example/fg.data.ts[requestBody] | test/example/fg.data.ts[validateLoginRule] |

