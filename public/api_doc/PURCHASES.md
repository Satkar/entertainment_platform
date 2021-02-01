**An endpoint for a user to perform a purchase of a content.**
----

* **URL**
  ```
    /api/v1/users/:user_id/purchases
  ```

* **Method:**

  ```
  POST
  ```
  
* **Data Params**

  ``` json
    {   "user_id":"500",
       "purchase": {
                    
                    "gallery_item_id":"1",
                    "purchase_option_id":"2"
                   }
     }
  ```

* **Response:**
  - Example 1 when user id is invalid
   * **Code:** 404 <br />
   * **Content:** <br />
    ``` json
      {
        "error": "Couldn't find User with 'id'=10000"
      }
    ```
    
  - Example 2 when  gallery_item_id is invalid
   * **Code:** 404 <br />
   * **Content:** <br />
    ``` json
        {
            "error": "Couldn't find GalleryItem with 'id'=1000000"
        }
    ```
   - Example 3 when all parameters are valid and User has not yet purchased the library item
    * **Code:** 200 <br />
    * **Content:** <br />
    ``` json
        {
            "message": "Subscribed successfully."
        }
    ```
    
  - Example 4 when all parameters are valid but User has already purchased the library item
    * **Code:** 409 <br />
    * **Content:**<br />
    ``` json
      {
        "message": "Your can try this subscription after 1 day/s 23 hour/s 54 minute/s!"
      }
    ```
