import '../../CSS/NumberView/mainDiv.css'
import SelectRoomDiv from '../../components/numberView/SelectRoomDiv';


const MainDiv = () => {
  return (
    <div className='mainDiv'>
      <label htmlFor="">Rooms</label>
        <SelectRoomDiv />
    </div>
  )
}

export default MainDiv