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

#ifndef _ALSA_H
#define _ALSA_H

#include "sound.h"
#include <alsa/asoundlib.h>

class ALSA: public Sound
{
public:

  ALSA();

  ALSA(const ALSA& e);
  ALSA& operator=(const ALSA& e);
  virtual ~ALSA();

  virtual void open(const std::string& device, int channels);
  virtual void close();
  virtual void read(std::vector<float>& buffer);
  virtual bool is_open();

protected:

  snd_pcm_t* handle;
  int num_channels;
  snd_pcm_format_t format;
  size_t card_channels, left_chan, right_chan;
  double scale_factor;
};

#endif
