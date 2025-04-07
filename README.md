# PredicTube

[![Video Label](http://img.youtube.com/vi/UXic_qg4fbo/0.jpg)](https://youtu.be/UXic_qg4fbo)

## 개요
PredicTube는 유튜브 영상의 썸네일과 제목을 인공지능(AI) 기술로 분석하여 영상의 성공 가능성(예상 조회수)을 예측하고, 영상 콘텐츠 최적화를 돕는 웹 서비스입니다. 유튜브 크리에이터와 영상 마케팅 담당자들이 영상 업로드 전에 성과를 미리 예측하여 보다 전략적인 콘텐츠 제작이 가능하도록 지원합니다.

## 추진 배경 및 목적

- 유튜브는 대한민국에서 가장 영향력 있는 디지털 마케팅 플랫폼으로, 매월 수천만 명의 이용자가 콘텐츠를 소비하고 있습니다.
- 급격한 경쟁 심화로 인해 크리에이터들은 썸네일과 제목 선택에 많은 시간과 자원을 소비하게 되었습니다.
- PredicTube는 명확하고 객관적인 데이터 기반의 분석을 제공하여 콘텐츠 제작 효율성과 마케팅 효과를 극대화하는 것을 목표로 합니다.

## 주요 기능

### 조회수 예측
- 영상 제목과 썸네일 이미지, 구독자 수, 카테고리 등의 입력값으로 AI 모델이 영상의 예상 조회수를 예측합니다.

### ChatGPT 기반 제목 추천
- 사용자가 입력한 제목의 키워드를 분석하여 ChatGPT API를 통해 영상 제목을 세 가지 추천합니다.

### 히스토리 관리
- 사용자가 과거에 시도했던 입력값과 예측 결과를 저장하여, 더 나은 결과를 얻은 데이터를 기반으로 콘텐츠를 최적화하도록 돕습니다.

### 데이터 시각화
- 카테고리 및 특성 변수별 조회수와의 상관관계를 그래프로 시각화하여 영상 최적화 전략을 제공합니다.

### 키워드 빈도수 랭킹
- 카테고리별로 인기 있는 키워드의 빈도수를 제공하여 콘텐츠 소재 선정에 도움을 줍니다.

## 기술 스택

### 백엔드
- Python 3.8+
- Flask 웹 프레임워크
- TensorFlow/Keras (딥러닝 모델)
- NLTK, Gensim (자연어 처리)
- NumPy, Pandas (데이터 분석)
- SQLAlchemy (데이터베이스 ORM)

### 프론트엔드
- Java (서블릿/JSP)
- HTML5, CSS3, JavaScript, jQuery
- Bootstrap 4

### 데이터베이스
- MySQL

### API 및 외부 서비스
- YouTube Data API v3
- Google Cloud Vision API (OCR, 얼굴 인식, 유해성 검사)
- ChatGPT API

## 프로젝트 구조
```
.
├── Flask/
│   ├── api/
│   ├── data/
│   ├── models/
│   │   └── pickle/
│   ├── notebooks/
│   ├── static/
│   │   └── images/
│   └── config.template.py
│
└── Web/
    ├── src/
    │   ├── controller/
    │   ├── dao/
    │   └── model/
    ├── WebContent/
    │   ├── resources/
    │   ├── pages/
    │   ├── sql/
    │   ├── WEB-INF/
    │   └── META-INF/
    └── pom.xml
```

## 설치 방법

1. Python 의존성 설치
```bash
pip install -r requirements.txt
```

2. 설정 파일 준비
- `Flask/config.template.py`를 복사하여 `Flask/config.py` 생성
- API 키, 데이터베이스 연결 정보 입력

3. 데이터베이스 초기화
- MySQL DB에 `Web/WebContent/sql` 폴더 내 SQL 스크립트 실행

4. 웹 애플리케이션 빌드
```bash
cd Web
mvn clean install
```

## 실행 방법

1. Flask 서버 실행
```bash
cd Flask
python app.py
```

2. 웹 서버 실행
```bash
cd Web
mvn spring-boot:run
```

## 모델 학습 및 개발 프로세스

- YouTube Data API를 통해 약 10만 건의 유튜브 데이터를 자동 수집
- Google Cloud Vision API를 통해 썸네일 이미지 분석(OCR, 얼굴 인식, 유해성)
- NLP(LSTM) 및 수치 특성 분석(MLP)을 결합한 다중입력 다중출력 모델 구축 및 하이퍼파라미터 튜닝

## 주의사항

- 민감 정보가 포함된 `config.py` 파일과 API 키, 데이터 파일은 GitHub에 절대 업로드하지 마세요.
- 빌드 결과물은 로컬에서 생성하고, 버전 관리하지 않습니다.

## 기대효과 및 활용 방안

- 객관적인 AI 분석을 통해 콘텐츠 제작 효율성 향상
- 영상 마케팅 최적화 전략 제공
- 디지털 미디어 소비자의 심리 및 행동 연구 데이터 제공

## 향후 계획

- 외부 서버를 활용한 베타테스트 및 정식 서비스 출시 가능성 검토
- 추가 기능 개발 및 데이터 확장 등을 통한 유료화 가능성 탐색

## 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다.

## 참고 문헌
- [딥러닝을 이용한 자연어 처리](https://wikidocs.net/book/2155)
- [YouTube Data API](https://developers.google.com/youtube/v3/getting-started?hl=ko)
- [Google Cloud Vision API](https://cloud.google.com/vision/docs/features-list?hl=ko)

