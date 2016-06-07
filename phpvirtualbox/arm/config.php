<?php
/**
 * phpVirtualBox example configuration.
 * @version $Id: config.php-example 452 2012-10-17 12:22:12Z imooreyahoo@gmail.com $
 *
 * rename to config.php and edit as needed.
 *
 */
class phpVBoxConfig {

    public function __construct() {
        // getting servers array
        $this->servers = require __DIR__ . '/config-servers.php';
        // getting override settings
        $overrides = require __DIR__.'/config-override.php';
        foreach ($overrides as $key => $value) {
            $this->$key = $value;
        }
    }

    /* Username / Password for system user that runs VirtualBox */
    var $username = '';
    var $password = '';

    /* SOAP URL of vboxwebsrv (not phpVirtualBox's URL) */
    var $location = 'http://127.0.0.1:18083/';

    /* Default language. See languages folder for more language options.
     * Can also be changed in File -> Preferences -> Language in
     * phpVirtualBox.
     */
    var $language = 'en';

    /* Set the standard VRDE Port Number / Range, e.g. 1010-1020 or 1027 */
    var $vrdeports = '9000-9100';

    /*
     *
     * Not-so-common options / tweaking
     *
     */

    // Multiple servers example config. Uncomment (remove /* and */) to use.
    // Add ALL the servers you want to use. Even if you have the server set
    // above. The default server will be the first one in the list.

    /*
    var $servers = array(
            array(
                    'name' => 'London',
                    'username' => 'user',
                    'password' => 'pass',
                    'location' => 'http://192.168.1.1:18083/',
                    'authMaster' => true // Use this server for authentication
            ),
            array(
                    'name' => '',
                    'username' => 'user2',
                    'password' => 'pass2',
                    'location' => 'http://192.168.1.2:18083/'
            ),
    );
    */

    // Disable authentication
    var $noAuth = true;

    // Host / ip to use for console connections
    #var $consoleHost = '192.168.1.40';

    // Disable "preview" box
    #var $noPreview = true;

    // Default preview box update interval in seconds
    #var $previewUpdateInterval = 30;

    // Preview box pixel width
    #var $previewWidth = 180;

    // Max number of progress operations to keep in list
    var $maxProgressList = 5;

    // Change default preview aspect ratio to 1.
    // http://www.wikipedia.org/wiki/Aspect_ratio_%28image%29#Previous_and_presently_used_aspect_ratios
    #var $previewAspectRatio = 1.6;

    // Enable custom VM icons
    #var $enableCustomIcons = true;

    /*
    Exclusively use phpVirtualBox's groups configuration rather than VirtualBox groups.
    This has the following effects:

    *) Group changes made in phpVirtualBox will not be reflected in VirtualBox programs such as
    	VirtualBox and VBoxManage
    *) Group changes will not affect which folder a VM is placed in
    *) You can rename groups that contain running VMs and move / copy running VMs to groups
    */
    #var $phpVboxGroups = true;


    /*
    Allow to prompt deletion hard disk files on removal from Virtual Media Manager.
    If this is not set, files are always kept. If this is set, you will be PROMPTED
    to decide whether or not you would like to delete the hard disk file(s) when you
    remove a hard disk from virtual media manager. You may still choose not to delete
    the file when prompted.
    */
    var $deleteOnRemove = true;

    /*
     * File / Folder browser settings
     */

    // Restrict file types
    var $browserRestrictFiles = array('.iso','.vdi','.vmdk','.img','.bin','.vhd','.hdd','.ovf','.ova','.xml','.vbox','.cdr','.dmg','.ima','.dsk','.vfd');

    // Restrict locations / folders
    var $browserRestrictFolders = array('/'); // Or something like array('/home/vbox','/var/ISOs')

    // Force use of local, web server based file browser instead of going through vboxwebsrv
    #var $browserLocal = true;

    // Disable file / folder browser.
    #var $browserDisable = true;

    // Disable Windows drive detection
    #var $noWindowsDriveList = true;

    // Just list all drives from C:\ - Z:\ without checking if they exist or not.
    // This may be required on older Windows systems with more than one drive.
    #var $forceWindowsAllDriveList = true;

    /*
     * Misc
     */

    /*
     * Auto-refresh interval in seconds for VirtualBox host memory usage information.
     * Any value below 3 will be ignored.
     */
    var $hostMemInfoRefreshInterval = 5;

    /* Show % of free host memory instead of % used */
    #var $hostMemInfoShowFreePct = true;

    /*
     * VM Memory warnings.
     *
     * If $vmMemoryStartLimitWarn is enabled, each time a VM is started through
     * phpVirtualBox, it will check that the available host memory is greater than
     * the base and video memory of the VM + 50MB (a little bit of overhead). If it
     * is not, a confirmation dialog will be presented to confirm that you want to
     * start the VM.
     *
     * If $vmMemoryOffset is set (and $vmMemoryStartLimitWarn), $vmMemoryOffset
     * megabytes is subtracted from the available host memory before the check is
     * performed by $vmMemoryStartLimitWarn logic. For instance it may be a good
     * idea to always have VM memory requirements + 100MB free. 100 is the default.
     */
    #var $vmMemoryStartLimitWarn = true;
    #var $vmMemoryOffset = 100;


    /*
     * Display guest additions version of a running VM on its Details tab
     */
    #var $enableGuestAdditionsVersionDisplay = true;

    /* Disable any of phpVirtualBox's main tabs */
    #var $disableTabVMSnapshots = true; // Snapshots tab
    #var $disableTabVMConsole = true; // Console tab

    /* Screen resolutions for console tab */
    var $consoleResolutions = array('640x480','800x600','1024x768','1280x720','1440x900');

    /* Console tab keyboard layout. Currently Oracle's RDP client only supports EN and DE. */
    var $consoleKeyboardLayout = 'EN';

    /* Max number of network cards per VM. Do not set above VirtualBox's limit (typically 8) or below 1 */
    var $nicMax = 4;

    /* Enable advanced configuration items (normally hidden in the VirtualBox GUI)
     * Note that some of these items may not be translated to languages other than English.
     */
    #var $enableAdvancedConfig = true;

    /* Enable startup / shutdown configuration.
     * This only works in linux and you must add the vboxinit file to
     * your startup scripts list.
     */
    #var $startStopConfig = true;

    // Authentication library.
    var $authLib = 'Builtin';

    // VM ownership
    #var $enforceVMOwnership = true;

    // Per-user VM quota
    #var $vmQuotaPerUser = 2;


    // Allow VDE network configuration. This must be supported by the underlying VirtualBox installation!
    // If you do not know what VDE networking is - you do not need it, it is probably not supported by your
    // VirtualBox installation and will cause errors if enabled.
    #var $enableVDE = true;

    // Disable setting SATA controllers port count to the max port number found when saving VMs.
    #var $disableSataPortCount = true;

    /* Enable Parallel Port configuration - EXPERIMENTAL
    LPT support may or may not work for you.
    !!! VirtualBox LPT support only works in Linux. !!!
    */
    #var $enableLPTConfig = true;

    /* Enable HardDisk IgnoreFlush configuration. This controls the "ExtraData" setting
     * in "VBoxInternal/Devices/[controller type]/0/LUN#[x]/Config/IgnoreFlush". See
     * Responding to guest IDE/SATA flush requests at:
     * http://www.virtualbox.org/manual/ch12.html#idp12757424
    */
    #var $enableHDFlushConfig = true;


    /* END SETTINGS  */


}
