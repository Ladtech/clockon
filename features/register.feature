Feature: When using the link sent out to you a days entry is added to FreeAgent, simple as that :)

  Scenario: Using the link
    Given I go to '/register/leon/20131230'
    Then leon should be registered for 2013-12-30 in FreeAgent