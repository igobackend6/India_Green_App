$features = @("agrimart", "ai_doctor", "dashboard", "finance", "home", "jobs", "learning", "mandi_pricing", "notifications", "onboarding", "opportunities", "profile", "splash", "vendor")

foreach ($feature in $features) {
    $basePath = "e:\india_green_app\lib\features\$feature"
    
    $dirs = @(
        "$basePath\domain\entities",
        "$basePath\domain\repositories",
        "$basePath\domain\usecases",
        "$basePath\data\models",
        "$basePath\data\datasources",
        "$basePath\data\repositories",
        "$basePath\presentation\screens",
        "$basePath\presentation\widgets",
        "$basePath\presentation\providers"
    )

    foreach ($dir in $dirs) {
        if (-not (Test-Path $dir)) {
            New-Item -ItemType Directory -Force -Path $dir | Out-Null
            $placeholderPath = Join-Path -Path $dir -ChildPath "placeholder.dart"
            Set-Content -Path $placeholderPath -Value "// Placeholder"
        }
    }
}
