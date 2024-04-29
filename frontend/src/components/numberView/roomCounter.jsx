import { useState, useEffect } from 'react'

const RoomCounter = () => {
    const [roomStatus, setRoomStatus] = useState(1);
    const [picIndex, setPicIndex] = useState(1);


    useEffect(() => {
        const id = setInterval(() => {
          setPicIndex((oldCount) => (oldCount >= 18 ? 1 : oldCount + 1));
        }, 8000);
      
        return () => {
          clearInterval(id);
        };
      }, []);

    const arrayRange = (start, stop, step) =>
    Array.from(
    { length: (stop - start) / step + 1 },
    (value, index) => start + index * step
    );

    const imgArrayEconomy = arrayRange(1,18,1);
    const imgArrayStandard = arrayRange(18,36,1);
    const imgArrayDeluxe = arrayRange(36,54,1);
    const imgArraySuite = arrayRange(54,72,1);
    const imgArrayPenthouse = arrayRange(72,98,1);

    const imgArray = [imgArrayEconomy, imgArrayStandard, imgArrayDeluxe,
        imgArraySuite, imgArrayPenthouse];

    const handleSelectChange = (event) => {
        setRoomStatus(event.target.value);
    };

  return (
    <>
            <span>Room Class</span>
        <select onChange={handleSelectChange} name="floor">
        <option selected disabled></option>
            <option value="4">Economy</option>
            <option value="0">Standard</option>
            <option value="1">Deluxe</option>
            <option value="2">Suite</option>
            <option value="3">Penthouse</option>
        </select>
        <div className='roomPicDiv'>
        <img
        className='roomPics'
        src={"https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-"+imgArray[roomStatus][picIndex]+".jpg"}
        alt={'No Image😭😭😭'} />
        </div>
    </>
  )
}

export default RoomCounter