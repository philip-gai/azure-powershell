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

using Microsoft.Azure.Commands.ActiveDirectory;
using System;

namespace Microsoft.Azure.Commands.Resources.Models.Authorization
{
    public class FilterDenyAssignmentsOptions
    {
        public string DenyAssignmentId { get; set; }

        public string DenyAssignmentName { get; set; }

        private string scope;

        public string Scope
        {
            get
            {
                if (!string.IsNullOrEmpty(scope))
                {
                    return scope;
                }

                string resourceIdentifier = ResourceIdentifier.ToString();

                if (!string.IsNullOrEmpty(resourceIdentifier))
                {
                    return resourceIdentifier;
                }

                return null;
            }
            set
            {
                scope = value;
            }
        }

        public ResourceIdentifier ResourceIdentifier { get; set; }

        public ADObjectFilterOptions ADObjectFilter { get; set; }

        public bool ExpandPrincipalGroups { get; set; }

        public bool ExcludeAssignmentsForDeletedPrincipals { get; set; }
    }
}