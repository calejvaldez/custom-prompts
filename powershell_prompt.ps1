# powershell_prompt.ps1
# Carlos Valdez
#
# Find their profile using `$PROFILE`.

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
