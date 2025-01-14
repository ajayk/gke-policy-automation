# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# METADATA
# title: GKE Workload Identity
# description: GKE cluster should have Workload Identity enabled
# custom:
#   group: Security
package gke.policy.workload_identity

test_enabled_workload_identity {
	valid with input as {"data": {"gke": {"name": "test-cluster", "workload_identity_config": { "workload_pool": "foo_pool.svc.id.goog" }}}}
}

test_disabled_workload_identity {
	not valid with input as {"data": {"gke": {"name": "test-cluster"}}}
}
