# GlobalProtect-Portal-Detection
## Description

This PowerShell script checks the GlobalProtect configured portals in the Windows registry. It is designed to be used as an Intune Detection Script to verify the presence and configuration of GlobalProtect portals.

## Author

Sagi Dahan

## Requirements

- Windows operating system
- PowerShell
- GlobalProtect installed

## How to Implement

### Through Intune Detection Script

1. **Save the Script:**
   - Save the PowerShell script as `GlobalProtectPortalsDetection.ps1`.

2. **Log in to the Intune Admin Center:**
   - Go to the Microsoft Endpoint Manager admin center.

3. **Create a New Script:**
   - Navigate to `Devices` > `Scripts and remediations` > `Create`.

4. **Upload the Script:**
   - Select `Create` and choose `Windows 10 and later` as the platform.
   - Give the script a name and description.
   - Upload the `GlobalProtectPortalsDetection.ps1` script file to 'Detection script file'.

5. **Configure Script Settings:**
   - Set the `Script settings` as per your requirements.
   - Ensure `Run this script using the logged on credentials` is set to `Yes` because the script requires user-level access to the registry.

6. **Assign the Script:**
   - Assign the script to the appropriate device groups.

7. **Monitor Script Deployment:**
   - Monitor the deployment status through the Intune admin center.

## Script Details

### Registry Path

The script checks the following registry path for GlobalProtect settings:
HKCU:\Software\Palo Alto Networks\GlobalProtect\Settings

### Output and Exit Codes

- If portals are found, the script logs the details and exits with code `0` (detection successful).
- If no portals are found or the registry path does not exist, the script logs an appropriate message and exits with code `1` (detection failed).

## Notes

- Customize the script as needed to fit your specific environment and requirements.

## Recommendation
- Try this script in your machine only before deploy it to many devices.

## Disclaimer

This script is provided "as is" without any warranty of any kind, either express or implied, including but not limited to the implied warranties of merchantability and fitness for a particular purpose. The author is not responsible for any damage or issues that may arise from using this script. Use at your own risk.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

**Sagi Dahan**

- GitHub: [github.com/sagid654](https://github.com/sagid654)
- LinkedIn: [linkedin.com/in/sagidahan](https://www.linkedin.com/in/sagidahan/)

For any inquiries or further information, please contact me through GitHub or LinkedIn.

Thank you for using this project. Your feedback and contributions are highly appreciated!
