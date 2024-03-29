/******************************************************************************\
 * British Broadcasting Corporation
 * Copyright (c) 2006
 *
 * Author(s):  Julian Cable, Ollie Haffenden, Andrew Murphy
 *
 ******************************************************************************
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *
\******************************************************************************/
#ifndef _JMLSCE_H

#include "PacketSCE.h"
#include "DataGroupEncoder.h"
#include <fstream>

class JMLSCE : public PacketSCE
{
public:
    JMLSCE():PacketSCE(),
        packet_queue(),dge(),
        dg_payload_size(0),max_queue_depth(100){}
	virtual void NextFrame(bytevector& buf, size_t max, double stoptime=0);
    virtual void ReConfigure(const ServiceComponent&);

protected:
  packetqueue packet_queue;
  PacketEncoder packet_encoder;
  DataGroupEncoder dge;
  vector<bytevector> data_unit;
  size_t dg_payload_size;
  size_t max_queue_depth;
  void fill(double stoptime);
};

#endif
