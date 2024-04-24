from sqlalchemy import Column, Integer, Text, ForeignKey, DateTime, JSON, Float, VARCHAR, BigInteger, Boolean
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()

class RoomStatus(Base):
    __tablename__ = 'roomStatus'

    idroomStatus = Column(Integer, primary_key=True, autoincrement=True)
    description = Column(Text, nullable=False)
    roomStatus = Column(Integer, nullable=False)

class Room(Base):
    __tablename__ = 'rooms'

    idrooms = Column(Integer, primary_key=True, autoincrement=True)
    roomStatus_idroomStatus = Column(Integer, ForeignKey('roomStatus.idroomStatus'), nullable=False)
    roomNumber = Column(Integer, nullable=False)
    roomDescription = Column(Text, nullable=False)
    numberOfBeds = Column(Integer, nullable=False)
    hasKitchen = Column(Boolean, nullable=False)
    price_perday = Column(Integer, nullable=False)

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
    picURL = Column(Text, nullable=False)
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

    rooms_idrooms = Column(Integer, ForeignKey('rooms.idrooms'), primary_key=True, autoincrement=True)
    users_idusers = Column(Integer, ForeignKey('users.idusers'), primary_key=True, autoincrement=True)
    start_date = Column(DateTime, nullable=False)
    end_date = Column(DateTime, nullable=False)
    overal_price = Column(VARCHAR(45))

    room = relationship("Room")
    user = relationship("User")

