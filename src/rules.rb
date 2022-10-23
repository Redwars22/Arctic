=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

$arrayAssignStatement = /.*[A-Za-z_]\[.*[0-9]\] <= .*/
$arrayRetrieveElement = /&.*[A-Za-z_]\[.*[0-9]\]/
$arrayStatement = /array .*[A-Za-z_] = \[.*[A-Za-z_0-9, \"]\]/
$assignTo = /[A-Za-z_] <= .*/
$awaitFunction = /await/
$codeBlock = /.*[A-Za-z_]: {/
$declarationStatement = /[A-Za-z_ !] = .*[A-Za-z0-9_ ]/
$deleteFunction = /destroy .*[A-Za-z_]/
$functionCallStatement = /.*[A-Za-z_]\(\)/
$functionStatement = /function .*[A-Za-z_] {/
$ifStatementRule = /if .* {/ 
$printFunction = /display .*[\"\"A-Za-z0-9!]/
$promptFunction = /prompt .*[A-Za-z_]/
$returnCommand = /return/
$singleLineComment = /\/\/./
$stopCommand = /stop/
