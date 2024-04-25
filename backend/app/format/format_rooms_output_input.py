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


class GetRoomBookedDates(BaseModel):
    """
    Return model
    """
    id: int
    start_date: date
    end_date: date
