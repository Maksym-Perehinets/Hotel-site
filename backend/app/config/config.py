from dotenv import load_dotenv
from pydantic_settings import BaseSettings

load_dotenv()


class Settings(BaseSettings):
    DB_ECHO: bool
    DB_PASSWORD: str
    DB_USER: str
    DB_HOST: str
    PROJECT_NAME: str
    VERSION: str
    DEBUG: bool
    CORS_ALLOWED_ORIGINS: str
    KICKBOX_API_TOKEN: str


config = Settings()
