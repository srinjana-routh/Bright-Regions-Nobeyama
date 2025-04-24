;==================================================
; Program: bright_plasma_nobeyama.pro
; Description: Adaptive Intensity Thresholding and Area Thresholding Algorithm for seperating bright regions in Nobeyama Radioheliograph Dataset
;
; Author: Open-Source Community Version by Routh et al. (2025)
; GitHub: https://github.com/srinjana-routh/Bright-Regions-Nobeyama
;==================================================

function bright_plasma_nobeyama,unsmoothed_img
	
				;SET AREA THRESHOLD AND INTENSITY THRESHOLD
		  		
		  		min_area = 5
		  		dims = SIZE(unsmoothed_img, /DIMENSIONS)
				smoothed_img = gauss_smooth(float(unsmoothed_img),[1.0,1.0],/edge_truncate,/nan)
				thresh = mean(smoothed_img,/nan) + 1*stddev(smoothed_img,/nan)	
				
				;CREATE STRUCTURING ELEMENTS FOR MORPHOLOGICAL OPERATIONS					
		  		
		  		semi_major_axis = 3 
				semi_minor_axis =   1
				nx = 2 * semi_major_axis + 1
				ny = 2 * semi_minor_axis + 1

				x = FINDGEN(nx) - semi_major_axis
				y = FINDGEN(ny) - semi_minor_axis

				xx = REPLICATE(1, ny) # x
				yy = y # REPLICATE(1, nx)

				structuring_element = (xx^2 / semi_major_axis^2 + yy^2 / semi_minor_axis^2) LE 1			
				strucElem = BYTE(structuring_element)
				
				;APPLY THE THRESHOLD AND MORPHOLOGICAL OPERATIONS TO REMOVE SPURIOUS DETECTIONS
		  		mask = smoothed_img gt thresh
				mask = morph_open(mask, strucElem)
		  		mask = morph_close(mask, strucElem)
		  		
		  		;IDENTIFY ALL DETECTED AREAS AND CHECK WHICH REGIONS HAVE AREAS GREATER THAN THRESHOLD AND STORE THEM IN A SEPERATE MASK
				contour,mask,path_info=pathinfo,path_xy=pathxy,/path_data_coords
				i_new=[]
				i_old =[]

			for i = 1, (n_elements(pathinfo) - 1 ) do begin
			
				 line = [lindgen(pathinfo(i).n), 0]
				 oroi = obj_new('idlanroi', (pathxy(*,pathinfo(i).offset + line))[0, *], (pathxy(*,pathinfo(i).offset + line))[1, *])
				 
				 
				 maskresult = oroi -> computemask(dimensions = [dims[0], dims[1]])
				 image_statistics, smoothed_img, mask = maskresult, count = maskarea
				 
				 if abs(maskarea) ge min_area then begin
				
					 roi = float(smoothed_img)
					 
					 ind = where(maskresult eq 0)
					 roi[ind] = !Values.F_NaN
					 
					 i_new =[i_new,i]
					 
					 
				 endif else  obj_destroy, oroi
;				 
;   				
				 
			endfor
			
			mask_new=bytarr(dims[0],dims[1])
			
			foreach i,i_new do begin

				line = [lindgen(pathinfo(i).n), 0]
				nroi = obj_new('idlanroi', (pathxy(*,pathinfo(i).offset + line))[0, *], (pathxy(*,pathinfo(i).offset + line))[1, *])
				mask_new = mask_new+nroi -> computemask(dimensions = [dims[0], dims[1]])
				obj_destroy, nroi
				
			endforeach

		  		
;RETURN THE MASK				
 		
return,mask_new
end
