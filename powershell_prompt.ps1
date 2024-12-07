# powershell_prompt.ps1
# The next few lines sets a custom prompt for PowerShell.
# https://github.com/calejvaldez/custom-prompts/

function prompt {
    $gitBranch = git rev-parse --abbrev-ref HEAD
	$username = $Env:UserName
    $currentPath = $executionContext.SessionState.Path.CurrentLocation.ToString();

    if ($currentPath.Contains("C:\Users\$($username)")) {
        $currentPath = $currentPath.Replace("C:\Users\$($username)", "~");
    }

    Write-Host ("$($username)($($currentPath))") -NoNewLine -ForegroundColor Green

    if ($gitBranch) {
        Write-Host (" git($($gitBranch))") -ForegroundColor Yellow -NoNewLine
    }

    
    Write-Host (" >") -NoNewLine -ForegroundColor White
    return " "
}
