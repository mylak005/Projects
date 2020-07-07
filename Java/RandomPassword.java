package random_passwords;

public class RandomPassword {
  
  public static void main(String[] args) {
    RandomPassword random = new RandomPassword();
    System.out.println(random.generatePassword(30));
  }

  private String generatePassword(int length) {
  
    char[] charArray = new char[length];
    
    for (int i = 0; i < length; i++) {
      charArray[i] = (char) (Math.random() * ((126 - 33) + 1) + 33);
    }
    
    String string = new String(charArray);
    return string;
  }
  
}
