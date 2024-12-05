# powershell_prompt.ps1
# Carlos Valdez
#
# Find their profile using `$PROFILE`.

function prompt {
    $gitBranch = git rev-parse --abbrev-ref HEAD
    $currentPath = $executionContext.SessionState.Path.CurrentLocation.ToString();

    if ($currentPath.Contains("/Users/$(whoami)")) {
        $currentPath = $currentPath.Replace("/Users/$(whoami)", "~");
    }

    Write-Host ("$(whoami)($($currentPath))") -NoNewLine -ForegroundColor Green

    if ($gitBranch) {
        Write-Host (" ($($gitBranch))") -ForegroundColor Yellow -NoNewLine
    }

    
    Write-Host (" >") -NoNewLine -ForegroundColor White
    return " "
}
