# Script Author: Sagi Dahan
# Description: This script checks the GlobalProtect configured portals.
# **Tested on GlobalProtect v6.2.0.

# Path to the GlobalProtect registry key for settings
$gpSettingsRegistryPath = "HKCU:\Software\Palo Alto Networks\GlobalProtect\Settings"

# Initialize an array to store portal names
$portals = @()

# Check if the registry path exists
if (Test-Path $gpSettingsRegistryPath) {
    # Get all subkeys under the Settings key
    $subkeys = Get-ChildItem -Path $gpSettingsRegistryPath
    if ($subkeys) {
        foreach ($subkey in $subkeys) {
            if ($subkey.PSChildName -notin @('Settings')) {
                $portals += $subkey.PSChildName
            }
        }

        # Format the portals as Server1: server#1.domain.com, Server2: server#2.domain.com...
        $formattedPortals = $portals | ForEach-Object { "Server$(( $portals.IndexOf($_) + 1 )): $_" }

        # Combine formatted portals into a single string
        $formattedPortalsString = "Configured GlobalProtect Portals: " + ($formattedPortals -join ", ")

        Write-Output $formattedPortalsString
    } else {
        Write-Output "No portals configured."
    }
} else {
    Write-Output "GlobalProtect is not installed or the registry path does not exist."
}

# Return the result for Intune detection
if ($portals.Count -gt 0) {
    exit 0 # Detection successful
} else {
    exit 1 # Detection failed
}
