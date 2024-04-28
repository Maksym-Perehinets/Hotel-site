from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from backend.app.db.db import get_db
from backend.app.internal.home_page import HomePage
from backend.app.format.format_rooms_output_input import *

router = APIRouter(
    prefix="/api/v1/room",
    tags=["Home page logic"],
    responses={404: {"description": "Not found"}},
)


@router.get(
    "/get-many-rooms/{amount_items_on_page:int}"
)
async def get_rooms(
    amount_items_on_page: int = 10,
    db: Session = Depends(get_db)
) -> list[GetManyRooms]:
    """
    Retrieve multiple items from the home page.

    This endpoint retrieves multiple items from the home page based on the specified number of items per page.

    Parameters:
    - amount_items_on_page (int, optional): The number of items to be retrieved per page. Defaults to 10.

    Returns:
    - List[GetManyRooms]: A list of items retrieved from the home page.

    Raises:
    - HTTPException: If an error occurs during retrieval.
    """
    homepage = HomePage(db=db)
    return await homepage.home_page_provide_many_items(amount_items_on_page)


@router.get(
    "/get-single-room/{room_id:int}"
)
async def get_rooms(
    room_id: int = 1,
    db: Session = Depends(get_db)
) -> list[GetSingleRoom]:
    """
    Retrieve a single item from the home page by its ID.

    This endpoint retrieves a single item from the home page based on the provided room ID.

    Parameters:
    - room_id (int, optional): The ID of the room to retrieve. Defaults to 1.

    Returns:
    - List[GetSingleRoom]: A list containing the retrieved item from the home page.

    Raises:
    - HTTPException: If the specified room ID is not found.
    """
    homepage = HomePage(db=db)
    return await homepage.home_page_provide_single_item(room_id)


@router.get(
    "/get-date-for-booked-room/{room_id:int}"
)
async def get_rooms(
    room_id: int = 1,
    db: Session = Depends(get_db)
) -> list[GetRoomBookedDates]:
    """
    Retrieve a single item from the home page by its ID.

    This endpoint retrieves a single item from the home page based on the provided room ID.

    Parameters:
    - room_id (int, optional): The ID of the room to retrieve. Defaults to 1.

    Returns:
    - List[GetSingleRoom]: A list containing the retrieved item from the home page.

    Raises:
    - HTTPException: If the specified room ID is not found.
    """
    homepage = HomePage(db=db)
    return await homepage.home_page_provide_single_item_book_date(room_id)
