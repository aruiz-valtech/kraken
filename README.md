
[Introduction](#introduction)
  - [Background](#background)
  - [Objectives](#objectives)
- [Introduction](#introduction)
  - [Background](#background)
  - [Objectives](#objectives)
- [Test Items](#test-items)
- [Features to Test](#features-to-test)
- [Features Not to Test](#features-not-to-test)
- [Test Approach](#test-approach)
  - [Test Levels](#test-levels)
  - [Functional Tests](#functional-tests)
  - [Non-Functional Tests](#non-functional-tests)
- [Entry & Exit Criteria](#entry--exit-criteria)
- [Test Deliverables](#test-deliverables)
- [Environments](#environments)
- [Approvals](#approvals)

## Introduction
### Background
- Cryptowatch is a crypto-trading terminal
- It connects all major crypto exchanges to power price feeds and technical analysis charting tools
- It is possible to also place trade using the account with one of the many major exchanges directly from the price chart
- Works on Mobile & Desktop
- There are 2 account types:
  - #### Basic Account
    - Free 
    - Monitor & analyse markets
    - Receive alerts on price & volume
    - Track the account's crypto portfolio value in real time
    - View aggregate price of an asset across exchanges
    - Add filters to crytpo assets 
  - #### Premium Account
    - Everything available from Basic account
    - Push notifications of alerts from your phone
    - Trade from real-time charts on accounts from all major exchanges 

### Objectives
- Verify the Cryptowatch account creation and onboarding process allows new customers to sign up
- Verify the process works on both Mobile & Desktop with all major browsers
- Verify it is possible to perform all tasks listed in the [Basic Account](#basic-account)
- All testing to be completed against the live site https://cryptowat.ch

## Test Items
- Live site: https://cryptowat.ch
- N.B: At this point in time:
  - there is no access to the user db to verify user creation against the source of truth

## Features to Test
- Account Creation
- New Account Email is sent 
- Able to navigate to Documentation explaining importing API Keys from other exchanges
- Sign In with in valid account

## Features Not to Test
- Upgrading to Premium Account
- Updating Account details
- Obtaining API keys

## Test Approach
### Test Levels
- Normally there are around 4 test levels: Component (Unit), Integration, System and Smoke
  - Component: To be completed by unit tests within code repos
  - Integration: To be performed on the dev/test/stage environments with manual & automated tests
  - System: To be completed on test/stage environments
  - UAT: To be completed on the stage & prod environments
- Only basic functional testing will be performed
  - There is no access to code for lower-level Unit or Integration testing
- Only basic non-functional testing will be performed

### Functional Tests
|            | Component | Integration | System | UAT            |
| ---------- | --------- | ----------- | ------ | -------------- |
| Static     | N/A       |             |        | (code review)  |
| Happy Path | N/A       | N/A         | N/A    | Yes (testcafe) |
| Negative   | N/A       | N/A         | N/A    | Yes (testcafe) |
| Regression | N/A       | N/A         | N/A    | Yes (testcafe) |
| API        |           | N/A         | N/A    | No  (jest)     |
       
### Non-Functional Tests
|              | Component | Integration | System | UAT                     |
| ------------ | --------- | ----------- | ------ | ----------------------- |
| Performance  |           |             | N/A    | Yes (via sitespeed.io)  |
| Security     |           |             | N/A    | Yes (via zap proxy )    |
| Accesibility |           |             | N/A    | Yes (via pa11y.org)     |
| Load         |           |             | N/A    | No  (via artillery.io ) |

## Entry & Exit Criteria
- Entry:
  - Working, stable deployment of the application on each given environment
- Exit:
  - All test cases passing 

## Test Deliverables
- Test Cases
- Automated Regression Tests

## Environments
- There should be 3-4 environments:
  - Dev
  - Test/Integration
  - Stage/UAT 
  - Prod
- For the sake of this testing, we will only consider Prod - because that is the only environment currently accessible from outside

## Approvals
- QA Lead
- Dev Lead
- Architecture Lead
