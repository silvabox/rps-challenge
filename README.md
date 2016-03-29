# RPS Challenge

## Playing from the command line in a REPL
```
$ irb
  > require '.lib/weapon'
=> true
  > rock = Weapon.rock
=> Rock
  > paper = Weapon[:paper]
=> Paper
  > rock.beats? paper
=> false
  > scissors = Weapon['Scissors']
=> Scissors
  > random = Weapon.all.sample
=> Lizard
  > scissors.beats? random
=> true
```
  
## Playing in the browser
```
$ bundle install
$ rackup
```

## Running the tests
```sh
$ bundle install
$ rspec  #run unit tests
$ cucumber  #run feature tests
```

## Notes on the solution
The purpose of the solution is to demonstrate an OO approach to RPS that does not require `if` statements.  This is encapsulated within `Weapon`, along with some metaprogramming techniques to create the convenience methods:
```ruby
def define_helper(name)
  instance = self
  self.class.define_singleton_method name do
    instance
  end
end
```
Which creates a class method on `Weapon` for new weapons:
```
$ irb
  > require '.lib/weapon'
=> true
  > Weapon.new(:foo)
=> Foo
  > Weapon.foo
=> Foo
```
**Note:** This does not currently validate the weapon name against existing class methods, so use with caution:

```
$ irb
  > require '.lib/weapon'
=> true
  > Weapon.new(:new)
=> New
  > Weapon.new
=> New
  > Weapon.new(:foo) #argh!
```
