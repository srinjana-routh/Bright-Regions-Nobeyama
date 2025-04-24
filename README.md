# Bright-Regions-Nobeyama
This is an Interactive Data Language script of Adaptive Image Segmentation algorithm to be applied for Nobeyama Radioheliograph dataset to seperate Bright Regions larger than  0.167 arcmin^2 in heliographic coordinates

## Features

- Calculates brightness thresholds to identify intense emission regions
- Determines areas of bright plasma exceeding set thresholds
- Visualizes and stores bright region maps

## Requirements

- IDL (Interactive Data Language)
- SolarSoftWare (SSW) environment configured for radio and FITS data analysis

## How to Run

1. Open your IDL environment within an SSW session.
2. Load the script:
   ```idl
   .compile bright_plasma_nobeyama.pro
3. In a an existing script:
   ```idl
   mask = bright_regions_nobeyama(heliographic_image)
