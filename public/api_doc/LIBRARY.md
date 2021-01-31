**Returns list of alive library items order by expiry**
----

* **URL**
  ```
    api/v1/users/:user_id/purchases
  ```

* **Method:**

  ```
  GET
  ```
* **Request Parameters:**
  ```
  page(type:integer, optional:true)
  per_page(type:integer, optional:true)
  ```


*  **URL Params**

   **Required:**
 
   `user_id=[integer]`

* **Response:**
  - Examples 1 If user with specific id not found
    **Status:**
     404 
    **Content:** 
    ``` json
      {
        "error": "Couldn't find User with 'id'=50"
      }
    ```
    
  - Examples 2 If user has alive library items
    **Status:**
     200
    **Content:** 
    ``` json
      [
            {
                "id": 11,
                "expires_at": "2021-02-02T16:41:32.000Z",
                "gallery_item": {
                    "title": "Raiders of the Lost Ark",
                    "plot": "Frankly, my dear, I don’t give a damn.",
                    "type": "Movie"
                },
                "purchase_option": {
                    "id": 7,
                    "price": 2.43,
                    "video_quality": "HD"
                }
            }
        ]
    ```
