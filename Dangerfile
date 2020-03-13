# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
=begin
declared_trivial = github.pr_title.include? "#trivial"


# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
#warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]" # [!] Invalid `Dangerfile` file: undefined local variable or method `github' for #<Danger::Dangerfile:0x00007ff20a1ffd48>
=end

# Warn when there is a big PR

message("Hello, Dangerfile is launched")

warn("⚠️ Too big PR") if git.lines_of_code > 70

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1




# Ensure a clean commits history
#if git.commits.any? { |c| c.message =~ /^Merge branch '#{github.branch_for_base}'/ }
#  fail "Please rebase to get rid of the merge commits in this PR"
#end

# Mainly to encourage writing up some reasoning about the PR, rather than
# just leaving a title
#if github.pr_body.length < 5
#  fail "Please provide a summary in the Pull Request description"
#end

# If these are all empty something has gone wrong, better to raise it in a comment
if git.modified_files.empty? && git.added_files.empty? && git.deleted_files.empty?
  fail "This PR has no changes at all, this is likely an issue during development."
end

has_app_changes = !git.modified_files.grep(/KanjiList/).empty?
has_test_changes = !git.modified_files.grep(/KanjiListTests/).empty?

# If changes are more than 10 lines of code, tests need to be updated too
if has_app_changes && !has_test_changes && git.lines_of_code > 10
  fail("Tests were not updated", sticky: false)
end

# Info.plist file shouldn't change often. Leave warning if it changes.
is_plist_change = git.modified_files.sort == ["KanjiList/Info.plist"].sort

if !is_plist_change
  warn "Plist changed, don't forget to localize your plist values"
end

podfile_updated = !git.modified_files.grep(/Podfile/).empty?

# Leave warning, if Podfile changes
if podfile_updated
  warn "The `Podfile` was updated"
end

# This is swiftlint plugin. More info: https://github.com/ashfurrow/danger-swiftlint
#
# This lints all Swift files and leave comments in PR if
# there is any issue with linting
#swiftlint.lint_files inline_mode: true
