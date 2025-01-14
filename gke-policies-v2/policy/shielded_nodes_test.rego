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
# title: GKE Shielded Nodes
# description: GKE cluster should use shielded nodes
# custom:
#   group: Security
package gke.policy.shielded_nodes

test_enabled_shielded_nodes {
	valid with input as {"data": {"gke": {"name": "test-cluster", "shielded_nodes": { "enabled": true }}}}
}

test_disabled_shielded_nodes {
	not valid with input as {"data": {"gke": {"name": "test-cluster", "shielded_nodes": {}}}}
}
