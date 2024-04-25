from sqlalchemy import Column, Integer, Text, ForeignKey, DateTime, VARCHAR, Boolean
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()


class RoomStatus(Base):
    __tablename__ = 'roomStatus'

    idroomStatus = Column(Integer, primary_key=True, autoincrement=True)
    status_description = Column(Text, name="description", nullable=False)
    status = Column(Integer, name="roomStatus", nullable=False)


class Room(Base):
    __tablename__ = 'rooms'

    id = Column(Integer, name="idrooms", primary_key=True, autoincrement=True)
    roomStatus_idroomStatus = Column(Integer, ForeignKey('roomStatus.idroomStatus'), nullable=False)
    number = Column(Integer, name="roomNumber", nullable=False)
    description = Column(Text, name="roomDescription", nullable=False)
    number_of_beds = Column(Integer, name="numberOfBeds", nullable=False)
    kitchen = Column(Boolean, name="hasKitchen", nullable=False)
    price_per_day = Column(Integer, name="price_perday", nullable=False)

    room_status = relationship("RoomStatus")


class RoomReview(Base):
    __tablename__ = 'roomReviews'

    idroomReviews = Column(Integer, primary_key=True, autoincrement=True)
    description = Column(Text, nullable=False)
    stars = Column(Integer, nullable=False)
    rooms_idrooms = Column(Integer, ForeignKey('rooms.idrooms'), nullable=False)

    room = relationship("Room")


class RoomPicture(Base):
    __tablename__ = 'roomPicture'

    idroomPicture = Column(Integer, primary_key=True, autoincrement=True)
    picture_url = Column(Text, name="picURL", nullable=False)
    rooms_idrooms = Column(Integer, ForeignKey('rooms.idrooms'), nullable=False)

    room = relationship("Room")


class User(Base):
    __tablename__ = 'users'

    idusers = Column(Integer, primary_key=True, autoincrement=True)
    username = Column(VARCHAR(45), nullable=False)
    email = Column(VARCHAR(100), nullable=False)
    phoneNumber = Column(VARCHAR(45), nullable=False)
    userBehaviour = Column(VARCHAR(255), nullable=False)
    user_first_name = Column(VARCHAR(45), nullable=False)
    user_last_name = Column(VARCHAR(45), nullable=False)
    user_password_salted = Column(VARCHAR(45))


class UserAddress(Base):
    __tablename__ = 'userAddress'

    iduserAddress = Column(Integer, primary_key=True, autoincrement=True)
    address = Column(VARCHAR(255))
    postalCode = Column(Integer)
    users_idusers = Column(Integer, ForeignKey('users.idusers'), nullable=False)

    user = relationship("User")


class BookedRoom(Base):
    __tablename__ = 'bookedRooms'

    id = Column(Integer, ForeignKey('rooms.idrooms'), primary_key=True, name="rooms_idrooms", autoincrement=True)
    users_idusers = Column(Integer, ForeignKey('users.idusers'), primary_key=True, autoincrement=True)
    start_date = Column(DateTime, nullable=False)
    end_date = Column(DateTime, nullable=False)
    overal_price = Column(VARCHAR(45))

    room = relationship("Room")
    user = relationship("User")

