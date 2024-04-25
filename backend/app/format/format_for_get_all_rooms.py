from pydantic import BaseModel, HttpUrl, field_validator, ValidationError
from datetime import date


class GetSingleRoom(BaseModel):
    """
    Represents a room in the system.

    Attributes:
        id (int): The unique identifier for the room.
        description (str): The description of the room.
        number (int): The room number.
        number_of_beds (int): The number of beds in the room.
        kitchen (bool): Indicates whether the room has a kitchen or not.
        price_per_day (int): The price per day for renting the room.
        status (int): The status code of the room.
        status_description (str): The description of the room status.
        picture_url (HttpUrl): The URL to the picture of the room.
    """
    id: int
    description: str
    number: int
    number_of_beds: int
    kitchen: bool
    price_per_day: int
    status: int
    status_description: str
    picture_url: HttpUrl


class GetManyRooms(BaseModel):
    """
    Represents multiple rooms retrieved from the system.

    Attributes:
        id (int): The unique identifier for the room.
        number_of_beds (int): The number of beds in the room.
        price_per_day (int): The price per day for renting the room.
        status (int): The status code of the room.
        picture_url (HttpUrl): The URL to the picture of the room.
    """
    id: int
    number_of_beds: int
    price_per_day: int
    status: int
    picture_url: HttpUrl


# Not used due to use fo path parameters
class GetManyRoomsInput(BaseModel):
    amount_items_on_page: int | None = 20

    @field_validator("amount_items_on_page")
    @classmethod
    def validate_amount_items_on_page(cls, v: int) -> int:
        if v <= 0 or v > 50:
            raise ValidationError("invalid value should be from 1 to 50")
        return v


class GetRoomBookedDates(BaseModel):
    """
    Return model
    """
    id: int
    start_date: date
    end_date: date
