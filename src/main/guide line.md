1. 회원가입 요청 흐름
사용자 요청 (Controller)

사용자가 회원가입 요청을 보내면, 해당 요청은 Controller에서 처리됩니다.
비즈니스 로직 처리 (Service)

Controller는 해당 요청을 Service로 전달합니다.

Service는 비즈니스 로직을 처리하며, 회원가입에 필요한 검증이나 데이터를 처리합니다.
데이터베이스 연동 (Repository)

Service는 필요한 경우 Repository를 통해 데이터베이스와 상호작용하여 Entity 객체를 저장하거나 수정합니다.
Entity 객체 (Repository)

Entity는 Repository와 연결되어 데이터베이스와 직접 매핑되며, 데이터베이스의 상태를 관리합니다.
DTO 변환 (Service → Controller)

Service는 비즈니스 로직 처리를 마친 후, 필요한 데이터를 **DTO(Data Transfer Object)**로 변환하여 Controller에 전달합니다.
뷰에 전달 (Controller)

Controller는 DTO 데이터를 뷰(View)로 전달하여 사용자에게 적절한 응답을 보여줍니다.



각 패키지 간 관계
Controller → Service → Repository

Controller는 사용자의 요청을 받아 Service에 전달하고, Service는 Repository를 통해 데이터베이스 작업을 처리합니다.
DTO와 Entity

DTO는 Entity 객체의 데이터를 가공하여 다른 계층(예: Controller)로 전달하는 역할을 합니다.
Service는 Entity를 DTO로 변환하거나, Controller에서 DTO를 사용하여 데이터를 뷰로 전달합니다.
Repository와 Entity

Repository는 Entity 객체를 기반으로 데이터베이스와 상호작용하며, 데이터의 저장, 조회, 수정 등을 처리합니다.
