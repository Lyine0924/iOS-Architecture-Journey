# EssentialFeed

> A description of this package.

## Story: 고객의 이미지 피드 보기 요청
### Narrative #1
온라인 환경 고객 대상

앱에서 내 최신 이미지 피드를 자동으로 로드하고자 합니다.

또한 유저는 항상 내 친구들의 최신 이미지들을 감상할 수 있습니다.

### Scenarios (허용 기준)

**Given**
1. 인터넷에 연결된 상태

**When**
1. 고객이 피드 보기를 요청함

**Then**
1. 앱이 원격환경으로 부터 전달받은 최신 피드를 표시해야 합니다.
2. 캐시를 새 피드로 교체합니다.

### Narrative #2
오프라인 환경 고객 대상

앱에 저장된 최신의 내 이미지 피드를 표시하고자 합니다.

또한 유저는 항상 내 친구들의 최신 이미지들을 감상할 수 있습니다.

### Scenarios (허용 기준)

**Given**
1. 인터넷이 연결이 되지 않는 상태
2. 피드의 캐시된 버전이 존재함

**When**
1. 고객이 피드 보기를 요청함

**Then**
1. 앱에 저장된 최신 피드가 표시되어야 합니다.

---

## Load Feed Use Case

### Data (Input):
URL

### Primary course (happy path):
1. 위의 데이터로 "피드 항목 로드" 명령을 실행합니다.
2. 시스템이 URL에서 데이터를 다운로드합니다.
3. 시스템에서 다운로드한 데이터의 유효성을 검사합니다.
4. 시스템은 유효한 데이터로부터 피드 항목을 생성합니다.
5. 시스템에서 피드 항목을 전달합니다.

### Invalid data – error course (sad path):
1. 시스템에서 오류를 전달합니다.
### No connectivity – error course (sad path):
1. 시스템에서 오류를 전달합니다.

---

## Load Feed Fallback (Cache) Use Case
### Data (Input):
~~Max age~~

### Primary course (happy path):
1. 위의 데이터로 "피드 항목 검색" 명령을 실행합니다.
2. 시스템이 캐시에서 피드 데이터를 가져옵니다.
3. 시스템은 캐시된 데이터로 피드 항목을 만듭니다.
4. 시스템에서 피드 항목을 전달합니다.

### No cache course (sad path):
1. 시스템에서 피드 항목을 제공하지 않습니다.

---
## Save Feed Items Use Case
### Data (Input):
Feed items

### Primary course (happy path):
1. 위의 데이터로 "저장된 피드 아이템" 명령을 실행합니다.
2. 시스템은 피드 항목을 인코딩합니다.
3. 시스템이 새 캐시에 타임스탬프를 기록합니다.
4. 시스템이 캐시를 새 데이터로 교체합니다.
5. 시스템이 성공 메시지를 전달합니다.