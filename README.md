## 청각장애인 부모를 위한 아기 울음소리 감지 및 범주 분류

>[Hear-is, Hear-ease](https://github.com/Hear-is-Hear-ease/.github)의 어플리케이션 레포지토리.

본 프로젝트는 **기술을 통한 사회적 복지 실현**이라는 목표 아래, **청각장애인 부모**가 아기의 울음을 인지하고 적절한 솔루션을 제공받을 수 있도록 돕는 **아기 울음소리 감지 및 울음 원인 분류 어플리케이션**을 개발하는 것을 목적으로 합니다.

- **프로젝트명**: 아기 울음소리 감지 및 범주 분류 모델

  - App: [Hear-ease-App](https://github.com/Hear-is-Hear-ease/Hear-ease-App)
  - Backend: [Hear-ease-Backend](https://github.com/Hear-is-Hear-ease/Hear-ease-Backend)
  - AI: [Hear-ease-AI](https://github.com/Hear-is-Hear-ease/Hear-ease-AI)

- **소속**: 서울과학기술대학교 데이터청년 캠퍼스 01조
- **팀원**: [권정연](https://github.com/kyuleeee), 강근희, [곽재원](https://github.com/jaewonE), 고은아, [장민준](https://github.com/MinJunJA), [신정아](https://github.com/JeongaShin)
- [어플리케이션 이미지](https://github.com/Hear-is-Hear-ease/.github/blob/main/assets/screenshots)
- [시각 자료 PDF](https://github.com/Hear-is-Hear-ease/.github/blob/main/doc/poster.pdf)

<br>

청각장애 부모를 위해 아이의 울음을 감지하고 원인을 파악하는 어플리케이션.

앱을 실행하여 언어를 선택한 뒤 화면 가운데의 버튼을 누르면 아이의 울음소리를 듣기 시작한다.

말소리, 반려동물 소리에는 반응하지 않으며 오직 **아기울음 소리**가 감지될 경우에 사용자에게 알림을 전송한다.

아기울음 소리 원인은 'sad', 'hug', 'diaper', 'hungry', 'sleepy', 'awake', 'uncomfortable', 총 7가지로 분류한다.

<br>

주의: 아기울음 소리의 원인을 분석하기 위해 아기울음 소리가 감지되면 백앤드로 녹음된 음성 파일을 전송한다.

백엔드에 연결하기 위해서는 현재 IP주소를 .env 파일의 API_BASE_ROOT에 7701 port로 입력해주어야 한다.
