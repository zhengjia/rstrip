Feature: Config
  In order to use rstrip
  I have to have a .rstrip in the current directory or my home directory

  Scenario: Generate the .rstrip in the current directory
    When I run `rstrip config generate`
    Then a file named ".rstrip" should exist
      And the file ".rstrip" should contain "rb"
      And the file ".rstrip" should contain "erb"

  Scenario: Prompt to run the generator
    When I run `rstrip config show`
    Then the output should contain "Please run 'rstrip config generate'"

  Scenario: Show the list of files that will be operated on
    Given a file named ".rstrip" with:
    """
      rb
      erb
    """
    Given an empty file named "lib/dummy.rb"
    Given an empty file named "dummy.erb"
    When I run `rstrip config show`
    Then the output should contain "in the current directory"
     And the stdout should contain "lib/dummy.rb"
     And the stdout should contain "dummy.erb"

   Scenario: Don't show the files that's not in .rstrip
     Given a file named ".rstrip" with:
     """
       rb
     """
     Given an empty file named "lib/dummy.rb"
     Given an empty file named "dummy.erb"
     When I run `rstrip config show`
      And the stdout should contain "lib/dummy.rb"
      And the stdout should not contain "dummy.erb"