from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session
from backend.app.db.db import get_db
from backend.app.format.auth import *

router = APIRouter(
    prefix="/api/v1/auth",
    tags=["Authentication"],
    responses={
        404: {
            "description": "Data was incorrect or incorrect endpoint used"
        }
    },
)


@router.post(
    "/create_user",
    status_code=status.HTTP_201_CREATED
)
def create_user(
        new_user: CreateUserRequest,
        db: Session = Depends(get_db)
):
    print(new_user)
