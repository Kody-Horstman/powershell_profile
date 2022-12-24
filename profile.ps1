
# clear ugly default color formatting
$psstyle.FileInfo.Directory = ""
$psstyle.FileInfo.Executable = ""
$psstyle.FileInfo.SymbolicLink  = "" 
$PSStyle.FileInfo.Extension.Clear()
$PSStyle.Formatting.TableHeader = ""
$PsStyle.Formatting.FormatAccent = ""

# override Prompt function
function Prompt {
    # Bash-like
    $isAdministrator = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')
    $currentDir = $pwd.Path.Replace($env:USERPROFILE, "~")
    $currentUser = $env:USERNAME

    $color = Get-Random -Min 1 -Max 16

	$prefix = ''
	if ($isAdministrator) {
		$prefix = 'ADMIN: '
	}
	#$Host.UI.RawUI.WindowTitle = "$prefix$(Split-Path $currentDir -Leaf)"

	$prompt = '$'
	if ($isAdministrator) {
		$prompt = '#'
	}
    Write-Host "$currentUser $currentDir" -NoNewLine -ForegroundColor $Color
	return "$prompt "


    # Default
    # $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
    #   else { '' }) + 'PS ' + $(Get-Location) +
    #     $(if ($NestedPromptLevel -ge 1) { '>>' }) + '> '
} 