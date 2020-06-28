# Basic DRb Example

### What is DRb?
Distributed Ruby or DRb allows Ruby programs to communicate with each other on the same machine or over a network. DRb uses remote method invocation to pass commands and data between processes.

### Rock, paper scissor game tutorial


1. Open up a new terminal window.

2. Start the Game server. ([View Source](/game_server.rb))

```
$ ruby game_server.rb druby://localhost:8787
```

3. Open up a second terminal window.

4. Open an IRB session.

```
$ irb --prompt simple -I . -r game.rb -r drb/drb
```

5. Connect to the Game server and start a new game.

```ruby
>> game = Game.new
>> game.server_uri = 'druby://localhost:8787'
```

6. Play the game against the machine. ([View Source](/game.rb))

```ruby
>> game.play('rock')

#=> "Computer plays Paper - You Lose!"
```
