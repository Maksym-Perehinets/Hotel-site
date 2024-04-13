from fastapi import APIRouter

router = APIRouter()


@router.get("/v1/rooms/{items_on_page}", tags=["home page info"])
async def get_rooms(items_on_page: int):
    return {
            "message": "good",
            "items_on_page": items_on_page
            }


@router.get("/room", tags=["home page info"])
async def get_room():
    return {"message": "test"}
