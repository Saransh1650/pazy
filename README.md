# pazy


##  Integrate biometric authentication options (Face or Fingerprint) for user access and Add photos from the device storage
<img src="https://github.com/user-attachments/assets/09f3c81e-2877-4320-ad14-c531e94b3668" width="270" style="padding-right: 200px;"/>



##  Photo addition log (including photo name and size). 
##  Maintain separate logs:  Photo access log (recording timestamps for each photo opened from the app).
 <img src="https://github.com/user-attachments/assets/9c5cca45-3caf-42c1-b336-0b75991bf7d3" width="270" style="padding-right: 200px;"/>


##  Encryption: Encrypt all stored photos and files using a robust encryption algorithm (e.g., AES-256) for enhanced security.

<img width="500" alt="Screenshot 2024-07-25 at 00 53 50" src="https://github.com/user-attachments/assets/c5ca46a3-571c-4acb-9e85-787c92f9e5c2">

## Ability to share photos within the app to external platforms and Remove photos, returning them to their original location. 


 <img src="https://github.com/user-attachments/assets/68166cd9-ffcd-4393-9cb0-5cf93e8e020a" width="270" style="padding-right: 200px;"/>


## Android Version of app

Note : The blank screen in the begining was for fingerprint authentication, but android will not screen record it.

https://github.com/user-attachments/assets/c12970b8-f082-48c7-9891-cea7179e4412


# Liberaries Used : 

  ### aes_crypt_null_safe: ^3.0.0
  This liberary is used for the encryption purpose, it encrypted a file and generates a .aes file which is then converted back into normal file
  
  
  
  
  ### firebase_core: ^3.2.0
  ### firebase_storage: ^12.1.1
It is used to keep the logs and save the timestamp of viewing images
  
 
  
  
  ### get: ^4.6.6
  It is a state management package which keep the app running smooth
  
  ### image_picker: ^1.1.2
  This package is used to pick images from the app storage 
  
  ### local_auth: ^2.2.0
  This package is used to provide Biometric Authentication and FaceID
  ### share_plus: ^9.0.0
   It is used to share the media externally as a file format 

   ## Note

 - [ ]  During development i have not set the firebase to work different for each person, this is a demo application hence only a single dataset is used for all demos.

- [ ] Encryted files are stored in the device itself, while saving the encrypted files on firebase, that data got currupted multiple times. hence path of the saved files are stored in databse.
- [ ] I have not seperately implemented the Pin authentication, bacuase app is automatically authorized via biometrics and FaceID, but I can demonstate it if needed.

