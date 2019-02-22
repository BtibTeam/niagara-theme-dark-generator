# Presentation
This repository intends to make it very easy for a Niagara System Integrator to make its own theme without using IntelliJ or Eclipse, just answering a couple of questions on the console. The module is then built automatically and added to your modules. It also contains some enhancements on the classic Niagara theme with some widgets styling and a library of common images in several colors and sizes. 

![image](https://user-images.githubusercontent.com/24372104/53259126-9a377780-36ce-11e9-9045-bf7e16706ac5.png)

# Installation
Before you can build your own theme, you need to install those dependencies on your computer
- Node JS ( [Download](https://nodejs.org/en/download/) )
- Niagara 4.2 or higher

# Download
If you're not famimiar with Git, you can download the module sources [here](https://github.com/BtibTeam/niagara-theme-generator/archive/develop.zip)
Otherwise launch this git command `git clone https://github.com/BtibTeam/niagara-theme-generator.git` to retrieve the sources

Open the folder and launch the dependencies installation by double-cliking on **setup.bat**. This step might take a few minutes.
You will be requested to give the admin rights to the system, please accept it.

# Creation of a theme
- Double-click on the file **build.bat**
- You will be requested by the name of the theme. Specify **themeACME** for example then press Enter.
![image](https://user-images.githubusercontent.com/24372104/53259814-5d6c8000-36d0-11e9-8373-09a9e98a0096.png)

- Specify a description for the theme then press **Enter**
![image](https://user-images.githubusercontent.com/24372104/53259855-7412d700-36d0-11e9-8211-8396f242da51.png)

- Specify the name of your company that will be used as the Vendor in Niagara, then press **Enter**
![image](https://user-images.githubusercontent.com/24372104/53259909-99074a00-36d0-11e9-9573-8251dd403f97.png)

- Specify your Niagara installation folder path. Example `C:\Niagara\Niagara-4.7.109.20`. Then press **Enter**
![image](https://user-images.githubusercontent.com/24372104/53259984-c3f19e00-36d0-11e9-9a09-1d2e5781d64b.png)

Now the system will build the module. It might take a few minutes.
If this first test succeeds, it means you properly configured your environment. You will find the module in your Niagara installation folder according to the name you gave.
![image](https://user-images.githubusercontent.com/24372104/53260076-f69b9680-36d0-11e9-9378-c72e0ec7237a.png)

The tool stores the value you entered, so next time you just have to say yes, yes, yes :).
![image](https://user-images.githubusercontent.com/24372104/53260192-32cef700-36d1-11e9-9fd3-fa95d66bcc2a.png)

# Selection of the theme in Niagara
The theme can be selected at two different levels
- In the Workbench: Tools > Options > General > Active Theme
- On the Webbrowser for each user: Station > Config > Services > UerService > {myUser} > Default Web Profile > HxTheme

**For the Workplace**
Open the Tools options and select the Active Theme. (Don't forget to restart your Workbench after building the module and after selecting it in the list)
![image](https://user-images.githubusercontent.com/24372104/53260313-71fd4800-36d1-11e9-88db-d567a0c1c80f.png)

**For the WebBrowser**
The theme of the WebBrowser is given by user
- Go to the User Service
- For each user Select the right theme

![image](https://user-images.githubusercontent.com/24372104/53260438-ca344a00-36d1-11e9-9506-155b9626d6ea.png)

# Modifying the theme
Now, you know how to build a theme with your name, you're gonna see how you can integrate your own ressources and personnalize Niagara style. You can personnalize Workbench icons, widgets styling both in the Worbench and in the Webbrowser.

All the modifications happen in the `src` folder.

## Changing images
To override Niagara default icons, we advise you to override images. To do that:
- Find the path of the image to override (like `module://icons/x16/add.png`)
- Access to the `src > imageOverrides` folder of your theme resources
- Create a similar arborescence (without the prefix module://) like icon/x16
- Add your image inside

So, you should have something like:
> src/
>     - imageOverrides/
>         - icons/
>             - x16/
>                 - add.png

## Modifying components appearance
Every component and widget can be personalized on both the Workbench and the WebBrowser. You're going to need some knowledge on CSS, LESS, and NSS.
NSS is a language created by Tridium to handle the styling in the Workbench. To get more information we advise you to give a look at this article
(https://www.niagara-community.com/articles/Product_Guide/Workbench-Theming)[https://www.niagara-community.com/articles/Product_Guide/Workbench-Theming]

- To update the nss or the less, open a text editor (like Visual Studio Code) and change the style.
- We advise you to create independant files to avoid conflicts with CSS and LESS if you want automatic updates (see below)

# Automatic update of the theme
The theme is regularly updated by the community. If you want to benefit from updates, you can use the power of git to do it. To avoid conflicts
- Use the imageOverrides folder to change images
- Use your own files for the CSS or LESS styling
- Change the nss

**Dependencies**
If you're running Windows, you need to install git with **Git BASH**

**Implementation**
Open a command line (bash)
![image](https://user-images.githubusercontent.com/24372104/53261391-2a2bf000-36d4-11e9-9914-7c227db46abc.png)

- Clone the theme with git (if you haven't done it yet) `git clone https://github.com/BtibTeam/niagara-theme-generator.git`
- Do your modifications

If you want to do it manually:
- Add you modifications to git with `git add . `
- Save your modifications with `git commit -m "Udpate ...`
- Pull updates from the server `git pull --rebase`

If you want to do it automatically:
Double click on **update.bat**. It will launch the previous procedure.

If you have conflicts, you will have to resolve them using standard git commands

#Contributing
You're welcome to contribute to the project. We'll review you PR with attention.