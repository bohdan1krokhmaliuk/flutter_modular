import 'package:design_system/design_system.dart';
import '../utils/scenarios.dart';

Feature: Questionarrie feature

    Scenario: User can see wellcome page
        Given the flow is running
        Then I see <text> text
            | text                                                                                                                                                                        |
            | 'Ready to test your knowledge?'                                                                                                                                             |
            | "Welcome to the quiz! These questions are designed to help you reinforce what you've learned and discover new insights. Take your time and focus on the details. Good luck" |
        And I see {Illustrations.custom.questionnaire()} illustration
        And I see {enabled: true} button with {'Start quiz'} text

    Scenario: User can see error popup when failed to load questions
        Given the flow is running {scenario: failureQuestionsScenario}
        When I tap {'Start quiz'} text
        Then I see {'Something went wrong!'} text

    Scenario: User opens questions
        Given the flow is running
        When I tap {'Start quiz'} text
        Then I see <text> text
            | text      |
            | '2 + 2 =' |
            | '4'       |
            | '13'      |
        And I see {enabled: false} button with {'Next'} text

    Scenario Outline: User selects any option and button becomes active
        Given the flow is running
        When I tap {'Start quiz'} text
        And I tap <text> text
        Then I see {enabled: true} button with {'Next'} text
        Examples:
            | text |
            | '4'  |
            | '13' |

    Scenario: User proceeds to next (final) question
        Given the flow is running
        When I tap {'Start quiz'} text
        And I tap {'4'} text
        And I tap {'Next'} text
        Then I see <text> text
            | text               |
            | 'General question' |
            | 'Correct answer'   |
            | 'Invalid answer'   |
        And I see {enabled: false} button with {'Next'} text

    Scenario: User selects option on final question
        Given the flow is running
        When I tap {'Start quiz'} text
        And I tap {'4'} text
        And I tap {'Next'} text
        And I tap {'Correct answer'} text
        Then I see {enabled: true} button with {'Submit'} text

    Scenario: User answers questions correctly
        Given the flow is running
        When I tap {'Start quiz'} text
        And I tap {'4'} text
        And I tap {'Next'} text
        And I tap {'Correct answer'} text
        And I tap {'Submit'} text
        Then I see <text> text
            | text                                                                                                                                                                  |
            | 'Fantastic Job! 🎉'                                                                                                                                                   |
            | "You've successfully completed the quiz! You've shown great dedication and a solid grasp of the material. Take a moment to celebrate your progress—you've earned it!" |
        And I see {enabled: true} button with {'Close'} text

    Scenario Outline: User answers questions incorrectly
        Given the flow is running
        When I tap {'Start quiz'} text
        And I tap <fisrtAnswer> text
        And I tap {'Next'} text
        And I tap <finalAnswer> text
        And I tap {'Submit'} text
        Then I see <text> text
            | text                                                                                                                                                   |
            | 'Not Quite There Yet ✨'                                                                                                                                |
            | "Good effort! You've completed the session, but there's still room to grow. Review your results below and give it another shot whenever you're ready." |
        And I see {enabled: true} button with {'Close'} text
        And I see {enabled: true} button with {'Try again'} text
        Examples:
            | fisrtAnswer | finalAnswer      |
            | '13'        | 'Correct answer' |
            | '4'         | 'Invalid answer' |
            | '13'        | 'Invalid answer' |

    Scenario: User answers questions incorrectly and fixes it
        Given the flow is running
        When I tap {'Start quiz'} text
        And I tap {'13'} text
        And I tap {'Next'} text
        And I dismiss the page
        And I tap {'4'} text
        And I tap {'Next'} text
        And I tap {'Correct answer'} text
        And I tap {'Submit'} text
        Then I see <text> text
            | text                                                                                                                                                                  |
            | 'Fantastic Job! 🎉'                                                                                                                                                   |
            | "You've successfully completed the quiz! You've shown great dedication and a solid grasp of the material. Take a moment to celebrate your progress—you've earned it!" |
        And I see {enabled: true} button with {'Close'} text

    Scenario: User answers questions incorrectly and tries again
        Given the flow is running
        When I tap {'Start quiz'} text
        And I tap {'13'} text
        And I tap {'Next'} text
        And I tap {'Invalid answer'} text
        And I tap {'Submit'} text
        And I tap {'Try again'} text
        Then I see <text> text
            | text      |
            | '2 + 2 =' |
            | '4'       |
            | '13'      |
        And I see {enabled: false} button with {'Next'} text

    Scenario Outline: User closes results page and quiz page finishes (close button)
        Given the flow is running
        When I go thorugh quiz with <correct> answers
        And I tap {'Close'} text
        Then page closes with <result> result
        Examples:
            | correct        | result |
            | correct: true  | true   |
            | correct: false | false  |

    Scenario Outline: User closes results page and quiz page finishes (back button)
        Given the flow is running
        When I go thorugh quiz with <correct> answers
        And I dismiss the page
        Then page closes with <result> result
        Examples:
            | correct        | result |
            | correct: true  | true   |
            | correct: false | false  |

    Scenario: User submits answers but be failure happens
        Given the flow is running {scenario: failureAnswersScenario}
        When I go thorugh quiz with {correct: true} answers
        Then I see {'Something went wrong!'} text