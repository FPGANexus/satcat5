# ------------------------------------------------------------------------
# Copyright 2021, 2022 The Aerospace Corporation
#
# This file is part of SatCat5.
#
# SatCat5 is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# SatCat5 is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
# License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with SatCat5.  If not, see <https://www.gnu.org/licenses/>.
# ------------------------------------------------------------------------
#
# This script packages a Vivado IP core: satcat5.cfgbus_i2c_controller
#

# Create a basic IP-core project.
set ip_name "cfgbus_i2c_controller"
set ip_vers "1.0"
set ip_disp "SatCat5 ConfigBus I2C Controller"
set ip_desc "Controller for an external I2C interface."

set ip_root [file normalize [file dirname [info script]]]
source $ip_root/ipcore_shared.tcl

# Add all required source files:
ipcore_add_file $src_dir/common/*.vhd
ipcore_add_top  $ip_root/wrap_cfgbus_i2c_controller.vhd

# Connect I/O ports
ipcore_add_cfgbus Cfg cfg slave
ipcore_add_gpio i2c_sclk
ipcore_add_gpio i2c_sdata

# Set parameters
ipcore_add_param DEV_ADDR devaddr 0 \
    {ConfigBus device address (0-255)}

# Package the IP-core.
ipcore_finished
