# config.template.py
# 실제 사용 시 이 파일을 config.py로 복사하고 실제 API 키를 입력하세요

# YouTube API 키 목록
API_KEYS = [
    "YOUR_API_KEY_1",
    "YOUR_API_KEY_2",
    # 추가 API 키 입력
]

# 데이터를 가져올 최대 개수 설정
MAX_RESULTS = 1000

# 카테고리 ID
# category_ids = [2, 23, 27, 24, 1, 20, 26, 10, 25, 29, 22, 15, 28, 17, 19]
CATEGORY_ID = 27

# 비디오 시간 대
DURATION = 'medium'

# 검색 언어
RELEVANCE_LANGUAGE = 'ko'

# 지역 코드
REGION_CODE = 'KR'

# 검색 시작 시간
START_TIME = "2023-01-01T00:00:00Z"

# Configuration Template
# Rename this file to config.py and fill in your actual values

# Database Configuration
DB_CONFIG = {
    'host': 'your_host',
    'port': 'your_port',
    'database': 'your_database',
    'user': 'your_username',
    'password': 'your_password'
}

# API Keys
GOOGLE_CLOUD_CREDENTIALS = {
    'type': 'service_account',
    'project_id': 'your_project_id',
    'private_key_id': 'your_private_key_id',
    'private_key': 'your_private_key',
    'client_email': 'your_client_email',
    'client_id': 'your_client_id'
}

# Application Settings
DEBUG = True
SECRET_KEY = 'your_secret_key'
UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}
