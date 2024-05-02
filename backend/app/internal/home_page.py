from backend.app.db.db_schemas import *
from .common_db import CommonDb


class HomePage(CommonDb):
    async def home_page_provide_many_items(
            self,
            count):
        """
        Retrieves a list of rooms from db with the specified number of items per page.

        Parameters:
            count (int): The number of items per page.

        Returns:
            list[GetManyRooms]: A list of rooms.
        """
        query_result = self.db.query(
            Room.id,
            Room.number_of_beds,
            Room.price_per_day,
            RoomStatus.status,
            RoomPicture.picture_url
        ).join(
            RoomStatus,
            Room.roomStatus_idroomStatus == RoomStatus.idroomStatus
        ).join(
            RoomPicture,
            RoomPicture.rooms_idrooms == Room.id
        ).limit(count)
        return query_result.all()

    async def home_page_provide_single_item(
            self,
            room_id):
        """
        Retrieves a single room with the specified room ID.

        Parameters:
            room_id (int): The ID of the room to retrieve.

        Returns:
            list[GetSingleRoom]: A single room.
        """
        query_result = self.db.query(
            Room.id, Room.description,
            Room.number,
            Room.number_of_beds,
            Room.kitchen,
            Room.price_per_day,
            RoomStatus.status,
            RoomStatus.status_description,
            RoomPicture.picture_url
        ).join(
            RoomStatus,
            Room.roomStatus_idroomStatus == RoomStatus.idroomStatus
        ).join(
            RoomPicture,
            RoomPicture.rooms_idrooms == Room.id
        ).filter(Room.id == room_id)
        return query_result.all()

    async def home_page_provide_single_item_book_date(
            self,
            room_id):
        """
        Retrieves a single room with the specified room ID.

        Parameters:
            room_id (int): The ID of the room to retrieve.

        Returns:
            list[GetSingleRoom]: A single room.
        """
        query_result = self.db.query(
            BookedRoom.id,
            BookedRoom.start_date,
            BookedRoom.end_date
        ).filter(
            BookedRoom.id == room_id
        )
        return query_result.all()
