Param([string]$VcpkgRoot = "")

$ErrorActionPreference = "Stop"

if (!$VcpkgRoot) {
    $VcpkgRoot = ".."
}

$VcpkgRoot = Resolve-Path $VcpkgRoot

if (!(Test-Path "$VcpkgRoot\.vcpkg-root")) {
    throw "Invalid vcpkg instance, did you forget -VcpkgRoot?"
}

Set-Content -Path "$PSScriptRoot\_includes\commands.md" -Value ""

ls "$VcpkgRoot\scripts\cmake\*.cmake" | % {
    $contents = Get-Content $_ `
    | ? { $_ -match "^## |^##`$" } `
    | % { $_ -replace "^## ?","" }

    if ($contents) {
        Set-Content -Path "$PSScriptRoot\cmake\$($_.BaseName).md" -Value $contents
        "- [$($_.BaseName -replace "_","\_")](cmake/$($_.BaseName).html)" `
        | Out-File -Enc Ascii -Append -FilePath "$PSScriptRoot\_includes\commands.md"
    }
}
