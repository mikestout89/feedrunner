= Feed Runner APIs

== Accounts API
== Feed API
  Post data
  POST: /api/v1/feeds
    Parameters accepted
      first_name          String *
      last_name           String *
      email               String *
      ip                  String *
      category            String *
    Results
      {status: 1, data: posted successfully}

    curl \
      -F "first_name=tester1" \
      -F "last_name=lname" \
      -F "email=tester@email.com" \
      -F "ip=128.128.15.101" \
      -F "category=Fianance" \
      http://localhost:3000/api/v1/feeds
