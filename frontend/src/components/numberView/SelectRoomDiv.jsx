import React from 'react'
import '../../CSS/NumberView/selectDiv.css'

const SelectRoomDiv = () => {
  return (
    <div className='selectDiv'>
        <span>Floor</span>
        <select name="floor" id="">
            <option value="1">1st floor</option>
            <option value="2">2nd floor</option>
            <option value="3">1rd floor</option>
            <option value="4">4th floor</option>
            <option value="5">5th floor</option>
            <option value="6">6th floor</option>
            <option value="7">7th floor</option>
        </select>
    </div>
  )
}

export default SelectRoomDiv