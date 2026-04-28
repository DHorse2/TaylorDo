// Source GitHub Milosz Krajewski
// <script src="https://gist.github.com/MiloszKrajewski/352dc8b8eb132d3a2bc7.js"></script>
//
using System;
using System.Management;

struct DriveItem
{
	String deviceId; // format?
	String physicalName; // \\.\PHYSICALDRIVE2
	String diskName; // WDC WD5001AALS-xxxxxx
	String diskModel; // WDC WD5001AALS-xxxxxx
	String diskInterface; // IDE
	UInt16 capabilities; // 3,4 - random access, supports writing
	bool mediaLoaded; // bool
	String mediaType; // Fixed hard disk media
	UInt32 mediaSignature; // int32
	String mediaStatus; // OK

	String driveName; // C:
	String driveId; // C:
	bool driveCompressed;
	UInt32 driveType; // C: - 3
	String fileSystem; // NTFS
	UInt64 freeSpace; // in bytes
	UInt64 totalSpace; // in bytes
	UInt32 driveMediaType; // c: 12
	String volumeName; // System
	String volumeSerial; // 12345678
}
//
DriveItem[] DriveItems;
//
var driveQuery = new ManagementObjectSearcher("select * from Win32_DiskDrive");
foreach (ManagementObject d in driveQuery.Get())
{
	var deviceId = d.Properties["DeviceId"].Value;
	//Console.WriteLine("Device");
	//Console.WriteLine(d);
	var partitionQueryText = string.Format("associators of {{{0}}} where AssocClass = Win32_DiskDriveToDiskPartition", d.Path.RelativePath);
	var partitionQuery = new ManagementObjectSearcher(partitionQueryText);
	foreach (ManagementObject p in partitionQuery.Get())
	{
		//Console.WriteLine("Partition");
		//Console.WriteLine(p);
		var logicalDriveQueryText = string.Format("associators of {{{0}}} where AssocClass = Win32_LogicalDiskToPartition", p.Path.RelativePath);
		var logicalDriveQuery = new ManagementObjectSearcher(logicalDriveQueryText);
		foreach (ManagementObject ld in logicalDriveQuery.Get())
		{
			//Console.WriteLine("Logical drive");
			//Console.WriteLine(ld);
			
			var physicalName = Convert.ToString(d.Properties["Name"].Value); // \\.\PHYSICALDRIVE2
			var diskName = Convert.ToString(d.Properties["Caption"].Value); // WDC WD5001AALS-xxxxxx
			var diskModel = Convert.ToString(d.Properties["Model"].Value); // WDC WD5001AALS-xxxxxx
			var diskInterface = Convert.ToString(d.Properties["InterfaceType"].Value); // IDE
			var capabilities = (UInt16[])d.Properties["Capabilities"].Value; // 3,4 - random access, supports writing
			var mediaLoaded = Convert.ToBoolean(d.Properties["MediaLoaded"].Value); // bool
			var mediaType = Convert.ToString(d.Properties["MediaType"].Value); // Fixed hard disk media
			var mediaSignature = Convert.ToUInt32(d.Properties["Signature"].Value); // int32
			var mediaStatus = Convert.ToString(d.Properties["Status"].Value); // OK
			
			var driveName = Convert.ToString(ld.Properties["Name"].Value); // C:
			var driveId = Convert.ToString(ld.Properties["DeviceId"].Value); // C:
			var driveCompressed = Convert.ToBoolean(ld.Properties["Compressed"].Value);
			var driveType = Convert.ToUInt32(ld.Properties["DriveType"].Value); // C: - 3
			var fileSystem = Convert.ToString(ld.Properties["FileSystem"].Value); // NTFS
			var freeSpace = Convert.ToUInt64(ld.Properties["FreeSpace"].Value); // in bytes
			var totalSpace = Convert.ToUInt64(ld.Properties["Size"].Value); // in bytes
			var driveMediaType = Convert.ToUInt32(ld.Properties["MediaType"].Value); // c: 12
			var volumeName = Convert.ToString(ld.Properties["VolumeName"].Value); // System
			var volumeSerial = Convert.ToString(ld.Properties["VolumeSerialNumber"].Value); // 12345678
			
			// Console.WriteLine("PhysicalName: {0}", physicalName);
			// Console.WriteLine("DiskName: {0}", diskName);
			// Console.WriteLine("DiskModel: {0}", diskModel);
			// Console.WriteLine("DiskInterface: {0}", diskInterface);
			// // Console.WriteLine("Capabilities: {0}", capabilities);
			// Console.WriteLine("MediaLoaded: {0}", mediaLoaded);
			// Console.WriteLine("MediaType: {0}", mediaType);
			// Console.WriteLine("MediaSignature: {0}", mediaSignature);
			// Console.WriteLine("MediaStatus: {0}", mediaStatus);
			
			// Console.WriteLine("DriveName: {0}", driveName);
			// Console.WriteLine("DriveId: {0}", driveId);
			// Console.WriteLine("DriveCompressed: {0}", driveCompressed);
			// Console.WriteLine("DriveType: {0}", driveType);
			// Console.WriteLine("FileSystem: {0}", fileSystem);
			// Console.WriteLine("FreeSpace: {0}", freeSpace);
			// Console.WriteLine("TotalSpace: {0}", totalSpace);
			// Console.WriteLine("DriveMediaType: {0}", driveMediaType);
			// Console.WriteLine("VolumeName: {0}", volumeName);
			// Console.WriteLine("VolumeSerial: {0}", volumeSerial);
			
			// Console.WriteLine(new string('-', 79));
		}
	}
}