@{
    SchemaVersion = 1

    # Omit MachineName to use $env:COMPUTERNAME.
    MachineName = ''

    # Use a dedicated backup/archive volume.
    StoreRoot = 'E:\VolumeManagement'

    Sources = @(
        @{
            Name        = 'Development'
            Path        = 'D:\'
            Destination = 'Development'

            ExcludeDirectories = @(
                'D:\$RECYCLE.BIN',
                'D:\System Volume Information',
                'D:\Temp',
                'D:\Cache'
            )

            ExcludeFiles = @(
                '*.tmp',
                '*.lock'
            )
        }
    )

    Copy = @{
        RetryCount  = 3
        WaitSeconds = 5
        ThreadCount = 8
    }

    Verification = @{
        # None is faster. SHA256 provides content verification.
        HashAlgorithm = 'None'
    }

    Retention = @{
        Daily   = 14
        Weekly  = 8
        Monthly = 24
        Yearly  = 0
        Archive = 0
    }
}
