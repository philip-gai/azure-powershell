
    # ----------------------------------------------------------------------------------
    #
    # Copyright Microsoft Corporation
    # Licensed under the Apache License, Version 2.0 (the \"License\");
    # you may not use this file except in compliance with the License.
    # You may obtain a copy of the License at
    # http://www.apache.org/licenses/LICENSE-2.0
    # Unless required by applicable law or agreed to in writing, software
    # distributed under the License is distributed on an \"AS IS\" BASIS,
    # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    # See the License for the specific language governing permissions and
    # limitations under the License.
    # ----------------------------------------------------------------------------------

    <#
    .Synopsis
    Create a in-memory object for ManagedDiskDetails
    .Description
    Create a in-memory object for ManagedDiskDetails

    .Outputs
    Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ManagedDiskDetails
    .Link
    https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxManagedDiskDetailsObject
    #>
    function New-AzDataBoxManagedDiskDetailsObject {
        [OutputType('Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ManagedDiskDetails')]
        [CmdletBinding(PositionalBinding=$false)]
        Param(
    
            [Parameter(Mandatory, HelpMessage="Resource Group Id of the compute disks.")]
            [string]
            $ResourceGroupId,
            [Parameter(Mandatory, HelpMessage="Resource Id of the storage account that can be used to copy the vhd for staging.")]
            [string]
            $StagingStorageAccountId,
            [Parameter(Mandatory, HelpMessage="Account Type of the data to be transferred.")]
            [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.DataAccountType]
            $DataAccountType,
            [Parameter(HelpMessage="Password for all the shares to be created on the device. Should not be passed for TransferType:ExportFromAzure jobs. If this is not passed, the service will generate password itself. This will not be returned in Get Call. Password Requirements :  Password must be minimum of 12 and maximum of 64 characters. Password must have at least one uppercase alphabet, one number and one special character. Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+.")]
            [string]
            $SharePassword
        )

        process {
            $Object = [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.ManagedDiskDetails]::New()
    
            $Object.ResourceGroupId = $ResourceGroupId
            $Object.StagingStorageAccountId = $StagingStorageAccountId
            $Object.DataAccountType = $DataAccountType
            $Object.SharePassword = $SharePassword
            return $Object
        }
    }
    
