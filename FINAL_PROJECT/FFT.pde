
void fft(){
 for (int i = 0; i < fft.specSize(); i++) {
        pushMatrix();
        translate(width/2, height/2);

        float angle = map(i, 0, fft.specSize(), 0, TWO_PI + PI);
        float radius = 150;

        sum[i] += (fft.getBand(i) - sum[i]) * .2;

        rotate(angle);
        translate(0, radius);
        fill(255);
        len = (fft.getBand(i))*.25;
        rect(0, 0, 5, sum[i]*15);
        popMatrix();
      } 
}
