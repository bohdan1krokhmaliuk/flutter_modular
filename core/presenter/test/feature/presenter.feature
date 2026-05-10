import 'package:flutter_confetti/flutter_confetti.dart';

Feature: Presenter feature

    Scenario: User can see unknow error toast
        Given the presenter is running
        And I trigger presentation {unknownError: true}
        Then I see {'Something went wrong!'} text

    Scenario: User can see confetti
        Given the presenter is running
        And I trigger presentation {confetti: true}
        Then I see multiple {Confetti} widgets

    Scenario: User defines custom toast presentation
        Given the presenter is running
        And I trigger presentation {custom: true}
        Then I see {'My custom presentation'} text
