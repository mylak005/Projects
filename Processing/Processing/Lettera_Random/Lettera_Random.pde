import java.util.*;

char[] lettere = {'A','B','C','D','E','F','G','I','L','M','N','O','P','R','S','T','U','V','Z'};
int count = 0;

void setup() {
  int r = round(random(lettere.length - 1));
  print(lettere[r]);
}
