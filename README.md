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

## 📝 License

MIT License – free to use, modify, and distribute.

---

## 👩‍💻 Authors & Credits

Srinjana Routh

@unpublished{routh2025,
  author       = {Routh, Srinjana and Kumari, Anshu and Kandekar, Jaydeep and Pant, Vaibhav and Banerjee, Dipankar and Khan, Mohd. Saleem},
  title        = {Radio Insights into Chromospheric Large-Scale Flows using Nobeyama 17 GHz data: I. The Differential Rotation Profile},
  note         = {Manuscript in preparation. To be submitted to Astronomy and Astrophysics Letters, 2025},
  year         = {2025}
}

@ARTICLE{Routh2024,
       author = {{Routh}, Srinjana and {Jha}, Bibhuti Kumar and {Mishra}, Dibya Kirti and {Van Doorsselaere}, Tom and {Pant}, Vaibhav and {Chatterjee}, Subhamoy and {Banerjee}, Dipankar},
        title = "{Exploring the Dynamic Rotational Profile of the Hotter Solar Atmosphere: A Multiwavelength Approach Using SDO/AIA Data}",
      journal = {\apj},
     keywords = {Solar atmosphere, Solar differential rotation, Solar activity, Solar corona, Solar magnetic fields, Solar cycle, 1477, 1996, 1475, 1483, 1503, 1487, Astrophysics - Solar and Stellar Astrophysics},
         year = 2024,
        month = nov,
       volume = {975},
       number = {2},
          eid = {158},
        pages = {158},
          doi = {10.3847/1538-4357/ad7ba2},
archivePrefix = {arXiv},
       eprint = {2409.03582},
 primaryClass = {astro-ph.SR},
       adsurl = {https://ui.adsabs.harvard.edu/abs/2024ApJ...975..158R},
      adsnote = {Provided by the SAO/NASA Astrophysics Data System}
}
