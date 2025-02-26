
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Create a in-memory object for DataBoxDiskJobDetails
.Description
Create a in-memory object for DataBoxDiskJobDetails
.Example
PS C:\> $details = New-AzDataBoxDiskJobDetailsObject -Type "DataBoxDisk"  -DataImportDetail  @(@{AccountDetail=$dataAccount; AccountDetailDataAccountType = "StorageAccount"} ) -ContactDetail $contactDetail -ShippingAddress $ShippingDetails -Passkey "randm@423jarABC" -PreferredDisk @{"8" = 8; "4" = 2} -ExpectedDataSizeInTeraByte 18

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

CONTACTDETAIL <IContactDetails>: Contact details for notification and shipping.
  ContactName <String>: Contact name of the person.
  EmailList <String[]>: List of Email-ids to be notified about job progress.
  Phone <String>: Phone number of the contact person.
  [Mobile <String>]: Mobile number of the contact person.
  [NotificationPreference <INotificationPreference[]>]: Notification preference for a job stage.
    SendNotification <Boolean>: Notification is required or not.
    StageName <NotificationStageName>: Name of the stage.
  [PhoneExtension <String>]: Phone extension number of the contact person.

DATAEXPORTDETAIL <IDataExportDetails[]>: Details of the data to be exported from azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  TransferConfiguration <ITransferConfiguration>: Configuration for the data transfer.
    Type <TransferConfigurationType>: Type of the configuration for transfer.
    [TransferAllDetail <ITransferConfigurationTransferAllDetails>]: Map of filter type and the details to transfer all data. This field is required only if the TransferConfigurationType is given as TransferAll
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data
      [IncludeTransferAllBlob <Boolean?>]: To indicate if all Azure blobs have to be transferred
      [IncludeTransferAllFile <Boolean?>]: To indicate if all Azure Files have to be transferred
    [TransferFilterDetail <ITransferConfigurationTransferFilterDetails>]: Map of filter type and the details to filter. This field is required only if the TransferConfigurationType is given as TransferUsingFilter.
      [AzureFileFilterDetailFilePathList <String[]>]: List of full path of the files to be transferred.
      [AzureFileFilterDetailFilePrefixList <String[]>]: Prefix list of the Azure files to be transferred.
      [AzureFileFilterDetailFileShareList <String[]>]: List of file shares to be transferred.
      [BlobFilterDetailBlobPathList <String[]>]: List of full path of the blobs to be transferred.
      [BlobFilterDetailBlobPrefixList <String[]>]: Prefix list of the Azure blobs to be transferred.
      [BlobFilterDetailContainerList <String[]>]: List of blob containers to be transferred.
      [IncludeDataAccountType <DataAccountType?>]: Type of the account of data.
      [IncludeFilterFileDetail <IFilterFileDetails[]>]: Details of the filter files to be used for data transfer.
        FilterFilePath <String>: Path of the file that contains the details of all items to transfer.
        FilterFileType <FilterFileType>: Type of the filter file.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+
  [LogCollectionLevel <LogCollectionLevel?>]: Level of the logs to be collected.

DATAIMPORTDETAIL <IDataImportDetails[]>: Details of the data to be imported into azure.
  AccountDetailDataAccountType <DataAccountType>: Account Type of the data to be transferred.
  [AccountDetailSharePassword <String>]: Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+

KEYENCRYPTIONKEY <IKeyEncryptionKey>: Details about which key encryption type is being used.
  KekType <KekType>: Type of encryption key used for key encryption.
  [IdentityProperty <IIdentityProperties>]: Managed identity properties used for key encryption.
    [Type <String>]: Managed service identity type.
    [UserAssignedResourceId <String>]: Arm resource id for user assigned identity to be used to fetch MSI token.
  [KekUrl <String>]: Key encryption key. It is required in case of Customer managed KekType.
  [KekVaultResourceId <String>]: Kek vault resource id. It is required in case of Customer managed KekType.

PREFERENCE <IPreferences>: Preferences for the order.
  [EncryptionPreferenceDoubleEncryption <DoubleEncryption?>]: Defines secondary layer of software-based encryption enablement.
  [PreferredDataCenterRegion <String[]>]: Preferred data center region.
  [TransportPreferencePreferredShipmentType <TransportShipmentTypes?>]: Indicates Shipment Logistics type that the customer preferred.

PREFERREDDISK <IDataBoxDiskJobDetailsPreferredDisks>: User preference on what size disks are needed for the job. The map is from the disk size in TB to the count. Eg. {2,5} means 5 disks of 2 TB size. Key is string but will be checked against an int.
  [(Any) <Int32>]: This indicates any property can be added to this object.

SHIPPINGADDRESS <IShippingAddress>: Shipping address of the customer.
  Country <String>: Name of the Country.
  StreetAddress1 <String>: Street Address line 1.
  [AddressType <AddressType?>]: Type of address.
  [City <String>]: Name of the City.
  [CompanyName <String>]: Name of the company.
  [PostalCode <String>]: Postal code.
  [StateOrProvince <String>]: Name of the State or Province.
  [StreetAddress2 <String>]: Street Address line 2.
  [StreetAddress3 <String>]: Street Address line 3.
  [ZipExtendedCode <String>]: Extended Zip Code.
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxDiskJobDetailsObject
#>
function New-AzDataBoxDiskJobDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.DataBoxDiskJobDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IContactDetails]
    # Contact details for notification and shipping.
    # To construct, see NOTES section for CONTACTDETAIL properties and create a hash table.
    ${ContactDetail},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.ClassDiscriminator]
    # Indicates the type of job details.
    ${Type},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # User entered passkey for DataBox Disk job.
    ${Passkey},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataBoxDiskJobDetailsPreferredDisks]
    # User preference on what size disks are needed for the job.
    # The map is from the disk size in TB to the count.
    # Eg.
    # {2,5} means 5 disks of 2 TB size.
    # Key is string but will be checked against an int.
    # To construct, see NOTES section for PREFERREDDISK properties and create a hash table.
    ${PreferredDisk},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataExportDetails[]]
    # Details of the data to be exported from azure.
    # To construct, see NOTES section for DATAEXPORTDETAIL properties and create a hash table.
    ${DataExportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IDataImportDetails[]]
    # Details of the data to be imported into azure.
    # To construct, see NOTES section for DATAIMPORTDETAIL properties and create a hash table.
    ${DataImportDetail},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.Int32]
    # The expected size of the data, which needs to be transferred in this job, in terabytes.
    ${ExpectedDataSizeInTeraByte},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IKeyEncryptionKey]
    # Details about which key encryption type is being used.
    # To construct, see NOTES section for KEYENCRYPTIONKEY properties and create a hash table.
    ${KeyEncryptionKey},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IPreferences]
    # Preferences for the order.
    # To construct, see NOTES section for PREFERENCE properties and create a hash table.
    ${Preference},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.IShippingAddress]
    # Shipping address of the customer.
    # To construct, see NOTES section for SHIPPINGADDRESS properties and create a hash table.
    ${ShippingAddress}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxDiskJobDetailsObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}
