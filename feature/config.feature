Feature: Config
  In order to use rstrip
  I have to have a .rstrip in the current directory or my home directory

  Scenario: Generate the .rstrip in the current directory
    When I run `rstrip config generate`
    Then a file named ".rstrip" should exist
      And the file ".rstrip" should contain "rb"
      And the file ".rstrip" should contain "erb"

  Scenario: Prompt to run the generator
    When I run `rstrip config list`
    Then the output should contain "Please run 'rstrip config generate'"

  Scenario: Show the list of files that will be operated on
    Given a file named ".rstrip" with:
    """
      rb
      erb
    """
    Given an empty file named "lib/dummy.rb"
    Given an empty file named "dummy.erb"
    When I run `rstrip config list`
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
     When I run `rstrip config list`
      And the stdout should contain "lib/dummy.rb"
      And the stdout should not contain "dummy.erb"

    Scenario: Run rstrip should remove the last new lines
      Given a file named ".rstrip" with:
      """
        rb
      """
      Given a file named "lib/dummy.rb" with:
      """
       def a
         puts 'hello'
       end


      """
      When I run `rstrip process`
       Then the stdout should contain "process lib/dummy.rb"
       And a file named "lib/dummy.rb" should exist
       And the file "lib/dummy.rb" should contain exactly:
       """
        def a
          puts 'hello'
        end
       """