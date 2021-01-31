**Returns list users in a system**
----

* **URL**
  ```
  api/v1/users
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
                "id": 1,
                "email": "audra@friesen.co"
            },
            {
                "id": 2,
                "email": "nathanial_weissnat@prosacco-dare.io"
            },
            {
                "id": 3,
                "email": "arla.bruen@lueilwitz.co"
            },
            {
                "id": 4,
                "email": "etsuko.will@wilkinson.biz"
            },
            {
                "id": 5,
                "email": "darwin@baumbach.org"
            }
        ]
    ```
