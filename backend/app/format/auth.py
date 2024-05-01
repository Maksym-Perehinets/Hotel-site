from pydantic import BaseModel, field_validator
from .auth_validation.validation import *


class CreateUserRequest(BaseModel):
    username: str
    email: str
    phone_number: str
    behaviour: str
    first_name: str
    last_name: str
    password: str


    @field_validator('password')
    @classmethod
    def validate_username(cls, v: str):
        return Validation.password(v)


    @field_validator('email')
    @classmethod
    def validate_email(cls, v: str):
        return Validation.email(v)


class Token(BaseModel):
    access_token: str
    token_type: str