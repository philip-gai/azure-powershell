﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

namespace Microsoft.Azure.Commands.ActiveDirectory
{
    public enum ErrorTypeEnum
    {
        GenericError = 0,
        MalformedQuery = 1,
        AuthorizationRequestDenied = 2
    }

    public class PSErrorHelperObject : PSADObject
    {
        public PSErrorHelperObject()
        {
            this.ErrorType = ErrorTypeEnum.GenericError;
        }

        public PSErrorHelperObject(ErrorTypeEnum ete)
        {
            this.ErrorType = ete;
        }

        public ErrorTypeEnum ErrorType { get; set; }
        public string PrincipalId { get; set; }
    }
}