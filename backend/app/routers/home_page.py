from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from backend.app.db.db import get_db
from backend.app.db.db_schemas import RoomPicture

router = APIRouter()


@router.get("/", tags=["home page info"])
async def get_rooms(db: Session = Depends(get_db)):
    return {
            "message": "working",
            "chek our docs": db.query(RoomPicture).all()
            }


@router.get("/v1/rooms/{items_on_page}", tags=["home page info"])
async def get_rooms(items_on_page: int):
    return {
            "message": "good",
            "items_on_page": items_on_page
            }


@router.get("/room", tags=["home page info"])
async def get_room():
    return {"message": "test"}
