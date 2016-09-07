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
with Ada.Containers.Bounded_Ordered_Sets;
with Ethernet.Datagram_Socket;
with HFID_String;

package Power_Line_Adapter is

   type Adapter_Type is tagged private;

   Max_Adapters : constant := 16;

   function "<"(Left  : in Adapter_Type;
                Right : in Adapter_Type) return Boolean;

   function "="(Left  : in Adapter_Type;
                Right : in Adapter_Type) return Boolean;

   function Get_MAC_Address(Adapter : Adapter_Type) return Ethernet.MAC_Address_Type;

   function Get_Manufacturer_HFID(Adapter: in Adapter_Type;
                                  Socket : in Ethernet.Datagram_Socket.Socket_Type) return HFID_String.Bounded_String;

   function Get_User_HFID(Adapter : in Adapter_Type;
                          Socket  : in Ethernet.Datagram_Socket.Socket_Type) return HFID_String.Bounded_String;

   function To_String(Adapter : in Adapter_Type) return String;

private

   type Adapter_Type is tagged
      record
         Adapter_Number : Positive;
         MAC_Address    : Ethernet.MAC_Address_Type;
         HFID           : HFID_String.Bounded_String;
      end record;

   procedure Create(Adapter        : in out Adapter_Type;
                    Adapter_Number : in     Positive;
                    MAC_Address    : in     Ethernet.MAC_Address_Type;
                    HFID           : in     HFID_String.Bounded_String);

end Power_Line_Adapter;