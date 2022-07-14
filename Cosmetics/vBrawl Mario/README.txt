Heya, this is my Blender recreation of Mario's character art in Brawl with some other goodies included. I'll go over each of them in detail.


 * The "Fighter Files" folder contains 30 Mario recolor skins. The first is a modified default Mario with colors to better match his character art in Brawl. His shoes have an added reflection texture to match his artwork as well. The following 6 are the default recolors with the added shoe shine. The rest are recolors I've made. There's a .txt file in the same folder listing what each of them are based on.


 * The "Poses" folder has the .anim file for use on other models.


 * The "Recolor Template" folder contains the recolor textures in their respective folders. 

 - The main focus here is the .psd file I used to make every recolor besides the defaults. I've included the layer groups for the recolors I made in the "Custom Recolors" group for your reference, with SMB1 Mario enabled. This was mostly done using gradient maps. The main advantage with Photoshop here is every texture is in the same file.
 - With the Slice tool and the "Save for Web (legacy)" feature, it's possible to export every texture separately with their respective naming convention. To export your textures, go to File->Export->Save for Web (Legacy), or Alt+Shift+Ctrl+S if you like shortcuts. Hit Save on the popup window, and choose the folder to export your textures to. Make sure these settings are set accordingly:

Format: Images only
Settings: Background Image
Slices: All User Slices.

Hit Save and your recolor should be exported, separated, and named accordingly. Sorry to GIMP users, but I made this using Photoshop. So far I haven't figured out how to replicate the process on GIMP yet.


 * The "Renders and Cosmetics" folder has the SD and HD cosmetics for in-game use as well as crop files for the CSProject asset cropper.
 - Make sure to use the specified crop mask for HD stocks or else it won't look accurate.


 * Finally, the "Scenes, Models, and Textures" folder has the .blend file of vBrawl Mario and a .txt file for eye texture positions. There's a few features I want to elaborate on.

 - The World material has an option to switch the background with a Brawl gradient or a solid color. There's options for intensity of the main world light, the color of the blank BG, and the color of the main world light.
 - On the top right you can enable rendering the whole model or just a stock icon by clicking the icons next to "Render" or "Stock".
 - To make a render, click RENDER FRAME on the right side, or press F12.
 - Anything rendered will automatically export and appear in the "Export" folder. Any existing renders made in there will be overwritten if you render again, so be mindful of that. You can change what name the renders will have with the Compositor on the top left.
 - You can also batch render multiple recolors at once. To do so you'll render as an animation so each frame will be a different recolor. This calls on the textures in the "Recolors" folder instead of the "textures" folder so you'll need to set the materials on the model to do that. First, click any part of the Mario model to select it. In the Shader Editor on the middle left, set the viewport from "World" to "Object". Click the node on the very right labeled "TOGGLE RECOLORS" and hit Tab to open it's group. Set the Fac value to 1 to enable batch recolor textures. On the right side, click the film icon next to the RENDER FRAME button to enable animation rendering. Right below that you can set the amount of frames you want to render. Finally, hit RENDER ANIMATION (or Ctrl+F12) and let it run. The resulting images should appear in the "Export" folder.
 - Currently the "Recolors" folder has the textures from the 30 recolors included as an example. You can substitute your own recolors by following the naming convention in that folder. Each number at the end of each file will correspond to the frame rendered and exported.


This was made to seamlessly merge into your CSProject folder.
Just drag and drop and you're good to go.

If you're using these for any reason in any modpack, ALL I ASK FOR
is to be credited. Thank you for waiting so long for this. Have fun!

-Mach 7