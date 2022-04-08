
class Enemy {
    var health = 100
    var attackStrength = 10
    
    func move() {
        print("Walk forwards")
    }
    
    func takeDamage(amount: Int) {
        health -= amount
        
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
