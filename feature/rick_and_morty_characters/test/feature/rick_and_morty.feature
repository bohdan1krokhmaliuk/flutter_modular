import '../utils/scenarios.dart';

Feature: Rick and morty feature

    Scenario: User can see rick and morty characters list
        Given the feature is running
        Then I see {'Explore characters of R&M'} text
        And I see {['Character 1','Character 2','Character 3','Character 4','Character 5']} texts

    Scenario: User can see failure page
        Given the feature is running {scenario: failureScenario}
        Then I see <text> text
            | text                        |
            | 'Explore characters of R&M' |
            | 'Something went wrong!'     |
            | 'Retry'                     |

    Scenario: User retry on failure page
        Given the feature is running {scenario: failureScenario}
        When I tap {'Retry'} text
        And I wait
        Then I don't see {'Something went wrong!'} text
        And I see {['Character 1','Character 2','Character 3','Character 4','Character 5']} texts

    Scenario: User scrolls to bottom
        Given the feature is running
        When I scroll to bottom
        And I wait
        And I see {['Character 14','Character 15','Character 16','Character 17','Character 18','Character 19']} texts

    Scenario: User can see different contents
        Given the feature is running {scenario: successContentScenario}
        Then I see <text> text
            | text      |
            | 'Woman'   |
            | 'Man'     |
            | 'Alien'   |
            | 'Unknown' |
        And I see <icon> icon
            | icon                |
            | Icons.male          |
            | Icons.female        |
            | Icons.question_mark |
            | Icons.transgender   |


