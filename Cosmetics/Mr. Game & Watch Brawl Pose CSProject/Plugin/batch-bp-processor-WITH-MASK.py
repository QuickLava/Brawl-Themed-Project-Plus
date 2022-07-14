#!/usr/bin/env python

# GIMP Python-fu plugin to crop and resize multiple BPs as part of the CSP Standardization project
# Feedback to tryptech#8049 on Discord

from gimpfu import *
import os

def crop_csp_process(file_inpath, file_outpath, file_mask, file_crop, hd_resize) :
	
	files =[]
	if os.path.isdir(file_inpath) == True:
		files = [f for f in os.listdir(file_inpath) if os.path.isfile(os.path.join(file_inpath,f))]
	for element in files:
		filename = os.path.splitext(element)[0]

		#Checks if file is PNG
		filename,fileext = os.path.splitext(element) 
		if fileext[1:].upper() != 'PNG':
			  continue
		
		# Get image location
		image = pdb.file_png_load(os.path.join(file_inpath,element),element)
		# Open image
		# display = pdb.gimp_display_new(image)
		# Add mask to new layer over image
		layer_mask = pdb.gimp_file_load_layer(image,file_mask)
		pdb.gimp_image_insert_layer(image,layer_mask,None,0)
	# Mask layer alpha to selection
		pdb.gimp_image_select_item(image,2,pdb.gimp_image_get_active_layer(image))
		pdb.gimp_image_remove_layer(image,layer_mask)
	# Apply mask
		pdb.gimp_edit_clear(pdb.gimp_image_get_active_layer(image))
	# Add crop to new layer over image
		layer_crop = pdb.gimp_file_load_layer(image,file_crop)
		pdb.gimp_image_insert_layer(image,layer_crop,None,0)
	# Mask layer alpha to selection
		pdb.gimp_image_select_item(image,2,pdb.gimp_image_get_active_layer(image))
		pdb.gimp_image_remove_layer(image,layer_crop)
	# Invert Selection
		pdb.gimp_selection_invert(image)
	# Crop to selection
		dimensions = pdb.gimp_selection_bounds(image)
		pdb.gimp_image_crop(image,dimensions[3]-dimensions[1],dimensions[4]-dimensions[2],dimensions[1],dimensions[2])
	# Resize and output CSPs

		if hd_resize == True:
			reWidth = 144
			reHeight = 168
			pdb.gimp_image_scale(image,reWidth,reHeight)
			suffix = "_BP_HD.png"

			pdb.gimp_file_save(image,pdb.gimp_image_get_active_drawable(image),os.path.join(file_outpath,filename + suffix), filename + suffix)

		reWidth = 48
		reHeight = 56
		pdb.gimp_image_scale(image,reWidth,reHeight)
		suffix = "_BP.png"

		pdb.gimp_file_save(image,pdb.gimp_image_get_active_drawable(image),os.path.join(file_outpath,filename + suffix), filename + suffix)
		pdb.gimp_image_delete(image)
	return

register(
	"python-fu-BATCH-BP-PROCESSOR-MASK",
	"Crops images for battle portraits (Make sure mask matches image dimensions). Results go to the stock image folder. \n MAKE SURE THAT THE PAINTBRUSH TOOL IS SELECTED BEFORE YOU START!",
	"Using a user-defined mask, crops all images in a user-defined directory to a certain size, and offers resize options. The final result is then saved with the appropriate suffix to the output folder",
	"tryptech",
	"tryptech",
	"2018",
	"<Toolbox>/Tools/BP Processor (Batch)",
	"",
	[
		(PF_DIRNAME, "file_inpath", "Input Image Folder", "/tmp"),
		(PF_DIRNAME, "file_outpath", "Output Image Folder", "/tmp"),
		(PF_FILE, "file_mask", "Stock Mask File", None),
		(PF_FILE, "file_crop", "Stock Crop File", None),
(PF_TOGGLE, "hd_resize", "Include HD assets: ", 1)
	],
	[],
	crop_csp_process
)
	
main()
