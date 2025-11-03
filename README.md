# Azure Resource Group Inventory with Terraform

이 프로젝트는 Terraform을 사용해 현재 Azure 구독에 존재하는 리소스 그룹 목록을 조회하고 출력하는 예시입니다. GitHub Actions 워크플로를 통해 자동으로 Terraform을 실행하여 결과를 확인할 수 있습니다.

## 구성 파일
- `main.tf`: `azurerm`와 `azapi` 프로바이더를 선언하고, 현재 로그인된 자격 증명으로 사용할 구독 ID를 가져옵니다. `azapi_resource_list` 데이터를 이용해 구독 내의 리소스 그룹을 조회합니다.
- `outputs.tf`: 조회된 리소스 그룹의 이름 목록과 전체 메타데이터(JSON)를 출력합니다.
- `.github/workflows/list-azure-resource-groups.yml`: GitHub Actions 워크플로 정의로, Terraform을 실행해 리소스 그룹 정보를 출력합니다.

## GitHub Actions 설정 방법
1. GitHub 리포지토리의 **Settings > Secrets and variables > Actions** 메뉴에서 다음 시크릿을 생성합니다.
   - `AZURE_CLIENT_ID`
   - `AZURE_TENANT_ID`
   - `AZURE_SUBSCRIPTION_ID`
2. 워크플로를 수동으로 실행하려면 GitHub 리포지토리의 **Actions** 탭에서 `List Azure Resource Groups` 워크플로를 선택하고 **Run workflow**를 클릭합니다.
3. 워크플로는 `main` 브랜치에 푸시될 때마다 자동으로 실행되며, Terraform을 통해 리소스 그룹 목록을 조회한 뒤 `resource_group_names`와 `resource_groups_raw` 출력을 표시합니다.

> **참고**: 이 예시는 리소스를 생성하지 않으며, Azure 구독에 대한 읽기 권한만 필요합니다.
