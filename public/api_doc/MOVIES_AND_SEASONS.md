**An endpoint to return the movies, ordered by creation.**
----

* **URL**
  ```
  api/v1/gallery_items
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
                "id": 5,
                "title": "City Lights",
                "plot": "Frankly, my dear, I don’t give a damn.",
                "type": "Movie",
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
                "type": "Movie",
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
            },
            {
                "id": 7,
                "title": "Raging Bull",
                "plot": "May the Force be with you.",
                "type": "Movie",
                "created_at": "2021-01-31T13:14:40.000Z",
                "purchase_options": [
                {
                    "id": 13,
                    "price": 2.38,
                    "video_quality": "HD"
                },
                {
                    "id": 14,
                    "price": 2.62,
                    "video_quality": "SD"
                }
                ]
            },
            {
                "id": 8,
                "title": "It Happened One Night",
                "plot": "What we've got here is failure to communicate.",
                "type": "Movie",
                "created_at": "2021-01-31T13:14:40.000Z",
                "purchase_options": [
                {
                    "id": 15,
                    "price": 2.53,
                    "video_quality": "HD"
                },
                {
                    "id": 16,
                    "price": 2.51,
                    "video_quality": "SD"
                }
                ]
            }
        ]
    ```
