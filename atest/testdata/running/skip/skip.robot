*** Settings ***
Library            skiplib.py

*** Variables ***
${TEST_OR_TASK}    Test

*** Test Cases ***
Skip keyword
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skipped with Skip keyword.
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Skip
    Fail    Should be executed!

Skip with SkipExecution exception in library
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Show must not got on
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Skip with Message    Show must not got on
    Fail    Should be executed!

Skip with SkipExecution exception in library using HTML
    [Documentation]    FAIL *HTML* Skip occurred:
    ...
    ...     Show <b>must</b> not got on
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Skip with Message    Show <b>must</b> not got on    html=True
    Fail    Should be executed!

Skip with custom exception
    [Documentation]    SKIP CustomSkipException: Skipped with custom exception.
    Skip with custom exception

Skip If Keyword with True Condition
    [Documentation]    FAIL Skip occurred:
    ...
    ...    1 == 1
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Skip If    1 == 1
    Fail    Should be executed!

Skip If Keyword with True Condition And Custom Message
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skipped with abandon.
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Skip If    1 == 1    Skipped with abandon.
    Fail    Should be executed!

Skip If Keyword with False Condition
    [Documentation]    FAIL Should be executed!
    Skip If    1 == 2
    Fail    Should be executed!

Skip Keyword with Custom Message
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skipped due to reasons
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Skip    Skipped due to reasons
    Fail    Should be executed!

Skip in Setup
    [Documentation]    SKIP Setup skip
    [Setup]    Skip    Setup skip
    Fail    Should not be executed!

Remaining setup keywords aren't run after skip
    [Documentation]    SKIP Skip between keywords
    [Setup]    Skip with keywords before and after
    Fail    Should not be executed!

Skip in Teardown
    [Documentation]    SKIP Teardown skip
    No operation
    [Teardown]    Skip    Teardown skip

Remaining teardown keywords aren't run after skip
    [Documentation]    SKIP Skip between keywords
    No operation
    [Teardown]    Skip with keywords before and after

Skip in Teardown After Failure In Body
    [Documentation]    SKIP
    ...    Skipped in teardown:
    ...    Teardown skip
    ...
    ...    Earlier message:
    ...    Failure in body!
    Fail    Failure in body!
    [Teardown]    Skip    Teardown skip

Teardown is executed after skip
    [Documentation]    SKIP Skip in body
    Skip    Skip in body
    [Teardown]    Log    Teardown is executed!

Fail in Teardown After Skip In Body
    [Documentation]    SKIP
    ...    Skip in body
    ...
    ...    Also teardown failed:
    ...    Teardown failed!
    Skip    Skip in body
    [Teardown]    Fail    Teardown failed!

Skip in Teardown After Skip In Body
    [Documentation]    SKIP
    ...    Skipped in teardown:
    ...    Teardown skip
    ...
    ...    Earlier message:
    ...    Skip in body
    Skip    Skip in body
    [Teardown]    Skip    Teardown skip

Skip After Continuable Failure
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skip wins over failure!
    ...
    ...    Also failure occurred:
    ...
    ...    We can continue!
    Run Keyword And Continue On Failure
    ...    Fail    We can continue!
    Skip    Skip wins over failure!
    Pass Execution    Should not be executed!

Skip After Multiple Continuable Failures
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skip is just a skip!!
    ...
    ...    Also failures occurred:
    ...
    ...    1) We can continue!
    ...
    ...    2) We can continue again!
    ...
    ...    3) Should not be executed!
    Run Keyword And Continue On Failure
    ...    Fail    We can continue!
    Run Keyword And Continue On Failure
    ...    Fail    We can continue again!
    Skip    Skip is just a skip!!
    Fail    Should not be executed!

Skip After Continuable Failure with HTML Message
    [Documentation]    FAIL *HTML* Skip occurred:
    ...
    ...    Skipeti &lt;b&gt;skip&lt;/b&gt;
    ...
    ...    Also failure occurred:
    ...
    ...    We <b>can</b> continue!
    Run Keyword And Continue On Failure
    ...    Fail    *HTML* We <b>can</b> continue!
    Skip    Skipeti <b>skip</b>

Skip After Multiple Continuable Failure with HTML Messages
    [Documentation]    FAIL *HTML* Skip occurred:
    ...
    ...    Skipeti <b>skip</b>
    ...
    ...    Also failures occurred:
    ...
    ...    1) We <b>can</b> continue!
    ...
    ...    2) Can continue also without &lt;b&gt;HTML&lt;/b&gt;
    ...
    ...    3) Continuing again with <b>HTML</b>
    [Tags]    robot: continue-on-failure
    Fail    *HTML* We <b>can</b> continue!
    Fail    Can continue also without <b>HTML</b>
    Fail    *HTML* Continuing again with <b>HTML</b>
    Skip    *HTML* Skipeti <b>skip</b>

Skip in Teardown After Continuable Failures
    [Documentation]    SKIP
    ...    Skipped in teardown:
    ...    Teardown skip
    ...
    ...    Earlier message:
    ...    Several failures occurred:
    ...
    ...    1) We can continue!
    ...
    ...    2) We can continue again!
    Run Keyword And Continue On Failure
    ...    Fail    We can continue!
    Run Keyword And Continue On Failure
    ...    Fail    We can continue again!
    [Teardown]    Skip    Teardown skip

Skip with Pass Execution in Teardown
    [Documentation]    SKIP Skip in body
    Skip    Skip in body
    [Teardown]    Run Keywords
    ...    Pass Execution    Thou shall pass
    ...    AND
    ...    Fail    Should not be executed!

Skip in Teardown with Pass Execution in Body
    [Documentation]    SKIP Then we skip
    Pass Execution    First we pass
    [Teardown]    Skip  Then we skip

Skip with Run Keyword and Ignore Error
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skip from within
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Run Keyword and Ignore Error    Skip    Skip from within
    Fail    Should be executed!

Skip with Run Keyword and Expect Error
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skip from within
    ...
    ...    Also failure occurred:
    ...
    ...    Should be executed!
    Run Keyword and Expect Error    An error that never happens    Skip    Skip from within
    Fail    Should be executed!

Skip with Run Keyword and Return Status
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skip from within
    ...
    ...    Also failure occurred:
    ...
    ...    Should not be executed!
    Run Keyword and Return Status    Skip    Skip from within
    Fail    Should not be executed!

Skip with Wait Until Keyword Succeeds
    [Documentation]    FAIL Skip occurred:
    ...
    ...    Skip from within
    ...
    ...    Also failure occurred:
    ...
    ...    Should not be executed!
    Wait Until Keyword Succeeds    3x    1s
    ...    Skip    Skip from within
    Fail    Should not be executed!

Skipped with --skip
    [Documentation]    SKIP ${TEST_OR_TASK} skipped using '--skip' command line option.
    [Tags]    skip-this
    Fail

Skipped when test is tagged with robot:skip
    [Documentation]    SKIP
    ...    Test skipped using 'robot:skip' tag.
    [Tags]    robot:skip
    Fail      Test should not be executed

Skipped with --SkipOnFailure
    [Documentation]    SKIP
    ...    ${TEST_OR_TASK} failed but skip-on-failure mode was active and it was marked skipped.
    ...
    ...    Original failure:
    ...    Ooops, we fail!
    [Tags]    skip-on-failure
    Fail    Ooops, we fail!

Skipped with --SkipOnFailure when Failure in Test Setup
    [Documentation]    SKIP
    ...    ${TEST_OR_TASK} failed but skip-on-failure mode was active and it was marked skipped.
    ...
    ...    Original failure:
    ...    Setup failed:
    ...    failure in setup
    [Tags]    skip-on-failure
    [Setup]    Fail    failure in setup
    No Operation

Skipped with --SkipOnFailure when Failure in Test Teardown
    [Documentation]    SKIP
    ...    ${TEST_OR_TASK} failed but skip-on-failure mode was active and it was marked skipped.
    ...
    ...    Original failure:
    ...    Teardown failed:
    ...    failure in teardown
    [Tags]    skip-on-failure
    [Teardown]    Fail    failure in teardown
    No Operation

Skipped with --SkipOnFailure when Set Tags Used in Teardown
    [Documentation]    SKIP
    ...    ${TEST_OR_TASK} failed but skip-on-failure mode was active and it was marked skipped.
    ...
    ...    Original failure:
    ...    Ooops, we fail!
    Fail    Ooops, we fail!
    [Teardown]    Set Tags    skip-on-failure

Skipped although test fails since test is tagged with robot:skip-on-failure
    [Documentation]    SKIP
    ...    ${TEST_OR_TASK} failed but skip-on-failure mode was active and it was marked skipped.
    ...
    ...    Original failure:
    ...    We failed here, but the test is reported as skipped instead
    [Tags]  robot:skip-on-failure
    Fail   We failed here, but the test is reported as skipped instead

Failing Test
    [Documentation]    FAIL AssertionError
    Fail

Passing Test
    No Operation

Skip Template One Skip And Pass
    [Documentation]    PASS 1 == 1
    [Template]    Skip template one skip and pass
    1
    2

Skip Template Two Skips And Pass
    [Documentation]    PASS Skips occurred:
    ...
    ...    1) 2 == 2
    ...
    ...    2) 4 == 4
    [Template]    Skip template two skips and pass
    1
    2
    3
    4
    5

Skip Template Two Skips And Fail
    [Documentation]    FAIL Skips occurred:
    ...
    ...    0) 2 == 2
    ...
    ...    1) 4 == 4
    ...
    ...    Also failure occurred:
    ...
    ...    fail
    [Template]    Skip template two skips and fail
    1
    2
    3
    4
    5

Skip Template All Skips
    [Documentation]    SKIP Skips occurred:
    ...
    ...    0) skip
    ...
    ...    1) skip
    [Template]    Skip template all skips
    1
    2

*** Keywords ***
Skip with keywords before and after
    No Operation
    Skip    Skip between keywords
    Pass Execution    Should be executed!

Skip template all skips
    [Arguments]    ${num}
    Skip    skip

Skip template one skip and pass
    [Arguments]    ${num}
    Skip If    ${num} == 1

Skip template two skips and pass
    [Arguments]    ${num}
    Skip If    ${num} == 2
    Skip If    ${num} == 4

Skip template two skips and fail
    [Arguments]    ${num}
    Skip If    ${num} == 2
    Skip If    ${num} == 4
    Run Keyword If    ${num} == 5    Fail    fail
