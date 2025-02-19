
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
Create a in-memory object for StorageAccountDetails
.Description
Create a in-memory object for StorageAccountDetails
.Example
PS C:\> $dataAccount = New-AzDataBoxStorageAccountDetailsObject -DataAccountType "StorageAccount" -StorageAccountId "/subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName"
PS C:\> $dataAccount

DataAccountType SharePassword StorageAccountId
--------------- ------------- ----------------
StorageAccount                /subscriptions/SubscriptionId/resourceGroups/resourceGroupName/providers/Microsoft.Storage/storageAccounts/storageAccountName

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.StorageAccountDetails
.Link
https://docs.microsoft.com/powershell/module/az.DataBox/new-AzDataBoxStorageAccountDetailsObject
#>
function New-AzDataBoxStorageAccountDetailsObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataBox.Models.Api20210301.StorageAccountDetails])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Storage Account Resource Id.
    ${StorageAccountId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Support.DataAccountType]
    # Account Type of the data to be transferred.
    ${DataAccountType},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataBox.Category('Body')]
    [System.String]
    # Password for all the shares to be created on the device.
    # Should not be passed for TransferType:ExportFromAzure jobs.
    # If this is not passed, the service will generate password itself.
    # This will not be returned in Get Call.
    # Password Requirements :  Password must be minimum of 12 and maximum of 64 characters.
    # Password must have at least one uppercase alphabet, one number and one special character.
    # Password cannot have the following characters : IilLoO0 Password can have only alphabets, numbers and these characters : @#\-$%^!+=;:_()]+.
    ${SharePassword}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            __AllParameterSets = 'Az.DataBox.custom\New-AzDataBoxStorageAccountDetailsObject';
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
