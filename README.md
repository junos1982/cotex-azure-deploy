# Azure Resource Group Inventory with Terraform

이 프로젝트는 Terraform을 사용해 현재 Azure 구독에 존재하는 리소스 그룹 목록을 조회하고 출력하는 예시입니다.

## 구성 파일
- `main.tf`: `azurerm`와 `azapi` 프로바이더를 선언하고, 현재 로그인된 자격 증명으로 사용할 구독 ID를 가져옵니다. `azapi_resource_list` 데이터를 이용해 구독 내의 리소스 그룹을 조회합니다.
- `outputs.tf`: 조회된 리소스 그룹의 이름 목록과 전체 메타데이터(JSON)를 출력합니다.

## 사용 방법
1. Azure CLI로 로그인했거나 서비스 프린시펄 자격 증명을 환경 변수로 설정한 상태여야 합니다.
2. 필요한 프로바이더를 설치하고 Terraform 상태를 초기화합니다.
   ```bash
   terraform init
   ```
3. 리소스 그룹 정보를 확인하려면 다음 명령을 실행합니다.
   ```bash
   terraform apply -auto-approve
   ```
   또는 단순히 출력만 확인하려면 `terraform plan` 후 `terraform output`을 사용할 수 있습니다.
4. 출력 예시
   ```bash
   terraform output resource_group_names
   terraform output resource_groups_raw
   ```

> **참고**: 이 예시는 리소스를 생성하지 않으며, Azure 구독에 대한 읽기 권한만 필요합니다.
