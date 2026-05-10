Feature: Sandbox feature

    Scenario: User can see feature ui
        Given the sandbox is running
        Then I see <text> text
            | text                                                                                                                              |
            | 'Home'                                                                                                                            |
            | 'Check out our new rick and morty list!'                                                                                          |
            | 'This characters feature demonstrates work with API, fetching paginated list of Rick and morty characters'                        |
            | 'Pass your knowledge quiz!'                                                                                                       |
            | 'This quiz feature demonstrates internal navigation (flow), and global custom presentation (confetti) if u finish it succesfully' |
            | 'Make custom failure api call'                                                                                                    |
            | 'Make failure api call'                                                                                                           |
            | 'This card onTap logic makes an api call which always fails - and it demostrates how Presenter handles default exceptions'        |

    Scenario Outline: User can't see parts of feature ui if disabled
        Given the sandbox is running <scenario>
        Then I don't see <missing> texts
        Examples:
            | scenario                        | missing                                                                                                                                                         |
            | isRickAndMortyAvailable: false  | ['Check out our new rick and morty list!','This characters feature demonstrates work with API, fetching paginated list of Rick and morty characters']           |
            | isQuestionnaireAvailable: false | ['Pass your knowledge quiz!','This quiz feature demonstrates internal navigation (flow), and global custom presentation (confetti) if u finish it succesfully'] |

    Scenario Outline: User clicks on api call cards
        Given the sandbox is running
        When I tap <card> text
        And I wait
        Then I see <toast> text
        Examples:
            | card                           | toast                                     |
            | 'Make failure api call'        | 'Something went wrong!'                   |
            | 'Make custom failure api call' | 'We intercepted custom exception here :)' |

    Scenario: User navigates to rick and morty feature
        Given the sandbox is running
        When I tap {'Check out our new rick and morty list!'} text
        Then I am navigated to {rickAndMorty: true} feature

    Scenario: User navigates to questionnaire feature
        Given the sandbox is running
        When I tap {'Pass your knowledge quiz!' } text
        Then I am navigated to {questionnaire: true} feature

    Scenario Outline: User is congratulated on navigation from questionnaire feature
        Given the sandbox is running <scenario>
        When I tap {'Pass your knowledge quiz!' } text
        Then I see <toast> text
        Examples:
            | scenario                   | toast                  |
            | passedQuestionnaire: false | 'Good luck next time!' |
            | passedQuestionnaire: true  | 'Good Job!'            |
