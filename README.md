Tive problemas em definir a melhor arquitetura. Pensando num projeto real, deveriamos ter um model Company que tem muitos users e muitas meeting_rooms. Teriamos usuarios com distintos roles. Um admin poderia criar e deletar meeting_rooms e o usuario padrao poderia apenas fazer bookings. Porem tambem me pareceu muito complexo esse sistema para um desafio tecnico.

Decidi fazer uma versao mais simples em que so ha 1 usuario, que é a propria empresa. Todos compartilham as mesmas credenciais para bookar salas, criar e deleta-las, ja que o foco nao seria o usuario e sim o booking das salas.

O sistema tem testes unitarios para os models. Tem um job para atualizar o status do booking para completed true. A autenticacao foi feita com devise. A model Booking tem validacoes que impedem horarios fora do expediente e sobreposicao de horarios.

Com mais tempo e menos correria no trabalho poderia fazer um sistema mais completo, fullstack etc. Mas por hora foi o melhor que pude fazer para apresentar algo em agradecimento pela oportunidade.


Bookings Controller

Index
Endpoint: GET /bookings
Description: Returns a list of all bookings made by the current user.
Response: JSON array of booking objects.

Show
Endpoint: GET /bookings/:id
Description: Returns the details of a specific booking.
Parameters: id (integer) - ID of the booking.
Response: JSON object of the booking.

Create
Endpoint: POST /bookings
Description: Creates a new booking.
Parameters: meeting_room_id (integer), start_time (datetime), end_time (datetime), name (string), in_charge (string).
Response: JSON object of the created booking.

Update
Endpoint: PUT /bookings/:id
Description: Updates a specific booking.
Parameters: id (integer) - ID of the booking, meeting_room_id (integer), start_time (datetime), end_time (datetime), name (string), in_charge (string).
Response: JSON object of the updated booking.

Destroy
Endpoint: DELETE /bookings/:id
Description: Deletes a specific booking.
Parameters: id (integer) - ID of the booking.
Response: No content.

MeetingRooms Controller

Index
Endpoint: GET /meeting_rooms
Description: Returns a list of all meeting rooms.
Response: JSON array of meeting room objects.

Show
Endpoint: GET /meeting_rooms/:id
Description: Returns the details of a specific meeting room.
Parameters: id (integer) - ID of the meeting room.
Response: JSON object of the meeting room.

Create
Endpoint: POST /meeting_rooms
Description: Creates a new meeting room.
Parameters: name (string).
Response: JSON object of the created meeting room.

Update
Endpoint: PUT /meeting_rooms/:id
Description: Updates a specific meeting room.
Parameters: id (integer) - ID of the meeting room, name (string).
Response: JSON object of the updated meeting room.

Destroy
Endpoint: DELETE /meeting_rooms/:id
Description: Deletes a specific meeting room.
Parameters: id (integer) - ID of the meeting room.
Response: No content.

Please note that all the POST, PUT, and DELETE requests should include a Content-Type: application/json header and the request body should be a JSON object. Also, the authenticate_user! before action in the MeetingRoomsController means that a user must be authenticated to perform these actions guides.rubyonrails.org,
