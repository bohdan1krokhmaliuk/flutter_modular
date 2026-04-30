Feature: Presenter feature

    Scenario: User can see unknow error toast
        Given the presenter is running
        And I trigger presentation {unknownError: true}
        Then I see {'Something went wrong!'} text

    Scenario: User defines custom toast presentation
        Given the presenter is running
        And I trigger presentation {custom: true}
        Then I see {'My custom presentation'} text
