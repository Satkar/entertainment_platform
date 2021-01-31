**Returns list of movies order by creation with purchase options**
----

* **URL**
  ```
  api/v1/movies
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

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** 
    ``` json
      [
        {
            "id": 4,
            "title": "Raiders of the Lost Ark",
            "plot": "Frankly, my dear, I don’t give a damn.",
            "created_at": "2021-01-31T13:14:40.000Z",
            "purchase_options": [
            {
                "id": 7,
                "price": 2.43,
                "video_quality": "HD"
            },
            {
                "id": 8,
                "price": 2.29,
                "video_quality": "SD"
            }
            ]
        },
        {
            "id": 5,
            "title": "City Lights",
            "plot": "Frankly, my dear, I don’t give a damn.",
            "created_at": "2021-01-31T13:14:40.000Z",
            "purchase_options": [
            {
                "id": 9,
                "price": 2.39,
                "video_quality": "HD"
            },
            {
                "id": 10,
                "price": 2.91,
                "video_quality": "SD"
            }
            ]
        },
        {
            "id": 6,
            "title": "The Wizard of Oz",
            "plot": "What we've got here is failure to communicate.",
            "created_at": "2021-01-31T13:14:40.000Z",
            "purchase_options": [
            {
                "id": 11,
                "price": 2.09,
                "video_quality": "HD"
            },
            {
                "id": 12,
                "price": 2.41,
                "video_quality": "SD"
            }
            ]
        }
      ] 
    ```
