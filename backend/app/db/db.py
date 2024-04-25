from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from backend.app.config.config import config

# Mysql connection string
SQLALCHEMY_DATABASE_URL = f"mysql+pymysql://{ config.DB_USER }:{ config.DB_PASSWORD }@{config.DB_HOST}/mydb"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
SessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=engine
)
Base = declarative_base()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
