------------------------------------------------------------------------
--  pla-util - A power line adapter utility
--  Copyright (C) 2016 John Serock
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program. If not, see <http://www.gnu.org/licenses/>.
------------------------------------------------------------------------
package body Commands is

   Default_Receive_Timeout : constant := 250;
   Default_Send_Timeout    : constant := 250;

   function Discover_Adapters(Device_Name : in String) return Power_Line_Adapter_Sets.Set is separate;

   function Get_HFID(Device_Name : in String;
                     HFID_Level  : in HFID_Level_Type) return HFID_String.Bounded_String is separate;

end Commands;