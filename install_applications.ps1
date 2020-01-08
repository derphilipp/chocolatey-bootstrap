param([string]$install="minimal")

$minimal = @(
    "7zip.install"
    "bitwarden"
    "discord.install"
    "ditto"
    "firefox"
    "git.install"
    "googlechrome"
    "greenshot"
    "dosbox"
    "vscode"
    "dbgl"
    "chocolateygui"
    "filezilla"
    "obs-studio"
    "spotify"
    "steam"
    "sysinternals"
    "epicgameslauncher"
    "nextcloud-client"
    "streamlabs-obs"
    "scummvm"
    "vlc"
)

$selfupdating = @(
    "bitwarden"
    "discord.install"
    "filezilla"
    "Firefox"
    "GoogleChrome"
    "steam"
    "uplay"
    "vscode"
)

switch ($install) {
    "minimal" { $apps = $minimal }
    Default { $apps = $minimal }
}

foreach ($app in $apps) {
    choco.exe install -y $app
}

foreach ($app in $selfupdating) {
    if (Test-Path -Path "C:\ProgramData\chocolatey\lib\$app") {
        Remove-Item -Path "C:\ProgramData\chocolatey\lib\$app" -Recurse -Force
    }
}
