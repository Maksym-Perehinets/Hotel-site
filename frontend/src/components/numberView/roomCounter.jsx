import { useState, useEffect } from 'react'

const RoomCounter = () => {
    // const [roomStatus, setRoomStatus] = useState(1);
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

  return (
    <>
        <div className='container'>
          <div className='economy-div'>
              <span>Economy</span>
              <img 
              src={"https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-"+imgArray[0][picIndex]+".jpg"} 
              alt="No Image😭😭😭" />
              <p>Compact yet comfortable, the economy option provides essential 
                amenities for a budget-conscious traveler. 
                It offers a cozy space with basic furnishings and facilities, 
                ideal for those seeking affordability without compromising too 
                much on comfort.</p>
                <button className='bookBtn'>Book it</button>
          </div>

          <div className='standard-div'>
              <span>Standard</span>
              <img 
              src={"https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-"+imgArray[1][picIndex]+".jpg"} 
              alt="No Image😭😭😭" />
              <p>The standard room strikes a balance between value and 
                comfort, catering to the needs of most travelers. It typically includes 
                a well-appointed living space with standard amenities, providing a comfortable 
                stay for both business and leisure guests.</p>
                <button className='bookBtn'>Book it</button>
          </div>

          <div className='deluxe-div'>
              <span>Deluxe</span>
              <img 
              src={"https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-"+imgArray[2][picIndex]+".jpg"} 
              alt="No Image😭😭😭" />
              <p>The deluxe room offers an elevated level of comfort 
                , with upscale furnishings and luxurious amenities. 
                Guests can expect spacious accommodations, premium bedding, and additional 
                perks, creating atmosphere for a memorable stay.</p>
                <button className='bookBtn'>Book it</button>
          </div>

          <div className='lux-div'>
          <div className='suite-div'>
              <span>Suite</span>
              <img 
              src={"https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-"+imgArray[3][picIndex]+".jpg"} 
              alt="No Image😭😭😭" />
              <p>The suite presents a spacious and elegant retreat, perfect for 
                guests seeking extra comfort and privacy. Featuring separate living 
                and sleeping areas, along with enhanced amenities such as a mini-bar 
                or a private balcony, the suite offers a luxurious experience for 
                discerning travelers.</p>
                <button className='bookBtn'>Book it</button>
          </div>

          <div className='penthouse-div'>
              <span>Penthouse</span>
              <img 
              src={"https://hote0site0tspp.blob.core.windows.net/images/hotel-room-picture-"+imgArray[4][picIndex]+".jpg"} 
              alt="No Image😭😭😭" />
              <p>The penthouse epitomizes luxury and exclusivity, 
                providing the pinnacle of accommodation within a hotel. Boasting 
                expansive living spaces, bespoke furnishings, and breathtaking views, 
                the penthouse offers an unparalleled level of opulence and sophistication 
                for the most discerning guests.</p>
                <button className='bookBtn'>Book it</button>
          </div>
          </div>
        </div>
    </>
  )
}

export default RoomCounter