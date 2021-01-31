**An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.**
----

* **URL**
  ```
  api/v1/seasons
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
            "id": 29,
            "title": "Mike Rostenkowski",
            "plot": "That's no reason to cry. One cries because one is sad. For example, I cry because others are stupid, and that makes me sad.",
            "created_at": "2021-01-31T13:14:40.000Z",
            "episodes": [
            {
                "id": 33,
                "title": "Dead Dog Farm",
                "serial_num": 13
            },
            {
                "id": 30,
                "title": "Packard Sawmill",
                "serial_num": 16
            },
            {
                "id": 31,
                "title": "Packard Sawmill",
                "serial_num": 25
            },
            {
                "id": 32,
                "title": "Log Lady's Cabin",
                "serial_num": 71
            },
            {
                "id": 34,
                "title": "Fat Trout Trailer Park",
                "serial_num": 78
            }
            ],
            "purchase_options": [
            {
                "id": 24,
                "price": 2.09,
                "video_quality": "HD"
            }
            ]
        },
        {
            "id": 35,
            "title": "President Siebert",
            "plot": "Bazinga!",
            "created_at": "2021-01-31T13:14:40.000Z",
            "episodes": [
            {
                "id": 36,
                "title": "Ronette's Bridge",
                "serial_num": 13
            },
            {
                "id": 40,
                "title": "Deer Meadow",
                "serial_num": 23
            },
            {
                "id": 37,
                "title": "One Eyed Jack's",
                "serial_num": 26
            },
            {
                "id": 39,
                "title": "Calhoun Memorial Hospital",
                "serial_num": 55
            },
            {
                "id": 38,
                "title": "Dead Dog Farm",
                "serial_num": 95
            }
            ],
            "purchase_options": [
            {
                "id": 25,
                "price": 2.08,
                "video_quality": "HD"
            }
            ]
        },
        {
            "id": 41,
            "title": "Priya Koothrappali",
            "plot": "Bazinga!",
            "created_at": "2021-01-31T13:14:40.000Z",
            "episodes": [
            {
                "id": 46,
                "title": "Horne's Department Store",
                "serial_num": 35
            },
            {
                "id": 43,
                "title": "Palmer House",
                "serial_num": 41
            },
            {
                "id": 44,
                "title": "Deer Meadow",
                "serial_num": 46
            },
            {
                "id": 45,
                "title": "Easter Park",
                "serial_num": 52
            },
            {
                "id": 42,
                "title": "Ronette's Bridge",
                "serial_num": 57
            }
            ],
            "purchase_options": [
            {
                "id": 26,
                "price": 2.15,
                "video_quality": "HD"
            }
            ]
        }
      ]
    ```
