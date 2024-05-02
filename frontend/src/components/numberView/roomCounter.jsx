import { useState, useEffect } from 'react';

const RoomCounter = () => {
    const [rooms, setRooms] = useState([]);

    useEffect(() => {
        fetch('http://localhost:8080/api/v1/room/get-many-rooms/5')
            .then(response => response.json())
            .then(data => setRooms(data))
            .catch(error => console.error('Error fetching rooms:', error));
    }, []);

    const roomType = ['Economy', 'Standard', 'Deluxe', 'Suite', 'Penthouse'];

    // Function to convert status number to stars
    const getStatusStars = (status) => {
        return '☆'.repeat(status);
    };

    return (
        <div className='container'>
            {rooms.map((room, index) => (
                <div key={room.id} className={`room-div ${roomType[index].toLowerCase()}-div`}>
                    <h3>{roomType[index]}</h3>
                    <img src={room.picture_url} alt={`Room ${room.id}`} />
                    <p>This room has {room.number_of_beds} bed(s), costs ${room.price_per_day} per day, and is currently rated at {getStatusStars(room.status)}.</p>
                    <button className='bookBtn'>Book it</button>
                </div>
            ))}
        </div>
    );
};

export default RoomCounter;
