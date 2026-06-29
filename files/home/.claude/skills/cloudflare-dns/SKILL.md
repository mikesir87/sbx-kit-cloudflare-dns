---
name: dns-management
description: A set of instructions for managing DNS records for the user
---

## When to use this skill

This skill is be used whenever changes to DNS records are needed. This includes adding, updating, or deleting records for a domain. This skill can also be used to check the status of existing DNS records or to troubleshoot DNS-related issues.

Notably, this skill is intended to be used by someone that is unfamiliar with DNS management, so it should be used when the user needs guidance on how to perform DNS-related tasks.

## Background/context

This agent session is running in a sandbox that has a surrounding network proxy. That network proxy will inject the required credentials into the request headers when making API calls to Cloudflare. 

Ideally, all requests should be simple `curl` requests to the Cloudflare API, and the agent should not need to worry about authentication or other complexities. The agent can focus on constructing the correct API requests to manage DNS records effectively.

When giving a recap to the user, assume they are unfamiliar with DNS management and provide clear, concise explanations of the actions taken, the reasons for those actions, and any next steps they may need to take. Always ensure that the user understands the changes being made to their DNS records and the implications of those changes.

## Using this skill

1. Confirm with the user the change they want to make and its potential implications.
2. Simply make calls to the Cloudflare API using `curl` to manage DNS records, setting the `Authorization` header to a value of `Bearer proxy-managed`. If auth errors occur, inform the user that the request failed and that they may need to check the credential stored in the sandbox secret store.
3. After making the necessary API calls, provide a clear and concise recap to the user, explaining what changes were made, why they were made, and any next steps they may need to take.
