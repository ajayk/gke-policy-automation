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
# title: GKE HPAs Limit
# description: GKE HPAs Limit
# custom:
#   group: Scalability
package gke.scalability.hpas

test_hpas_underusage {
	valid with input as {"data": {"k8s": {"Resources": [{"Type": {"Group": "autoscaling", "Version": "v1", "Name": "horizontalpodautoscalers", "Namespaced": true}, "data": {"apiVersion": "autoscaling/v1", "kind": "HorizontalPodAutoscaler", "metadata": {"annotations": {"autoscaling.alpha.kubernetes.io/conditions": "", "autoscaling.alpha.kubernetes.io/current-metrics": ""}, "creationTimestamp": "2022-06-24T19:02:21Z", "managedFields": [{"apiVersion": "autoscaling/v1", "fieldsType": "FieldsV1", "fieldsV1": {"f:spec": {"f:maxReplicas": {}, "f:minReplicas": {}, "f:scaleTargetRef": {}, "f:targetCPUUtilizationPercentage": {}}}, "manager": "kubectl-autoscale", "operation": "Update", "time": "2022-06-24T19:02:21Z"}, {"apiVersion": "autoscaling/v2beta2", "fieldsType": "FieldsV1", "fieldsV1": {"f:status": {"f:conditions": {}, "f:currentMetrics": {}, "f:currentReplicas": {}, "f:desiredReplicas": {}, "f:lastScaleTime": {}}}, "manager": "vpa-recommender", "operation": "Update", "subresource": "status", "time": "2022-06-24T19:33:41Z"}], "name": "wherami", "namespace": "demo", "resourceVersion": "5958695", "uid": ""}, "spec": {"maxReplicas": 10, "minReplicas": 1, "scaleTargetRef": {"apiVersion": "apps/v1", "kind": "Deployment", "name": "wherami"}, "targetCPUUtilizationPercentage": 50}, "status": {"currentCPUUtilizationPercentage": 3, "currentReplicas": 1, "desiredReplicas": 1, "lastScaleTime": "2023-02-24T19:40:57Z"}}}]}}}
}

test_hpas_overusage {
	not valid with input as {"data": {"k8s": {"Resources": [{"Type": {"Group": "autoscaling", "Version": "v1", "Name": "horizontalpodautoscalers", "Namespaced": true}, "data": {"apiVersion": "autoscaling/v1", "kind": "HorizontalPodAutoscaler", "metadata": {"creationTimestamp": "2022-06-24T19:02:21Z", "managedFields": [{"apiVersion": "autoscaling/v2beta2", "fieldsType": "FieldsV1", "fieldsV1": {"f:status": {"f:conditions": {}, "f:currentMetrics": {}, "f:currentReplicas": {}, "f:desiredReplicas": {}, "f:lastScaleTime": {}}}, "manager": "vpa-recommender", "operation": "Update", "subresource": "status", "time": "2022-06-24T19:33:41Z"}], "name": "wherami", "namespace": "demo", "resourceVersion": "5958695", "uid": "f6f0911a-3aed-46d0-90a3-d7c7cf70554e"}, "spec": {"maxReplicas": 10, "minReplicas": 1, "scaleTargetRef": {"apiVersion": "apps/v1", "kind": "Deployment", "name": "wherami"}, "targetCPUUtilizationPercentage": 50}, "status": {"currentCPUUtilizationPercentage": 3, "currentReplicas": 1, "desiredReplicas": 1, "lastScaleTime": "2022-06-24T19:40:57Z"}}}, {"Type": {"Group": "autoscaling", "Version": "v1", "Name": "horizontalpodautoscalers", "Namespaced": true}, "data": {"apiVersion": "autoscaling/v1", "kind": "HorizontalPodAutoscaler", "metadata": {"creationTimestamp": "2022-06-24T19:02:21Z", "managedFields": [{"apiVersion": "autoscaling/v2beta2", "fieldsType": "FieldsV1", "fieldsV1": {"f:status": {"f:conditions": {}, "f:currentMetrics": {}, "f:currentReplicas": {}, "f:desiredReplicas": {}, "f:lastScaleTime": {}}}, "manager": "vpa-recommender", "operation": "Update", "subresource": "status", "time": "2022-06-24T19:33:41Z"}], "name": "wherami-two", "namespace": "demo", "resourceVersion": "5958695", "uid": "f6f0911a-3aed-46d0-90a3-d7c7cf70554e"}, "spec": {"maxReplicas": 10, "minReplicas": 1, "scaleTargetRef": {"apiVersion": "apps/v1", "kind": "Deployment", "name": "wherami"}, "targetCPUUtilizationPercentage": 50}, "status": {"currentCPUUtilizationPercentage": 3, "currentReplicas": 1, "desiredReplicas": 1, "lastScaleTime": "2022-06-24T19:40:57Z"}}}, {"Type": {"Group": "autoscaling", "Version": "v1", "Name": "horizontalpodautoscalers", "Namespaced": true}, "data": {"apiVersion": "autoscaling/v1", "kind": "HorizontalPodAutoscaler", "metadata": {"creationTimestamp": "2022-06-24T19:02:21Z", "managedFields": [{"apiVersion": "autoscaling/v2beta2", "fieldsType": "FieldsV1", "fieldsV1": {"f:status": {"f:conditions": {}, "f:currentMetrics": {}, "f:currentReplicas": {}, "f:desiredReplicas": {}, "f:lastScaleTime": {}}}, "manager": "vpa-recommender", "operation": "Update", "subresource": "status", "time": "2022-06-24T19:33:41Z"}], "name": "wherami-three", "namespace": "demo", "resourceVersion": "5958695", "uid": "f6f0911a-3aed-46d0-90a3-d7c7cf70554e"}, "spec": {"maxReplicas": 10, "minReplicas": 1, "scaleTargetRef": {"apiVersion": "apps/v1", "kind": "Deployment", "name": "wherami"}, "targetCPUUtilizationPercentage": 50}, "status": {"currentCPUUtilizationPercentage": 3, "currentReplicas": 1, "desiredReplicas": 1, "lastScaleTime": "2022-06-24T19:40:57Z"}}}]}}}
}
