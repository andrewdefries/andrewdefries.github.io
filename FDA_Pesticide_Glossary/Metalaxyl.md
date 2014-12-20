---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.807639, 0.9617041, -1.658632, 1, 0, 0, 1,
-2.690832, 1.272851, 0.3413432, 1, 0.007843138, 0, 1,
-2.468199, 0.9878936, -0.7102093, 1, 0.01176471, 0, 1,
-2.430509, -0.01410899, -1.187523, 1, 0.01960784, 0, 1,
-2.334491, -2.335876, -2.213631, 1, 0.02352941, 0, 1,
-2.304263, 0.1210378, -1.375751, 1, 0.03137255, 0, 1,
-2.21198, 0.1427048, -3.733405, 1, 0.03529412, 0, 1,
-2.081491, 0.08057994, -1.214925, 1, 0.04313726, 0, 1,
-2.071105, 0.02132023, -1.929821, 1, 0.04705882, 0, 1,
-2.06753, 0.579933, -0.5893098, 1, 0.05490196, 0, 1,
-2.00101, -0.9150109, -2.308122, 1, 0.05882353, 0, 1,
-1.998366, -1.244265, -2.56378, 1, 0.06666667, 0, 1,
-1.991251, 0.851862, -0.2147835, 1, 0.07058824, 0, 1,
-1.974276, 0.03727146, -1.619136, 1, 0.07843138, 0, 1,
-1.948405, 0.4440925, -1.06531, 1, 0.08235294, 0, 1,
-1.932588, 0.04848124, -2.412403, 1, 0.09019608, 0, 1,
-1.929036, 1.783837, 1.168832, 1, 0.09411765, 0, 1,
-1.925132, -1.864947, -3.9253, 1, 0.1019608, 0, 1,
-1.909579, 0.1913126, -1.797944, 1, 0.1098039, 0, 1,
-1.906111, -0.1568084, -1.096142, 1, 0.1137255, 0, 1,
-1.895536, -0.9734542, -2.799761, 1, 0.1215686, 0, 1,
-1.858876, -1.026346, -1.4174, 1, 0.1254902, 0, 1,
-1.827763, 0.9133178, 0.5398239, 1, 0.1333333, 0, 1,
-1.822161, 0.883861, -1.529714, 1, 0.1372549, 0, 1,
-1.82133, 1.98536, 0.6169546, 1, 0.145098, 0, 1,
-1.816049, 1.290685, -1.804159, 1, 0.1490196, 0, 1,
-1.812076, -0.556183, -1.71554, 1, 0.1568628, 0, 1,
-1.798926, 1.375853, 0.5254633, 1, 0.1607843, 0, 1,
-1.766949, 0.7885221, 0.350667, 1, 0.1686275, 0, 1,
-1.752988, -0.07628404, -0.749726, 1, 0.172549, 0, 1,
-1.74967, -0.9432702, -1.247291, 1, 0.1803922, 0, 1,
-1.742436, 0.7019919, -3.413744, 1, 0.1843137, 0, 1,
-1.73701, 1.125523, -0.2288341, 1, 0.1921569, 0, 1,
-1.713698, -0.5671591, -2.878138, 1, 0.1960784, 0, 1,
-1.707815, -2.101923, -1.576503, 1, 0.2039216, 0, 1,
-1.697423, -0.6564293, -2.545112, 1, 0.2117647, 0, 1,
-1.689024, -0.5966561, -0.6279094, 1, 0.2156863, 0, 1,
-1.681509, -1.207321, -1.995304, 1, 0.2235294, 0, 1,
-1.678971, 1.757555, -0.9882744, 1, 0.227451, 0, 1,
-1.669343, -0.6070179, -4.104466, 1, 0.2352941, 0, 1,
-1.666072, -1.991395, -2.728561, 1, 0.2392157, 0, 1,
-1.657512, -1.307261, -2.072687, 1, 0.2470588, 0, 1,
-1.653024, -1.646926, -0.7930894, 1, 0.2509804, 0, 1,
-1.639328, 0.1348717, -0.3036926, 1, 0.2588235, 0, 1,
-1.638974, 1.512316, -1.375669, 1, 0.2627451, 0, 1,
-1.635012, -0.8718574, -1.829436, 1, 0.2705882, 0, 1,
-1.632339, -0.2481744, -3.619148, 1, 0.2745098, 0, 1,
-1.631685, -0.8127493, -1.419605, 1, 0.282353, 0, 1,
-1.625012, -1.259828, -1.378409, 1, 0.2862745, 0, 1,
-1.621373, 0.2656547, -0.7460888, 1, 0.2941177, 0, 1,
-1.617763, -0.3979739, -1.536358, 1, 0.3019608, 0, 1,
-1.608828, 0.8900049, -1.719251, 1, 0.3058824, 0, 1,
-1.608636, -0.0253921, 0.175786, 1, 0.3137255, 0, 1,
-1.606794, 0.5488953, -2.233196, 1, 0.3176471, 0, 1,
-1.600011, 2.482126, 0.4731908, 1, 0.3254902, 0, 1,
-1.588824, 0.4297079, -0.4941765, 1, 0.3294118, 0, 1,
-1.578262, -1.898749, -1.368913, 1, 0.3372549, 0, 1,
-1.574357, 0.2745011, -0.9307337, 1, 0.3411765, 0, 1,
-1.569607, -0.1505517, -3.089558, 1, 0.3490196, 0, 1,
-1.566653, -0.6700878, -1.04766, 1, 0.3529412, 0, 1,
-1.565466, 0.2848651, -1.596746, 1, 0.3607843, 0, 1,
-1.559818, 0.4537065, -1.685737, 1, 0.3647059, 0, 1,
-1.548791, 0.3555304, -1.854333, 1, 0.372549, 0, 1,
-1.538082, 0.3743967, 0.2410552, 1, 0.3764706, 0, 1,
-1.524616, 1.255169, -0.8706145, 1, 0.3843137, 0, 1,
-1.524475, 0.362689, -1.391535, 1, 0.3882353, 0, 1,
-1.518215, -0.3495399, -2.825871, 1, 0.3960784, 0, 1,
-1.514006, 0.7954249, -2.466251, 1, 0.4039216, 0, 1,
-1.504809, -1.119739, -3.512026, 1, 0.4078431, 0, 1,
-1.502115, 0.1752438, -1.010104, 1, 0.4156863, 0, 1,
-1.481853, -0.805837, -2.560373, 1, 0.4196078, 0, 1,
-1.470794, 0.1610703, -1.407663, 1, 0.427451, 0, 1,
-1.467009, 0.6605375, -1.5671, 1, 0.4313726, 0, 1,
-1.457901, 2.066922, -0.09010367, 1, 0.4392157, 0, 1,
-1.457729, -1.329414, -3.266098, 1, 0.4431373, 0, 1,
-1.448238, -0.08181744, -1.038119, 1, 0.4509804, 0, 1,
-1.442779, 2.634282, 0.3068359, 1, 0.454902, 0, 1,
-1.431496, -1.774498, -2.259825, 1, 0.4627451, 0, 1,
-1.431149, -0.4860878, -0.4473631, 1, 0.4666667, 0, 1,
-1.42832, -1.837055, -2.170598, 1, 0.4745098, 0, 1,
-1.414177, 1.153437, -0.642477, 1, 0.4784314, 0, 1,
-1.402421, -0.5642727, -1.077263, 1, 0.4862745, 0, 1,
-1.39634, 1.522132, -0.1593029, 1, 0.4901961, 0, 1,
-1.393215, -0.2927377, -1.747355, 1, 0.4980392, 0, 1,
-1.391716, 1.552938, -0.309872, 1, 0.5058824, 0, 1,
-1.387805, -0.7845266, -1.391119, 1, 0.509804, 0, 1,
-1.382376, 1.216248, -0.3064175, 1, 0.5176471, 0, 1,
-1.365508, 0.04852514, -0.761075, 1, 0.5215687, 0, 1,
-1.350962, -2.942538, -2.631474, 1, 0.5294118, 0, 1,
-1.33673, 1.750023, -1.288516, 1, 0.5333334, 0, 1,
-1.335485, -0.2248874, -3.746639, 1, 0.5411765, 0, 1,
-1.331634, -0.4589916, -3.157702, 1, 0.5450981, 0, 1,
-1.329229, 0.4300592, -0.8082996, 1, 0.5529412, 0, 1,
-1.318913, -0.5281219, -2.580401, 1, 0.5568628, 0, 1,
-1.318557, -0.9654946, -1.22093, 1, 0.5647059, 0, 1,
-1.318167, -1.716769, -3.537382, 1, 0.5686275, 0, 1,
-1.299589, -0.113086, -3.693286, 1, 0.5764706, 0, 1,
-1.293953, -0.5050309, -1.455124, 1, 0.5803922, 0, 1,
-1.288884, -1.547456, -1.688674, 1, 0.5882353, 0, 1,
-1.286359, -0.3613265, -1.132921, 1, 0.5921569, 0, 1,
-1.284485, 0.1653462, -2.441419, 1, 0.6, 0, 1,
-1.281024, -0.9943275, -2.652682, 1, 0.6078432, 0, 1,
-1.27737, -0.3323872, -2.152283, 1, 0.6117647, 0, 1,
-1.275551, -0.1588625, -1.888966, 1, 0.6196079, 0, 1,
-1.259105, -0.4723828, -3.11653, 1, 0.6235294, 0, 1,
-1.253014, -0.6874626, -1.533301, 1, 0.6313726, 0, 1,
-1.252724, 1.711321, -1.748185, 1, 0.6352941, 0, 1,
-1.251147, -0.8236589, -1.362548, 1, 0.6431373, 0, 1,
-1.249996, 0.2115977, -2.596689, 1, 0.6470588, 0, 1,
-1.240844, -0.03544502, -1.841474, 1, 0.654902, 0, 1,
-1.234406, -0.3717738, -1.721946, 1, 0.6588235, 0, 1,
-1.230064, -0.347671, -3.280478, 1, 0.6666667, 0, 1,
-1.229156, -2.336311, -2.589875, 1, 0.6705883, 0, 1,
-1.223177, -0.4261412, -1.532543, 1, 0.6784314, 0, 1,
-1.22271, -1.113189, -3.12684, 1, 0.682353, 0, 1,
-1.221247, -0.912375, -2.334379, 1, 0.6901961, 0, 1,
-1.215659, 1.263211, -1.73183, 1, 0.6941177, 0, 1,
-1.211463, 1.1442, -1.842259, 1, 0.7019608, 0, 1,
-1.208633, 1.566741, 1.421711, 1, 0.7098039, 0, 1,
-1.205241, 1.171527, -0.4030422, 1, 0.7137255, 0, 1,
-1.201779, -2.148797, -4.554075, 1, 0.7215686, 0, 1,
-1.201057, -1.976723, -1.399549, 1, 0.7254902, 0, 1,
-1.194526, 1.318409, -1.379267, 1, 0.7333333, 0, 1,
-1.192612, -0.4519149, -1.590891, 1, 0.7372549, 0, 1,
-1.182675, 0.07807338, -1.305286, 1, 0.7450981, 0, 1,
-1.179403, -0.8735946, -1.857625, 1, 0.7490196, 0, 1,
-1.156636, 0.6050563, -0.8592984, 1, 0.7568628, 0, 1,
-1.152293, 0.250747, -0.6218148, 1, 0.7607843, 0, 1,
-1.151206, -0.9744631, -2.610375, 1, 0.7686275, 0, 1,
-1.15082, 0.6429579, 0.5429437, 1, 0.772549, 0, 1,
-1.149516, -0.3394822, -0.4192693, 1, 0.7803922, 0, 1,
-1.146192, 0.1910752, -1.898781, 1, 0.7843137, 0, 1,
-1.143165, 0.2342868, -1.555869, 1, 0.7921569, 0, 1,
-1.141248, 0.4643792, -0.6760482, 1, 0.7960784, 0, 1,
-1.139982, 0.7989184, 0.5536281, 1, 0.8039216, 0, 1,
-1.138588, -0.3539951, -1.136184, 1, 0.8117647, 0, 1,
-1.136156, 0.8804572, -1.123966, 1, 0.8156863, 0, 1,
-1.133984, -0.1069501, -0.7636072, 1, 0.8235294, 0, 1,
-1.13178, -1.379987, -4.324568, 1, 0.827451, 0, 1,
-1.125506, 0.2495573, -1.387906, 1, 0.8352941, 0, 1,
-1.123259, 1.650747, 0.8319253, 1, 0.8392157, 0, 1,
-1.121034, -1.268753, -5.673871, 1, 0.8470588, 0, 1,
-1.120234, -0.3329104, -2.646928, 1, 0.8509804, 0, 1,
-1.118609, 0.2857457, -0.5245254, 1, 0.8588235, 0, 1,
-1.11472, 0.02709863, -1.256582, 1, 0.8627451, 0, 1,
-1.113801, -0.2350997, -1.700662, 1, 0.8705882, 0, 1,
-1.089642, -0.6292843, -2.209886, 1, 0.8745098, 0, 1,
-1.085416, 0.9783907, -0.8836814, 1, 0.8823529, 0, 1,
-1.084368, -1.386812, -2.709363, 1, 0.8862745, 0, 1,
-1.081051, 0.9337364, -2.781611, 1, 0.8941177, 0, 1,
-1.078889, 0.5891275, -0.4096516, 1, 0.8980392, 0, 1,
-1.078225, -1.27575, -2.539741, 1, 0.9058824, 0, 1,
-1.072011, -1.05967, -4.32549, 1, 0.9137255, 0, 1,
-1.071985, -0.6186587, -0.7856503, 1, 0.9176471, 0, 1,
-1.071569, 0.8611856, -0.1414447, 1, 0.9254902, 0, 1,
-1.067937, -0.06026836, -3.049962, 1, 0.9294118, 0, 1,
-1.061769, -1.01138, -3.42763, 1, 0.9372549, 0, 1,
-1.051718, 1.145259, -0.7554046, 1, 0.9411765, 0, 1,
-1.048593, -0.8199982, -3.414538, 1, 0.9490196, 0, 1,
-1.027429, 0.06708796, -0.06175578, 1, 0.9529412, 0, 1,
-1.022912, 1.553754, -1.107734, 1, 0.9607843, 0, 1,
-1.020394, 1.240018, 1.042827, 1, 0.9647059, 0, 1,
-1.020168, -0.9881886, -2.725934, 1, 0.972549, 0, 1,
-1.018647, 0.7047809, -1.994973, 1, 0.9764706, 0, 1,
-1.014112, 2.049032, 0.01171502, 1, 0.9843137, 0, 1,
-1.004, 0.1438653, -1.644289, 1, 0.9882353, 0, 1,
-0.9989567, -0.6296604, -1.883427, 1, 0.9960784, 0, 1,
-0.9923262, 0.5472509, -1.21717, 0.9960784, 1, 0, 1,
-0.9874976, -0.2069338, -2.631953, 0.9921569, 1, 0, 1,
-0.9862649, -0.6244319, -2.674487, 0.9843137, 1, 0, 1,
-0.9754468, 0.6478025, -1.447769, 0.9803922, 1, 0, 1,
-0.9727688, 0.121889, -1.503909, 0.972549, 1, 0, 1,
-0.9646233, -1.066959, -2.28596, 0.9686275, 1, 0, 1,
-0.9588735, 0.3130113, -1.336717, 0.9607843, 1, 0, 1,
-0.9546229, 0.5634688, -1.361117, 0.9568627, 1, 0, 1,
-0.9518588, -2.461333, -2.212177, 0.9490196, 1, 0, 1,
-0.950029, 0.4639455, -0.2992118, 0.945098, 1, 0, 1,
-0.9465425, -0.2078189, -3.10509, 0.9372549, 1, 0, 1,
-0.9454727, -1.492693, -1.45366, 0.9333333, 1, 0, 1,
-0.9404643, -0.6623239, -1.53425, 0.9254902, 1, 0, 1,
-0.9381507, 0.3472978, 0.787613, 0.9215686, 1, 0, 1,
-0.9354386, 0.2892154, -1.367352, 0.9137255, 1, 0, 1,
-0.9340606, -0.7245657, -3.463591, 0.9098039, 1, 0, 1,
-0.9339846, -1.348972, -2.333084, 0.9019608, 1, 0, 1,
-0.9222773, -0.5688296, -3.174682, 0.8941177, 1, 0, 1,
-0.9219227, -1.047382, -2.438852, 0.8901961, 1, 0, 1,
-0.9213021, 0.4423843, -2.052045, 0.8823529, 1, 0, 1,
-0.9202202, 1.309707, -1.285726, 0.8784314, 1, 0, 1,
-0.9171059, 0.08353292, -2.422745, 0.8705882, 1, 0, 1,
-0.9077139, -1.767005, -2.682578, 0.8666667, 1, 0, 1,
-0.9060352, -0.6607223, -3.673775, 0.8588235, 1, 0, 1,
-0.9008912, -0.9982621, -2.452886, 0.854902, 1, 0, 1,
-0.8955076, 0.2169406, -2.219403, 0.8470588, 1, 0, 1,
-0.8894203, -1.00231, -2.14077, 0.8431373, 1, 0, 1,
-0.888256, 0.7361628, -1.944159, 0.8352941, 1, 0, 1,
-0.8862119, -0.6872821, -2.507342, 0.8313726, 1, 0, 1,
-0.8859186, 0.4297726, -1.114121, 0.8235294, 1, 0, 1,
-0.883023, -1.183695, -1.123528, 0.8196079, 1, 0, 1,
-0.8739405, 1.171568, 0.3664046, 0.8117647, 1, 0, 1,
-0.8686701, 0.739407, -1.980897, 0.8078431, 1, 0, 1,
-0.8682379, 0.09074629, -0.2779407, 0.8, 1, 0, 1,
-0.8675256, 0.3781712, -0.6044958, 0.7921569, 1, 0, 1,
-0.8625686, -0.4958428, -1.555088, 0.7882353, 1, 0, 1,
-0.856806, 2.060965, -0.7796181, 0.7803922, 1, 0, 1,
-0.8539426, 0.1045802, -0.4420449, 0.7764706, 1, 0, 1,
-0.8507832, 1.168648, 0.05232299, 0.7686275, 1, 0, 1,
-0.8505512, 0.05791872, -1.419459, 0.7647059, 1, 0, 1,
-0.8483762, 1.249522, 0.9890918, 0.7568628, 1, 0, 1,
-0.8469228, 1.303332, -0.8069847, 0.7529412, 1, 0, 1,
-0.8416958, -0.076189, -0.6210082, 0.7450981, 1, 0, 1,
-0.8400375, 0.3763747, -1.79315, 0.7411765, 1, 0, 1,
-0.8382487, -1.019233, -2.782349, 0.7333333, 1, 0, 1,
-0.8360261, -0.2680616, -2.058509, 0.7294118, 1, 0, 1,
-0.8316449, -0.2037848, -0.4638292, 0.7215686, 1, 0, 1,
-0.8276964, 0.599361, -0.06405459, 0.7176471, 1, 0, 1,
-0.8268734, -1.145938, -1.722947, 0.7098039, 1, 0, 1,
-0.8236175, 0.6382602, -1.028184, 0.7058824, 1, 0, 1,
-0.8208647, -0.5298848, -3.06444, 0.6980392, 1, 0, 1,
-0.8195063, 0.125845, -1.907244, 0.6901961, 1, 0, 1,
-0.8171757, 0.04428932, -1.613898, 0.6862745, 1, 0, 1,
-0.8146026, -1.332103, -0.9335343, 0.6784314, 1, 0, 1,
-0.8140425, 1.190664, 0.2715852, 0.6745098, 1, 0, 1,
-0.8137475, 0.2100525, -1.488277, 0.6666667, 1, 0, 1,
-0.8097603, -1.087345, -2.012851, 0.6627451, 1, 0, 1,
-0.8032879, 0.9554052, -0.4486075, 0.654902, 1, 0, 1,
-0.7959927, -2.321168, -2.675318, 0.6509804, 1, 0, 1,
-0.7921789, -0.5555655, -1.491166, 0.6431373, 1, 0, 1,
-0.7918926, -0.06621199, -2.470039, 0.6392157, 1, 0, 1,
-0.7880687, -2.420496, -2.860932, 0.6313726, 1, 0, 1,
-0.7873635, -0.1326105, -1.64756, 0.627451, 1, 0, 1,
-0.7829301, -0.08627015, -1.707313, 0.6196079, 1, 0, 1,
-0.7828036, 0.9764608, 0.4124805, 0.6156863, 1, 0, 1,
-0.7781094, 1.983395, -0.2595645, 0.6078432, 1, 0, 1,
-0.7769579, -1.44752, -2.825799, 0.6039216, 1, 0, 1,
-0.7723855, -0.8789734, -3.247585, 0.5960785, 1, 0, 1,
-0.7680565, -1.170268, -4.242815, 0.5882353, 1, 0, 1,
-0.7674648, -0.5451258, -1.681915, 0.5843138, 1, 0, 1,
-0.7642617, -0.8190486, -2.588872, 0.5764706, 1, 0, 1,
-0.7575186, 0.1742893, -2.763779, 0.572549, 1, 0, 1,
-0.7544079, -1.371605, -3.595475, 0.5647059, 1, 0, 1,
-0.7480866, -0.2119243, -2.345583, 0.5607843, 1, 0, 1,
-0.7433584, 0.9602839, 0.1594184, 0.5529412, 1, 0, 1,
-0.7421808, 2.152045, 0.3250805, 0.5490196, 1, 0, 1,
-0.7391263, -0.05554104, -2.815076, 0.5411765, 1, 0, 1,
-0.7372386, 1.166913, 0.6741378, 0.5372549, 1, 0, 1,
-0.736357, 1.894366, -1.097015, 0.5294118, 1, 0, 1,
-0.7312084, -1.73494, -1.256376, 0.5254902, 1, 0, 1,
-0.7301543, 0.6356577, -1.617282, 0.5176471, 1, 0, 1,
-0.7250174, 0.8352681, -2.275224, 0.5137255, 1, 0, 1,
-0.7243706, -1.18773, -2.194053, 0.5058824, 1, 0, 1,
-0.7205949, 0.4240339, -0.1524834, 0.5019608, 1, 0, 1,
-0.7200598, 1.178874, -1.01072, 0.4941176, 1, 0, 1,
-0.7174768, 0.8599883, -1.081969, 0.4862745, 1, 0, 1,
-0.7142068, -0.3013597, -1.758355, 0.4823529, 1, 0, 1,
-0.7138903, 1.728266, -0.7081091, 0.4745098, 1, 0, 1,
-0.7134719, -0.7899821, -3.337682, 0.4705882, 1, 0, 1,
-0.7109249, -0.483779, -0.4180407, 0.4627451, 1, 0, 1,
-0.7102085, 1.811223, 0.2222777, 0.4588235, 1, 0, 1,
-0.7019507, -0.260757, -2.430564, 0.4509804, 1, 0, 1,
-0.7013478, 0.2100473, -0.7498125, 0.4470588, 1, 0, 1,
-0.6986214, 0.01235595, -0.6240932, 0.4392157, 1, 0, 1,
-0.6915628, -1.431758, -3.621025, 0.4352941, 1, 0, 1,
-0.6894524, 0.2684462, -0.4790845, 0.427451, 1, 0, 1,
-0.6885728, -0.005916348, -1.629725, 0.4235294, 1, 0, 1,
-0.6759763, -0.314834, -0.6095157, 0.4156863, 1, 0, 1,
-0.6704674, -0.6549333, -3.665636, 0.4117647, 1, 0, 1,
-0.6685446, -0.2258842, 0.1763673, 0.4039216, 1, 0, 1,
-0.665831, 0.4469747, 0.6980913, 0.3960784, 1, 0, 1,
-0.6583187, -2.190236, -3.066932, 0.3921569, 1, 0, 1,
-0.6580471, 0.2762229, -3.300791, 0.3843137, 1, 0, 1,
-0.6572463, -0.3124516, -0.4761567, 0.3803922, 1, 0, 1,
-0.6563666, 0.1726863, -0.8574618, 0.372549, 1, 0, 1,
-0.65438, 2.282847, -1.301442, 0.3686275, 1, 0, 1,
-0.6508828, 2.211438, 0.2616116, 0.3607843, 1, 0, 1,
-0.6475635, -0.5432029, -0.9240874, 0.3568628, 1, 0, 1,
-0.647496, 1.120085, 1.467833, 0.3490196, 1, 0, 1,
-0.6404729, 0.1713595, -0.9668254, 0.345098, 1, 0, 1,
-0.6376066, -0.863455, -2.101141, 0.3372549, 1, 0, 1,
-0.6368636, 0.9768103, -1.929984, 0.3333333, 1, 0, 1,
-0.6363711, -1.165925, -4.03285, 0.3254902, 1, 0, 1,
-0.6338242, -0.2635906, -1.134757, 0.3215686, 1, 0, 1,
-0.6288051, -2.470905, -3.747702, 0.3137255, 1, 0, 1,
-0.6254162, -0.4426909, -0.8682069, 0.3098039, 1, 0, 1,
-0.6200711, -1.464668, -2.587819, 0.3019608, 1, 0, 1,
-0.6167248, 0.375273, -1.402315, 0.2941177, 1, 0, 1,
-0.6130413, 1.434123, -0.7204092, 0.2901961, 1, 0, 1,
-0.6129509, -0.02255908, -1.870868, 0.282353, 1, 0, 1,
-0.6121116, 0.7169062, -1.168602, 0.2784314, 1, 0, 1,
-0.6081505, -1.461921, -4.530334, 0.2705882, 1, 0, 1,
-0.6074901, -0.1794672, -1.677813, 0.2666667, 1, 0, 1,
-0.6073499, 1.247732, 0.7237602, 0.2588235, 1, 0, 1,
-0.6068364, -0.4275399, -1.551387, 0.254902, 1, 0, 1,
-0.6064879, -0.1280766, -2.636273, 0.2470588, 1, 0, 1,
-0.6049122, -0.9323243, -3.625093, 0.2431373, 1, 0, 1,
-0.5979692, -0.8581522, -2.522748, 0.2352941, 1, 0, 1,
-0.5926458, -1.666928, -2.12926, 0.2313726, 1, 0, 1,
-0.590488, -0.8216338, -1.621117, 0.2235294, 1, 0, 1,
-0.5877593, 1.474527, -0.0909118, 0.2196078, 1, 0, 1,
-0.5872114, 0.07761735, -1.07151, 0.2117647, 1, 0, 1,
-0.5819739, -0.06237381, 1.173427, 0.2078431, 1, 0, 1,
-0.5808606, -1.70235, -4.43434, 0.2, 1, 0, 1,
-0.5673699, 1.455066, 1.05167, 0.1921569, 1, 0, 1,
-0.5659314, 0.6082239, -0.8890278, 0.1882353, 1, 0, 1,
-0.5508097, 0.2717792, -0.8017921, 0.1803922, 1, 0, 1,
-0.5464737, 0.212254, 0.1219537, 0.1764706, 1, 0, 1,
-0.546365, 0.8488969, 0.06878188, 0.1686275, 1, 0, 1,
-0.5441737, -0.8169606, -3.922487, 0.1647059, 1, 0, 1,
-0.5427942, 0.1417504, -1.731651, 0.1568628, 1, 0, 1,
-0.5412448, -0.7893145, -2.656143, 0.1529412, 1, 0, 1,
-0.536746, 1.067589, -1.574599, 0.145098, 1, 0, 1,
-0.5319614, 0.5500276, -1.910558, 0.1411765, 1, 0, 1,
-0.5319235, -0.0234075, -1.753458, 0.1333333, 1, 0, 1,
-0.530406, -1.166269, -4.268331, 0.1294118, 1, 0, 1,
-0.5178151, 0.6082433, -1.005405, 0.1215686, 1, 0, 1,
-0.5111484, -0.1232165, -1.421597, 0.1176471, 1, 0, 1,
-0.5103038, 0.857083, 0.1442326, 0.1098039, 1, 0, 1,
-0.5093679, -0.08128789, -1.962537, 0.1058824, 1, 0, 1,
-0.5036592, 1.517329, -1.401728, 0.09803922, 1, 0, 1,
-0.5001051, 1.15575, -0.7074679, 0.09019608, 1, 0, 1,
-0.4931099, -0.5872518, -1.022516, 0.08627451, 1, 0, 1,
-0.488131, 0.0107914, -0.1243737, 0.07843138, 1, 0, 1,
-0.4844877, 0.5038722, -1.256775, 0.07450981, 1, 0, 1,
-0.4843483, 0.4146738, -0.7881555, 0.06666667, 1, 0, 1,
-0.4774023, 0.5788481, -2.776227, 0.0627451, 1, 0, 1,
-0.4729486, -0.6398163, -1.559273, 0.05490196, 1, 0, 1,
-0.4726868, -0.337364, -1.105072, 0.05098039, 1, 0, 1,
-0.4683266, 2.324401, -0.1483465, 0.04313726, 1, 0, 1,
-0.4671375, 0.1712901, -2.127424, 0.03921569, 1, 0, 1,
-0.4661172, 1.092888, 0.1768783, 0.03137255, 1, 0, 1,
-0.4646099, -2.136234, -3.443398, 0.02745098, 1, 0, 1,
-0.463807, -0.6386284, -2.844465, 0.01960784, 1, 0, 1,
-0.4596348, -0.2560841, -3.598181, 0.01568628, 1, 0, 1,
-0.4594417, 1.135781, -0.02557785, 0.007843138, 1, 0, 1,
-0.4553611, 2.622237, -0.07718109, 0.003921569, 1, 0, 1,
-0.451101, -0.6737647, -4.42113, 0, 1, 0.003921569, 1,
-0.449319, -1.710654, -2.686983, 0, 1, 0.01176471, 1,
-0.4490979, 0.1898084, -0.9406673, 0, 1, 0.01568628, 1,
-0.4480105, -1.019083, -2.944133, 0, 1, 0.02352941, 1,
-0.4410742, -0.6571177, -3.27049, 0, 1, 0.02745098, 1,
-0.4345529, -0.04786983, -1.833661, 0, 1, 0.03529412, 1,
-0.4311821, 0.2833431, 0.7499936, 0, 1, 0.03921569, 1,
-0.4292919, -1.680954, -1.69921, 0, 1, 0.04705882, 1,
-0.4184144, 0.6177315, -0.7042692, 0, 1, 0.05098039, 1,
-0.4044759, 0.4102163, 0.2954769, 0, 1, 0.05882353, 1,
-0.4018199, -0.8333701, -3.929595, 0, 1, 0.0627451, 1,
-0.3986878, -0.1662151, -2.405805, 0, 1, 0.07058824, 1,
-0.3984001, -0.5500646, -3.055665, 0, 1, 0.07450981, 1,
-0.3979257, -0.1106883, -1.238304, 0, 1, 0.08235294, 1,
-0.3924501, -0.02432156, -2.041296, 0, 1, 0.08627451, 1,
-0.3907782, -0.5061413, -2.193734, 0, 1, 0.09411765, 1,
-0.3898838, -0.2435206, -1.848247, 0, 1, 0.1019608, 1,
-0.3890781, -0.9148209, -3.028737, 0, 1, 0.1058824, 1,
-0.38768, 0.5576348, -2.401462, 0, 1, 0.1137255, 1,
-0.3843414, -1.067979, -2.938175, 0, 1, 0.1176471, 1,
-0.3802553, 0.3733485, -0.557716, 0, 1, 0.1254902, 1,
-0.3719091, 0.4275447, 1.30266, 0, 1, 0.1294118, 1,
-0.3623842, 0.5613667, -1.115067, 0, 1, 0.1372549, 1,
-0.3614608, -0.2234063, -1.270157, 0, 1, 0.1411765, 1,
-0.3589683, -0.466396, -1.394047, 0, 1, 0.1490196, 1,
-0.3575941, 0.005802721, -0.5895995, 0, 1, 0.1529412, 1,
-0.3571346, -0.09662358, -1.819898, 0, 1, 0.1607843, 1,
-0.355848, 0.5614085, -0.4064264, 0, 1, 0.1647059, 1,
-0.3554489, 0.1767506, -0.9954153, 0, 1, 0.172549, 1,
-0.3547753, -1.489798, -2.738578, 0, 1, 0.1764706, 1,
-0.350623, -0.5799915, -0.9948712, 0, 1, 0.1843137, 1,
-0.3455289, -0.7207808, -3.313775, 0, 1, 0.1882353, 1,
-0.3438028, -0.6134142, -3.595364, 0, 1, 0.1960784, 1,
-0.3409751, -1.263796, -3.445679, 0, 1, 0.2039216, 1,
-0.3376517, 0.3020574, -1.240277, 0, 1, 0.2078431, 1,
-0.3339714, -1.295194, -1.94831, 0, 1, 0.2156863, 1,
-0.3339142, -1.783462, -3.970077, 0, 1, 0.2196078, 1,
-0.3313715, -0.7517335, -4.298229, 0, 1, 0.227451, 1,
-0.3254628, -0.4351137, -2.070045, 0, 1, 0.2313726, 1,
-0.3217381, -1.271584, -1.545468, 0, 1, 0.2392157, 1,
-0.3206946, -0.4217003, -2.551722, 0, 1, 0.2431373, 1,
-0.316788, -0.07204457, -1.332867, 0, 1, 0.2509804, 1,
-0.3096308, -0.6748496, -3.647652, 0, 1, 0.254902, 1,
-0.3074586, -0.06133436, -2.134527, 0, 1, 0.2627451, 1,
-0.304534, -0.5827666, -3.658915, 0, 1, 0.2666667, 1,
-0.3038182, 0.1483775, -1.181349, 0, 1, 0.2745098, 1,
-0.3019614, 1.176101, -0.8466244, 0, 1, 0.2784314, 1,
-0.2987603, -0.4642263, -1.528638, 0, 1, 0.2862745, 1,
-0.2986971, -0.1792926, -3.538949, 0, 1, 0.2901961, 1,
-0.2952716, 0.6647416, -0.04028024, 0, 1, 0.2980392, 1,
-0.2919347, -1.256437, -3.656632, 0, 1, 0.3058824, 1,
-0.2865459, -0.3837806, -3.536876, 0, 1, 0.3098039, 1,
-0.2857412, 1.416155, 0.2210718, 0, 1, 0.3176471, 1,
-0.2844998, 0.5336109, 1.286807, 0, 1, 0.3215686, 1,
-0.2835523, -1.676932, -2.374786, 0, 1, 0.3294118, 1,
-0.2805775, 0.02972623, -1.767189, 0, 1, 0.3333333, 1,
-0.2804667, 1.740211, -0.309679, 0, 1, 0.3411765, 1,
-0.2743197, 0.3487633, 1.461416, 0, 1, 0.345098, 1,
-0.2695733, -0.4260684, -2.457642, 0, 1, 0.3529412, 1,
-0.2659235, 2.059719, -0.2321839, 0, 1, 0.3568628, 1,
-0.2650163, 1.149158, -0.6436576, 0, 1, 0.3647059, 1,
-0.2643729, 0.4580384, -0.7384024, 0, 1, 0.3686275, 1,
-0.2638033, 0.528627, -1.155803, 0, 1, 0.3764706, 1,
-0.262778, -0.3962987, -4.064155, 0, 1, 0.3803922, 1,
-0.2550729, -1.43924, -3.42853, 0, 1, 0.3882353, 1,
-0.2510244, -0.4575223, -1.592037, 0, 1, 0.3921569, 1,
-0.2485751, 1.196061, -0.3576404, 0, 1, 0.4, 1,
-0.2477554, 1.235445, 0.3527827, 0, 1, 0.4078431, 1,
-0.2457561, 1.408497, -0.6517027, 0, 1, 0.4117647, 1,
-0.2418038, 0.1465389, -0.4161184, 0, 1, 0.4196078, 1,
-0.240234, -0.08063907, -0.4688013, 0, 1, 0.4235294, 1,
-0.238123, -0.7538734, -2.873111, 0, 1, 0.4313726, 1,
-0.2358546, 0.495822, 1.081878, 0, 1, 0.4352941, 1,
-0.2343216, 0.4635431, 0.6139489, 0, 1, 0.4431373, 1,
-0.2312444, 0.9718629, 0.9290293, 0, 1, 0.4470588, 1,
-0.2311322, 0.06838359, -2.866356, 0, 1, 0.454902, 1,
-0.2287496, 0.1595818, 0.1505472, 0, 1, 0.4588235, 1,
-0.2280295, 2.313958, 0.7700555, 0, 1, 0.4666667, 1,
-0.2250502, 0.7887165, 0.1962818, 0, 1, 0.4705882, 1,
-0.224288, 0.9427629, 0.4155501, 0, 1, 0.4784314, 1,
-0.2238101, 1.604288, 1.473242, 0, 1, 0.4823529, 1,
-0.2212289, -0.3789917, -3.67227, 0, 1, 0.4901961, 1,
-0.2198114, -0.1405383, -2.558893, 0, 1, 0.4941176, 1,
-0.216212, 0.4627583, 0.05452859, 0, 1, 0.5019608, 1,
-0.2160437, 0.8618044, -0.4501006, 0, 1, 0.509804, 1,
-0.2138672, -0.3887868, -3.157241, 0, 1, 0.5137255, 1,
-0.2039572, 0.4172101, -2.176887, 0, 1, 0.5215687, 1,
-0.2033882, 0.05083423, -0.006016579, 0, 1, 0.5254902, 1,
-0.2027362, 0.7413259, 1.003547, 0, 1, 0.5333334, 1,
-0.1985073, 1.619274, 1.171294, 0, 1, 0.5372549, 1,
-0.1942393, 0.7765952, 0.8597275, 0, 1, 0.5450981, 1,
-0.1926354, 0.2737821, 0.788838, 0, 1, 0.5490196, 1,
-0.1925808, 0.01048373, -2.374396, 0, 1, 0.5568628, 1,
-0.1896724, -2.21158, -3.057105, 0, 1, 0.5607843, 1,
-0.1852892, 0.4015501, -0.06333272, 0, 1, 0.5686275, 1,
-0.1839366, -0.1316251, -2.448954, 0, 1, 0.572549, 1,
-0.1805659, 0.1093169, -0.9165159, 0, 1, 0.5803922, 1,
-0.1804084, -0.1245187, -2.971087, 0, 1, 0.5843138, 1,
-0.1684618, 1.351895, -1.75641, 0, 1, 0.5921569, 1,
-0.1633712, 1.120648, 1.360398, 0, 1, 0.5960785, 1,
-0.1623519, 1.295138, 0.3603598, 0, 1, 0.6039216, 1,
-0.1603706, -1.651917, -1.973462, 0, 1, 0.6117647, 1,
-0.1540038, -0.9554574, -3.784702, 0, 1, 0.6156863, 1,
-0.1468061, -0.55224, -3.925731, 0, 1, 0.6235294, 1,
-0.1458834, -0.3230747, -3.984612, 0, 1, 0.627451, 1,
-0.142713, 0.4268331, -0.7832443, 0, 1, 0.6352941, 1,
-0.1420005, 1.773712, -0.06248052, 0, 1, 0.6392157, 1,
-0.1415296, -0.4795566, -2.458405, 0, 1, 0.6470588, 1,
-0.1357039, -0.4560272, -2.467739, 0, 1, 0.6509804, 1,
-0.1338143, -1.525217, -3.125693, 0, 1, 0.6588235, 1,
-0.1328929, 0.4936956, -0.02081099, 0, 1, 0.6627451, 1,
-0.1320527, -0.9496693, -4.287131, 0, 1, 0.6705883, 1,
-0.1292018, 0.5618905, -0.9090081, 0, 1, 0.6745098, 1,
-0.1241025, 0.5434753, -2.296885, 0, 1, 0.682353, 1,
-0.1224582, -0.9547628, -1.297573, 0, 1, 0.6862745, 1,
-0.121656, 1.618499, -0.07128223, 0, 1, 0.6941177, 1,
-0.1183207, 0.8120052, 0.557065, 0, 1, 0.7019608, 1,
-0.1170079, -0.2744975, -0.7010313, 0, 1, 0.7058824, 1,
-0.116022, -0.1436082, -2.428272, 0, 1, 0.7137255, 1,
-0.103714, 0.5025105, -0.09349963, 0, 1, 0.7176471, 1,
-0.09935332, 1.224193, -0.4616286, 0, 1, 0.7254902, 1,
-0.09836436, -1.60278, -2.481903, 0, 1, 0.7294118, 1,
-0.09775981, -1.029842, -3.602088, 0, 1, 0.7372549, 1,
-0.09766188, 0.9098629, -0.6575402, 0, 1, 0.7411765, 1,
-0.09746671, -0.1537658, -3.971089, 0, 1, 0.7490196, 1,
-0.09238072, 2.264619, -1.450806, 0, 1, 0.7529412, 1,
-0.09174125, 0.05286604, -0.6782215, 0, 1, 0.7607843, 1,
-0.09018997, 0.2636766, -0.2062213, 0, 1, 0.7647059, 1,
-0.08767877, 0.588847, 1.177931, 0, 1, 0.772549, 1,
-0.08721589, -1.786918, -4.857649, 0, 1, 0.7764706, 1,
-0.08266588, -0.7276079, -3.595325, 0, 1, 0.7843137, 1,
-0.08056876, 2.750468, 1.026927, 0, 1, 0.7882353, 1,
-0.07534485, 1.811174, 2.089065, 0, 1, 0.7960784, 1,
-0.07425504, -0.9420804, -2.086239, 0, 1, 0.8039216, 1,
-0.07370292, 0.2207024, 1.283069, 0, 1, 0.8078431, 1,
-0.0727758, 0.7669688, -0.2782005, 0, 1, 0.8156863, 1,
-0.06754211, 1.411073, -0.2834024, 0, 1, 0.8196079, 1,
-0.06659336, -0.3624329, -4.814666, 0, 1, 0.827451, 1,
-0.06333299, -1.155677, -2.407523, 0, 1, 0.8313726, 1,
-0.05520026, -1.212246, -3.272034, 0, 1, 0.8392157, 1,
-0.05354111, -0.6624019, -3.602056, 0, 1, 0.8431373, 1,
-0.05235822, 0.7464354, 2.189383, 0, 1, 0.8509804, 1,
-0.04858593, -0.1434588, -3.28543, 0, 1, 0.854902, 1,
-0.04776055, -1.443563, -3.317125, 0, 1, 0.8627451, 1,
-0.04568566, -1.005739, -1.77577, 0, 1, 0.8666667, 1,
-0.03766248, -0.5099802, -3.135755, 0, 1, 0.8745098, 1,
-0.03717323, -0.1424007, -1.839993, 0, 1, 0.8784314, 1,
-0.03535786, -1.378543, -1.33118, 0, 1, 0.8862745, 1,
-0.03311721, 0.04069126, -0.5098301, 0, 1, 0.8901961, 1,
-0.0309033, 0.7715754, -1.906201, 0, 1, 0.8980392, 1,
-0.03062645, 0.8078606, 2.497444, 0, 1, 0.9058824, 1,
-0.02772704, -0.9484981, -3.734696, 0, 1, 0.9098039, 1,
-0.0246029, 1.064303, -0.6810008, 0, 1, 0.9176471, 1,
-0.02221062, 0.1792802, -0.7140353, 0, 1, 0.9215686, 1,
-0.02090553, -0.208481, -4.471917, 0, 1, 0.9294118, 1,
-0.01666295, 0.6422405, -0.02378378, 0, 1, 0.9333333, 1,
-0.01657827, -1.394698, -2.56, 0, 1, 0.9411765, 1,
-0.009220253, 0.389714, 0.789228, 0, 1, 0.945098, 1,
-0.007925564, -0.617037, -3.040162, 0, 1, 0.9529412, 1,
-0.006144063, -0.327633, -4.253521, 0, 1, 0.9568627, 1,
-0.005812102, -1.954169, -1.835945, 0, 1, 0.9647059, 1,
-0.005054289, -0.6798176, -4.453734, 0, 1, 0.9686275, 1,
-0.004470738, -0.227941, -5.242192, 0, 1, 0.9764706, 1,
0.001037853, 0.5130382, 1.537515, 0, 1, 0.9803922, 1,
0.002722132, -1.687236, 2.959631, 0, 1, 0.9882353, 1,
0.008294974, -0.5994977, 2.919928, 0, 1, 0.9921569, 1,
0.01201643, 1.825943, -0.3018559, 0, 1, 1, 1,
0.01286133, -0.6491912, 2.98878, 0, 0.9921569, 1, 1,
0.01461659, 0.02794541, 1.588162, 0, 0.9882353, 1, 1,
0.01930955, 0.7691358, 0.9312537, 0, 0.9803922, 1, 1,
0.02591449, -1.131612, 5.586918, 0, 0.9764706, 1, 1,
0.02656429, 0.7361253, 1.062618, 0, 0.9686275, 1, 1,
0.02863553, -0.6642478, 2.709783, 0, 0.9647059, 1, 1,
0.02874518, -0.4344567, 3.819314, 0, 0.9568627, 1, 1,
0.02936147, 0.7848466, -0.634908, 0, 0.9529412, 1, 1,
0.03017373, 1.041682, -0.3303799, 0, 0.945098, 1, 1,
0.03087195, 0.2480807, 0.8434299, 0, 0.9411765, 1, 1,
0.03186552, 0.7134318, -0.02386235, 0, 0.9333333, 1, 1,
0.03406451, -0.9064422, 2.769707, 0, 0.9294118, 1, 1,
0.03442496, -0.2566276, 2.055455, 0, 0.9215686, 1, 1,
0.03462303, 0.4766877, 0.1563231, 0, 0.9176471, 1, 1,
0.03650752, -0.3224339, 2.968493, 0, 0.9098039, 1, 1,
0.03719963, -1.900709, 4.6015, 0, 0.9058824, 1, 1,
0.0375274, 1.153659, 0.2693301, 0, 0.8980392, 1, 1,
0.04340534, 0.5868884, 0.1448473, 0, 0.8901961, 1, 1,
0.04558625, 0.1844531, 0.4996582, 0, 0.8862745, 1, 1,
0.04615569, -0.1035666, 0.892908, 0, 0.8784314, 1, 1,
0.0526987, -0.1046894, 1.674554, 0, 0.8745098, 1, 1,
0.05438616, 0.437146, 2.590937, 0, 0.8666667, 1, 1,
0.05714689, 0.2273093, 0.4175074, 0, 0.8627451, 1, 1,
0.0572981, -0.7150684, 2.75855, 0, 0.854902, 1, 1,
0.06296891, 1.205227, 0.5249673, 0, 0.8509804, 1, 1,
0.06340947, -0.6621178, 1.548685, 0, 0.8431373, 1, 1,
0.0675813, -0.5492378, 1.395028, 0, 0.8392157, 1, 1,
0.07510602, -1.373746, 3.250547, 0, 0.8313726, 1, 1,
0.07705624, -0.2473705, 0.5251994, 0, 0.827451, 1, 1,
0.07910614, 0.07082061, -0.04992862, 0, 0.8196079, 1, 1,
0.08038603, -0.3987855, 2.005279, 0, 0.8156863, 1, 1,
0.09099825, 0.9173284, 0.5265194, 0, 0.8078431, 1, 1,
0.0915093, -0.8019639, 3.072139, 0, 0.8039216, 1, 1,
0.09383307, 2.646993, 0.3136798, 0, 0.7960784, 1, 1,
0.09487779, 2.233046, -1.931075, 0, 0.7882353, 1, 1,
0.09660853, 1.010431, 1.417247, 0, 0.7843137, 1, 1,
0.09748083, -0.3469162, 0.2292452, 0, 0.7764706, 1, 1,
0.09987058, -0.05401871, 3.177355, 0, 0.772549, 1, 1,
0.1006903, -0.09587234, 2.582027, 0, 0.7647059, 1, 1,
0.1007727, -0.3062994, 1.986059, 0, 0.7607843, 1, 1,
0.1017091, 0.04844148, 0.1298781, 0, 0.7529412, 1, 1,
0.1050696, -0.1732409, 2.242471, 0, 0.7490196, 1, 1,
0.1169967, 0.3940224, -0.4437566, 0, 0.7411765, 1, 1,
0.1180656, 1.775496, 1.006567, 0, 0.7372549, 1, 1,
0.1191856, 0.04491248, 2.374581, 0, 0.7294118, 1, 1,
0.1193451, 1.210498, 1.32121, 0, 0.7254902, 1, 1,
0.1217428, 1.870677, 1.101734, 0, 0.7176471, 1, 1,
0.1233264, 0.0401119, 1.227018, 0, 0.7137255, 1, 1,
0.1244484, -0.6955314, 1.879845, 0, 0.7058824, 1, 1,
0.1255894, 1.228568, 0.5769806, 0, 0.6980392, 1, 1,
0.1256582, -1.342852, 2.707049, 0, 0.6941177, 1, 1,
0.1325776, -0.4212375, 1.953178, 0, 0.6862745, 1, 1,
0.1361619, -1.365176, 4.467446, 0, 0.682353, 1, 1,
0.1391449, -1.649841, 3.2603, 0, 0.6745098, 1, 1,
0.1392587, 0.1237697, -0.7025818, 0, 0.6705883, 1, 1,
0.1409858, 1.288093, -0.8603336, 0, 0.6627451, 1, 1,
0.1430163, -0.03473702, 3.133467, 0, 0.6588235, 1, 1,
0.1436563, -1.483983, 2.645012, 0, 0.6509804, 1, 1,
0.1450623, -2.150823, 2.767403, 0, 0.6470588, 1, 1,
0.1506696, 1.073118, -1.221066, 0, 0.6392157, 1, 1,
0.1535215, -1.658412, 2.276381, 0, 0.6352941, 1, 1,
0.1559471, 0.3007336, -0.4475603, 0, 0.627451, 1, 1,
0.1561253, 1.133934, 1.007372, 0, 0.6235294, 1, 1,
0.1581515, -0.1839936, 3.21289, 0, 0.6156863, 1, 1,
0.1585876, 0.7419556, -0.01241611, 0, 0.6117647, 1, 1,
0.1631254, -0.8665928, 1.883552, 0, 0.6039216, 1, 1,
0.1633194, 1.20865, -0.5074341, 0, 0.5960785, 1, 1,
0.1677524, 1.173738, 1.930312, 0, 0.5921569, 1, 1,
0.1695251, 1.023588, 0.42724, 0, 0.5843138, 1, 1,
0.1767197, -0.08574325, 3.990478, 0, 0.5803922, 1, 1,
0.1793314, 2.130448, 1.352668, 0, 0.572549, 1, 1,
0.1807109, 0.1120667, 1.486167, 0, 0.5686275, 1, 1,
0.1820133, -2.092168, 1.535909, 0, 0.5607843, 1, 1,
0.1836627, -0.7223793, 1.460307, 0, 0.5568628, 1, 1,
0.1843747, 0.08173203, 2.060692, 0, 0.5490196, 1, 1,
0.1853103, -2.140036, 2.464554, 0, 0.5450981, 1, 1,
0.1863349, -0.07899996, 2.067549, 0, 0.5372549, 1, 1,
0.1869864, -0.5247647, 3.421626, 0, 0.5333334, 1, 1,
0.1896485, -3.014875, 2.831186, 0, 0.5254902, 1, 1,
0.1970854, 1.953671, -0.2691495, 0, 0.5215687, 1, 1,
0.1978097, 0.4700871, -1.182075, 0, 0.5137255, 1, 1,
0.2001772, 0.3669682, 2.340624, 0, 0.509804, 1, 1,
0.2003391, -0.306025, 2.252259, 0, 0.5019608, 1, 1,
0.2026052, 0.3444373, -0.5408591, 0, 0.4941176, 1, 1,
0.2034518, 0.4664288, -0.7154521, 0, 0.4901961, 1, 1,
0.2048097, -0.86807, 1.652541, 0, 0.4823529, 1, 1,
0.2052798, 1.155665, 0.7471687, 0, 0.4784314, 1, 1,
0.2095861, -0.585631, 1.908622, 0, 0.4705882, 1, 1,
0.2110477, -1.165499, 2.605978, 0, 0.4666667, 1, 1,
0.2111465, -1.477505, 2.713911, 0, 0.4588235, 1, 1,
0.2115171, -0.3101451, 1.519965, 0, 0.454902, 1, 1,
0.2120424, -1.177452, 2.933697, 0, 0.4470588, 1, 1,
0.2129005, 0.6308354, 0.4308652, 0, 0.4431373, 1, 1,
0.2130474, -0.4677973, 2.404624, 0, 0.4352941, 1, 1,
0.2132759, -1.064536, 2.28517, 0, 0.4313726, 1, 1,
0.2141327, 1.23203, 0.4520253, 0, 0.4235294, 1, 1,
0.2204996, -0.3745076, 1.907359, 0, 0.4196078, 1, 1,
0.2207363, -0.7835602, 2.825457, 0, 0.4117647, 1, 1,
0.2246511, -0.5973717, 2.244982, 0, 0.4078431, 1, 1,
0.2273916, -0.2772231, 3.262819, 0, 0.4, 1, 1,
0.2294704, 0.4688065, -0.2213783, 0, 0.3921569, 1, 1,
0.2339799, -0.2671737, 2.313654, 0, 0.3882353, 1, 1,
0.2352746, 0.4316852, 1.724234, 0, 0.3803922, 1, 1,
0.2355232, 0.3364017, 1.001594, 0, 0.3764706, 1, 1,
0.2366486, 0.8340021, -0.9389819, 0, 0.3686275, 1, 1,
0.2373105, 0.9467224, -0.208032, 0, 0.3647059, 1, 1,
0.244741, 1.798642, 0.999193, 0, 0.3568628, 1, 1,
0.2448432, 0.4067668, 0.8112567, 0, 0.3529412, 1, 1,
0.2463263, 0.2752665, 1.357437, 0, 0.345098, 1, 1,
0.2478182, -0.4024784, 3.476676, 0, 0.3411765, 1, 1,
0.2508997, 0.2957238, -2.599717, 0, 0.3333333, 1, 1,
0.2531009, 0.7961879, -0.1714779, 0, 0.3294118, 1, 1,
0.2532652, 0.2325733, 0.3393932, 0, 0.3215686, 1, 1,
0.2639408, 0.2267429, 1.253681, 0, 0.3176471, 1, 1,
0.269952, 0.09110974, 3.093357, 0, 0.3098039, 1, 1,
0.2712031, -0.004250925, 1.251766, 0, 0.3058824, 1, 1,
0.2718101, 2.365842, -0.4358996, 0, 0.2980392, 1, 1,
0.2759954, 1.078278, -0.5044989, 0, 0.2901961, 1, 1,
0.2765995, 0.312608, 1.575913, 0, 0.2862745, 1, 1,
0.2795879, 2.062093, -2.224392, 0, 0.2784314, 1, 1,
0.2853514, -0.7952467, 3.637117, 0, 0.2745098, 1, 1,
0.2927298, 1.043582, -0.4295936, 0, 0.2666667, 1, 1,
0.2939798, 0.04029145, 2.165452, 0, 0.2627451, 1, 1,
0.3026345, -0.6022498, 3.672025, 0, 0.254902, 1, 1,
0.304074, -0.8520123, 3.563043, 0, 0.2509804, 1, 1,
0.3063235, -0.6004986, 3.438115, 0, 0.2431373, 1, 1,
0.3133112, 1.693795, 1.435754, 0, 0.2392157, 1, 1,
0.3140943, -0.3973878, 3.54947, 0, 0.2313726, 1, 1,
0.3214464, -0.5012117, 3.897142, 0, 0.227451, 1, 1,
0.32178, 0.4091662, 3.108215, 0, 0.2196078, 1, 1,
0.3243409, -0.8010378, 2.149952, 0, 0.2156863, 1, 1,
0.3255654, -1.104874, 2.61266, 0, 0.2078431, 1, 1,
0.3284202, 1.297019, 1.788859, 0, 0.2039216, 1, 1,
0.3295673, 0.1862418, 0.4138457, 0, 0.1960784, 1, 1,
0.3299281, 0.5106179, 0.0762112, 0, 0.1882353, 1, 1,
0.3321014, 1.29178, 0.1117162, 0, 0.1843137, 1, 1,
0.3354553, -1.417607, 4.671331, 0, 0.1764706, 1, 1,
0.3370435, 1.264719, 0.5742943, 0, 0.172549, 1, 1,
0.3387398, 0.9399413, 0.05719974, 0, 0.1647059, 1, 1,
0.3459377, 0.653237, 0.4839008, 0, 0.1607843, 1, 1,
0.3473867, -1.082029, 3.697534, 0, 0.1529412, 1, 1,
0.3474206, 0.7414378, 0.4642152, 0, 0.1490196, 1, 1,
0.350653, 0.5776891, -1.851737, 0, 0.1411765, 1, 1,
0.3550709, 0.1771992, -0.2647711, 0, 0.1372549, 1, 1,
0.3577532, 1.170441, -2.570855, 0, 0.1294118, 1, 1,
0.3578811, 0.5825561, 2.134995, 0, 0.1254902, 1, 1,
0.3620898, -0.6358367, 4.192013, 0, 0.1176471, 1, 1,
0.3646003, -2.186652, 3.570124, 0, 0.1137255, 1, 1,
0.3675613, 0.1429584, 2.257187, 0, 0.1058824, 1, 1,
0.3702655, 0.01667029, 1.573207, 0, 0.09803922, 1, 1,
0.3705391, 0.4669298, -0.1692666, 0, 0.09411765, 1, 1,
0.3710997, 0.54414, 1.558807, 0, 0.08627451, 1, 1,
0.3725615, 0.4516587, 0.8378214, 0, 0.08235294, 1, 1,
0.3775711, -0.3006991, 2.137545, 0, 0.07450981, 1, 1,
0.3804624, -0.485454, 2.770231, 0, 0.07058824, 1, 1,
0.3858607, 0.6866208, 1.497336, 0, 0.0627451, 1, 1,
0.3859558, 1.154411, 0.8622172, 0, 0.05882353, 1, 1,
0.3864836, -0.6278896, 2.608583, 0, 0.05098039, 1, 1,
0.3866523, 0.2271158, 0.1527477, 0, 0.04705882, 1, 1,
0.3885579, 0.7935057, -0.8488855, 0, 0.03921569, 1, 1,
0.3931353, -1.165927, 3.196369, 0, 0.03529412, 1, 1,
0.3946334, -0.1495424, 2.428589, 0, 0.02745098, 1, 1,
0.3953961, 0.4671844, 1.709428, 0, 0.02352941, 1, 1,
0.3966504, -0.8547276, 4.251356, 0, 0.01568628, 1, 1,
0.3967377, 0.163987, 1.557546, 0, 0.01176471, 1, 1,
0.3982511, 0.6578192, 0.830488, 0, 0.003921569, 1, 1,
0.4025567, -0.5776766, 2.320588, 0.003921569, 0, 1, 1,
0.4042022, -1.874066, 2.814289, 0.007843138, 0, 1, 1,
0.4051847, 1.289883, -1.295213, 0.01568628, 0, 1, 1,
0.4057365, 0.05629874, 0.5114945, 0.01960784, 0, 1, 1,
0.4057769, -0.8925638, 2.32971, 0.02745098, 0, 1, 1,
0.4132086, -0.5048976, 1.111436, 0.03137255, 0, 1, 1,
0.4218282, 0.5452162, 0.9025179, 0.03921569, 0, 1, 1,
0.4250087, -0.5324578, 2.871172, 0.04313726, 0, 1, 1,
0.4281524, -0.0388625, 3.594918, 0.05098039, 0, 1, 1,
0.4348603, 0.2863592, 0.6708437, 0.05490196, 0, 1, 1,
0.439357, 2.080433, -0.3040048, 0.0627451, 0, 1, 1,
0.4451193, 1.254995, 0.6743579, 0.06666667, 0, 1, 1,
0.4502878, -1.494025, 3.078332, 0.07450981, 0, 1, 1,
0.4506752, -0.6277033, 2.540921, 0.07843138, 0, 1, 1,
0.4520993, 0.2457087, 2.309992, 0.08627451, 0, 1, 1,
0.4559003, 0.9799763, 0.4471682, 0.09019608, 0, 1, 1,
0.4562738, 0.3891509, 2.477492, 0.09803922, 0, 1, 1,
0.4585306, 0.5261697, 0.8933216, 0.1058824, 0, 1, 1,
0.4620308, 1.969548, 0.04203437, 0.1098039, 0, 1, 1,
0.4629973, 0.4412966, 0.5323769, 0.1176471, 0, 1, 1,
0.4671316, 0.8748549, -1.250712, 0.1215686, 0, 1, 1,
0.4676383, 0.9969674, 1.220526, 0.1294118, 0, 1, 1,
0.4698427, -3.227426, 2.902203, 0.1333333, 0, 1, 1,
0.4742966, 0.575403, 0.2853983, 0.1411765, 0, 1, 1,
0.4775038, 0.2847107, 1.349079, 0.145098, 0, 1, 1,
0.4785281, -0.1297341, 2.711796, 0.1529412, 0, 1, 1,
0.4877655, -0.5569171, 1.925507, 0.1568628, 0, 1, 1,
0.4946306, -0.09212156, 3.31046, 0.1647059, 0, 1, 1,
0.4979191, -0.4058448, 3.755086, 0.1686275, 0, 1, 1,
0.4980091, -0.199236, 1.129163, 0.1764706, 0, 1, 1,
0.4982102, -1.740742, 3.319802, 0.1803922, 0, 1, 1,
0.4998139, 1.196736, -0.4051185, 0.1882353, 0, 1, 1,
0.5002767, 1.178338, 0.1492052, 0.1921569, 0, 1, 1,
0.5004612, -3.291438, 2.157103, 0.2, 0, 1, 1,
0.5145977, 0.6427239, 1.576818, 0.2078431, 0, 1, 1,
0.5188721, -0.3491676, 1.949448, 0.2117647, 0, 1, 1,
0.5197749, -0.7532378, 3.278174, 0.2196078, 0, 1, 1,
0.5252874, -1.62391, 3.920746, 0.2235294, 0, 1, 1,
0.5294303, -1.876362, 1.358808, 0.2313726, 0, 1, 1,
0.5362348, 1.435622, -0.1265167, 0.2352941, 0, 1, 1,
0.5365016, 0.8746888, -0.5068671, 0.2431373, 0, 1, 1,
0.5376072, -1.099834, 1.5713, 0.2470588, 0, 1, 1,
0.54191, 0.3222425, 1.2367, 0.254902, 0, 1, 1,
0.5442778, -0.4061669, 2.047455, 0.2588235, 0, 1, 1,
0.5457769, -0.1570847, 1.337738, 0.2666667, 0, 1, 1,
0.550221, 0.7105648, 1.216355, 0.2705882, 0, 1, 1,
0.5530394, -0.4357981, 2.517158, 0.2784314, 0, 1, 1,
0.5577852, 0.8290229, 0.6796386, 0.282353, 0, 1, 1,
0.567621, -0.4424789, -0.02079119, 0.2901961, 0, 1, 1,
0.5758067, -0.4692035, 3.328749, 0.2941177, 0, 1, 1,
0.5778419, -0.6610708, 3.517576, 0.3019608, 0, 1, 1,
0.5780496, -0.9401282, 2.333901, 0.3098039, 0, 1, 1,
0.5816621, 0.6338434, 0.7972944, 0.3137255, 0, 1, 1,
0.5839413, -0.4603412, 0.7378126, 0.3215686, 0, 1, 1,
0.5857589, -0.7866067, 3.673365, 0.3254902, 0, 1, 1,
0.5909078, 0.1685852, 0.3866872, 0.3333333, 0, 1, 1,
0.5912546, -1.118077, 1.022227, 0.3372549, 0, 1, 1,
0.5935591, 2.097973, -1.503928, 0.345098, 0, 1, 1,
0.5984458, 0.5951054, 1.070122, 0.3490196, 0, 1, 1,
0.6031363, 0.342674, 1.461032, 0.3568628, 0, 1, 1,
0.6035078, -0.8330413, 2.391568, 0.3607843, 0, 1, 1,
0.6035403, -0.4930784, 2.280531, 0.3686275, 0, 1, 1,
0.6041292, -0.1024775, 1.65422, 0.372549, 0, 1, 1,
0.6041834, -0.9110959, 3.435265, 0.3803922, 0, 1, 1,
0.6052269, -1.014804, 1.739766, 0.3843137, 0, 1, 1,
0.6053417, -0.8003508, 2.616612, 0.3921569, 0, 1, 1,
0.6077357, 1.052089, 0.3883323, 0.3960784, 0, 1, 1,
0.612035, 1.654187, -0.01890054, 0.4039216, 0, 1, 1,
0.614244, -1.012317, 1.899476, 0.4117647, 0, 1, 1,
0.6257898, -1.877654, 1.721677, 0.4156863, 0, 1, 1,
0.6383683, 0.13068, 1.947249, 0.4235294, 0, 1, 1,
0.6403816, -0.1958349, 0.559725, 0.427451, 0, 1, 1,
0.6435862, 1.108611, -1.069653, 0.4352941, 0, 1, 1,
0.6471806, -0.2370501, 2.394266, 0.4392157, 0, 1, 1,
0.6497846, -1.013115, 2.534381, 0.4470588, 0, 1, 1,
0.652943, 1.149847, -0.002426944, 0.4509804, 0, 1, 1,
0.6562406, -0.9597865, 1.528227, 0.4588235, 0, 1, 1,
0.6609644, -0.2364647, 1.896977, 0.4627451, 0, 1, 1,
0.6618741, -0.2002114, 3.073019, 0.4705882, 0, 1, 1,
0.6683953, 1.37402, 1.471569, 0.4745098, 0, 1, 1,
0.6711478, 0.9162762, 1.332077, 0.4823529, 0, 1, 1,
0.6716859, -0.5975977, 4.715744, 0.4862745, 0, 1, 1,
0.6754573, -0.4907816, 1.166175, 0.4941176, 0, 1, 1,
0.6756361, 0.2409247, 0.5697423, 0.5019608, 0, 1, 1,
0.6759109, 1.809074, 0.6282969, 0.5058824, 0, 1, 1,
0.6775338, 2.155173, -0.06247947, 0.5137255, 0, 1, 1,
0.6777565, -0.8280676, 1.027802, 0.5176471, 0, 1, 1,
0.6784217, 0.5676467, -0.318308, 0.5254902, 0, 1, 1,
0.683739, 0.2114826, 0.8770823, 0.5294118, 0, 1, 1,
0.68435, 0.3602741, 1.253328, 0.5372549, 0, 1, 1,
0.6870213, -0.4413633, 1.444943, 0.5411765, 0, 1, 1,
0.688305, 0.3250906, -0.4339002, 0.5490196, 0, 1, 1,
0.6897821, -0.1862379, 1.013155, 0.5529412, 0, 1, 1,
0.6942055, -1.079059, 3.996152, 0.5607843, 0, 1, 1,
0.6981084, -0.9209366, 3.23948, 0.5647059, 0, 1, 1,
0.7055415, 0.070159, 0.9634386, 0.572549, 0, 1, 1,
0.7059817, 0.5224745, 0.3800496, 0.5764706, 0, 1, 1,
0.7071381, 1.795038, 2.197553, 0.5843138, 0, 1, 1,
0.7227179, 1.615988, 0.9272118, 0.5882353, 0, 1, 1,
0.72568, 1.988765, 0.3836336, 0.5960785, 0, 1, 1,
0.7329552, -0.5870973, 3.310966, 0.6039216, 0, 1, 1,
0.7408817, 1.498719, 0.8839225, 0.6078432, 0, 1, 1,
0.7426218, 1.389149, 1.440736, 0.6156863, 0, 1, 1,
0.7479467, -1.303398, 2.391779, 0.6196079, 0, 1, 1,
0.7518293, 0.1651336, 0.2232267, 0.627451, 0, 1, 1,
0.755443, -0.594363, 2.933549, 0.6313726, 0, 1, 1,
0.7559664, -1.041997, 3.30078, 0.6392157, 0, 1, 1,
0.7593784, -2.271892, 3.71819, 0.6431373, 0, 1, 1,
0.7616255, -1.585241, 3.088739, 0.6509804, 0, 1, 1,
0.7691948, 0.07307247, 1.75844, 0.654902, 0, 1, 1,
0.7758129, 1.021136, 0.6367273, 0.6627451, 0, 1, 1,
0.7768887, -0.02475264, 1.948906, 0.6666667, 0, 1, 1,
0.7823957, 0.6617169, 0.7483796, 0.6745098, 0, 1, 1,
0.7833308, 0.1546081, 0.8685995, 0.6784314, 0, 1, 1,
0.7852929, -1.260346, 2.260976, 0.6862745, 0, 1, 1,
0.7861916, 0.1285333, -0.07574936, 0.6901961, 0, 1, 1,
0.7873245, 0.5168984, -0.3588632, 0.6980392, 0, 1, 1,
0.7877905, 0.3611067, 0.300134, 0.7058824, 0, 1, 1,
0.7900597, 0.2045724, 0.8119863, 0.7098039, 0, 1, 1,
0.7917479, -0.9680834, 2.03639, 0.7176471, 0, 1, 1,
0.7932665, -0.1474537, 2.529833, 0.7215686, 0, 1, 1,
0.7939635, -1.319619, 4.091754, 0.7294118, 0, 1, 1,
0.7949525, 0.07072006, 1.050476, 0.7333333, 0, 1, 1,
0.7986974, -0.4340189, -0.2916268, 0.7411765, 0, 1, 1,
0.7989079, -1.060557, 1.875711, 0.7450981, 0, 1, 1,
0.799091, -1.266956, 2.315132, 0.7529412, 0, 1, 1,
0.799168, -0.1179219, 3.751054, 0.7568628, 0, 1, 1,
0.8011692, 1.050103, 2.540562, 0.7647059, 0, 1, 1,
0.8139527, -0.2442608, 2.177343, 0.7686275, 0, 1, 1,
0.8166391, 0.2757963, 0.872345, 0.7764706, 0, 1, 1,
0.8202395, -0.3140776, 2.017271, 0.7803922, 0, 1, 1,
0.8233075, 1.173854, 2.143832, 0.7882353, 0, 1, 1,
0.8258433, 1.377506, -1.869349, 0.7921569, 0, 1, 1,
0.8261806, 1.080132, -0.1292602, 0.8, 0, 1, 1,
0.8289122, -1.429245, 2.409329, 0.8078431, 0, 1, 1,
0.8394942, 0.01977638, 0.36733, 0.8117647, 0, 1, 1,
0.8448547, 0.8139575, -0.3628077, 0.8196079, 0, 1, 1,
0.847653, 0.6833799, 1.747078, 0.8235294, 0, 1, 1,
0.8489054, -0.7137585, 1.151992, 0.8313726, 0, 1, 1,
0.8546826, 1.364126, -1.144848, 0.8352941, 0, 1, 1,
0.8579541, 0.8680385, 0.5385348, 0.8431373, 0, 1, 1,
0.8622614, -1.83648, 0.9912012, 0.8470588, 0, 1, 1,
0.862443, 1.005111, 1.141456, 0.854902, 0, 1, 1,
0.8692846, -0.2573139, 1.371174, 0.8588235, 0, 1, 1,
0.8692967, 0.5513515, 2.76582, 0.8666667, 0, 1, 1,
0.8695586, -0.3996226, 3.290788, 0.8705882, 0, 1, 1,
0.8707875, 0.1515103, 2.621287, 0.8784314, 0, 1, 1,
0.8750643, 1.54094, 0.8546181, 0.8823529, 0, 1, 1,
0.879379, 0.491053, -0.7348396, 0.8901961, 0, 1, 1,
0.8818427, 0.6320894, -1.911695, 0.8941177, 0, 1, 1,
0.8847553, -0.5879545, 2.095881, 0.9019608, 0, 1, 1,
0.8867932, 2.228736, 1.245517, 0.9098039, 0, 1, 1,
0.9010605, -1.680674, 2.639592, 0.9137255, 0, 1, 1,
0.905502, 0.3245041, 1.849959, 0.9215686, 0, 1, 1,
0.9076546, -0.4050595, 1.767905, 0.9254902, 0, 1, 1,
0.9193997, 1.269819, 0.4199495, 0.9333333, 0, 1, 1,
0.9316403, -1.184157, 4.389653, 0.9372549, 0, 1, 1,
0.9357763, -0.006446344, 1.658444, 0.945098, 0, 1, 1,
0.9360844, 0.02444013, -0.1795048, 0.9490196, 0, 1, 1,
0.9401575, 0.1375944, 1.427078, 0.9568627, 0, 1, 1,
0.9401754, -0.302662, 1.846537, 0.9607843, 0, 1, 1,
0.9414172, 1.652777, 1.077161, 0.9686275, 0, 1, 1,
0.9444736, -0.7520567, 0.6057264, 0.972549, 0, 1, 1,
0.9495578, 1.93439, 0.07846887, 0.9803922, 0, 1, 1,
0.9585311, 0.8647729, -0.01470429, 0.9843137, 0, 1, 1,
0.9618762, -0.4256452, 0.4925811, 0.9921569, 0, 1, 1,
0.9637521, -0.5198839, 3.078454, 0.9960784, 0, 1, 1,
0.9660286, -0.7085871, 1.474761, 1, 0, 0.9960784, 1,
0.9667168, 0.314667, 1.766178, 1, 0, 0.9882353, 1,
0.9690083, 1.371911, 0.7868124, 1, 0, 0.9843137, 1,
0.9730202, 1.479324, 0.9250605, 1, 0, 0.9764706, 1,
0.9776644, 0.06007896, 2.837667, 1, 0, 0.972549, 1,
0.977951, 0.02304819, 1.853682, 1, 0, 0.9647059, 1,
0.9833404, 0.7622713, 0.2700614, 1, 0, 0.9607843, 1,
0.9834425, -0.7644169, 2.245636, 1, 0, 0.9529412, 1,
0.9959553, -1.174069, 1.750482, 1, 0, 0.9490196, 1,
0.9981423, -0.8042706, 3.512658, 1, 0, 0.9411765, 1,
1.006472, 0.3089894, 1.635325, 1, 0, 0.9372549, 1,
1.006642, -0.03792462, 0.3239447, 1, 0, 0.9294118, 1,
1.021664, -1.89769, 2.539128, 1, 0, 0.9254902, 1,
1.022359, 0.1483349, 0.1077472, 1, 0, 0.9176471, 1,
1.024241, 0.9869124, 0.05392921, 1, 0, 0.9137255, 1,
1.029644, 0.2094868, 0.9345699, 1, 0, 0.9058824, 1,
1.031331, 0.1320009, 1.405186, 1, 0, 0.9019608, 1,
1.031758, 0.5593783, 2.59385, 1, 0, 0.8941177, 1,
1.032169, -0.5407902, 0.1291475, 1, 0, 0.8862745, 1,
1.036651, 0.2068547, 1.467345, 1, 0, 0.8823529, 1,
1.038078, -0.3899781, 1.503414, 1, 0, 0.8745098, 1,
1.039572, -0.4659801, 4.005257, 1, 0, 0.8705882, 1,
1.041559, 0.001846002, 2.015985, 1, 0, 0.8627451, 1,
1.043819, 1.057443, 0.7175876, 1, 0, 0.8588235, 1,
1.051782, 0.8211439, -0.6779568, 1, 0, 0.8509804, 1,
1.056418, 0.07219417, -1.015718, 1, 0, 0.8470588, 1,
1.060352, -0.8384901, 3.305999, 1, 0, 0.8392157, 1,
1.064212, 0.4204044, 1.616057, 1, 0, 0.8352941, 1,
1.067529, -0.2230395, 1.535609, 1, 0, 0.827451, 1,
1.070802, 0.1520776, 1.795558, 1, 0, 0.8235294, 1,
1.073148, 0.09636126, 0.4067467, 1, 0, 0.8156863, 1,
1.074252, -0.07207077, 3.058845, 1, 0, 0.8117647, 1,
1.078162, 1.49362, 1.653727, 1, 0, 0.8039216, 1,
1.0794, 0.07500401, 0.7857521, 1, 0, 0.7960784, 1,
1.083125, 0.1709921, 1.578857, 1, 0, 0.7921569, 1,
1.087248, 0.8977754, 1.774709, 1, 0, 0.7843137, 1,
1.099429, 0.302332, 1.788124, 1, 0, 0.7803922, 1,
1.09971, 0.6374908, 1.034701, 1, 0, 0.772549, 1,
1.109835, 0.03585985, 3.305548, 1, 0, 0.7686275, 1,
1.112876, -1.143163, 3.728585, 1, 0, 0.7607843, 1,
1.115298, 0.68977, 4.242837, 1, 0, 0.7568628, 1,
1.117128, 0.1041017, 2.162991, 1, 0, 0.7490196, 1,
1.119782, 0.4943357, 2.668846, 1, 0, 0.7450981, 1,
1.121722, -0.1802306, 0.09710474, 1, 0, 0.7372549, 1,
1.123846, -0.01722875, 2.094205, 1, 0, 0.7333333, 1,
1.12853, 0.8244447, 0.9475916, 1, 0, 0.7254902, 1,
1.13873, -1.441666, 3.271472, 1, 0, 0.7215686, 1,
1.139803, 2.801895, 0.4652055, 1, 0, 0.7137255, 1,
1.143311, 0.1013553, 1.087944, 1, 0, 0.7098039, 1,
1.151922, -0.195242, 2.641824, 1, 0, 0.7019608, 1,
1.155522, 0.2578819, 1.984927, 1, 0, 0.6941177, 1,
1.156636, 0.6553189, 1.297545, 1, 0, 0.6901961, 1,
1.16319, 1.817376, 1.757641, 1, 0, 0.682353, 1,
1.164833, 0.512962, -0.3556024, 1, 0, 0.6784314, 1,
1.168763, 0.06965602, 1.620092, 1, 0, 0.6705883, 1,
1.170606, 1.306275, 3.766563, 1, 0, 0.6666667, 1,
1.17985, -1.703298, 2.518429, 1, 0, 0.6588235, 1,
1.181029, -2.883642, 2.826819, 1, 0, 0.654902, 1,
1.192197, 1.805496, -1.09765, 1, 0, 0.6470588, 1,
1.194921, 1.066225, 1.15616, 1, 0, 0.6431373, 1,
1.19625, 0.3122428, 3.303322, 1, 0, 0.6352941, 1,
1.202896, -0.9535311, 2.298466, 1, 0, 0.6313726, 1,
1.206303, 0.422686, 2.065413, 1, 0, 0.6235294, 1,
1.209705, 1.988799, -0.1515463, 1, 0, 0.6196079, 1,
1.217155, 0.7291035, 0.5790058, 1, 0, 0.6117647, 1,
1.220548, 0.518733, 2.034701, 1, 0, 0.6078432, 1,
1.229726, -0.7336273, 2.637026, 1, 0, 0.6, 1,
1.242186, -0.9080607, 0.2979686, 1, 0, 0.5921569, 1,
1.242313, -0.6428194, 1.224969, 1, 0, 0.5882353, 1,
1.244506, -0.008520357, 3.263109, 1, 0, 0.5803922, 1,
1.253341, 0.4949501, 2.284879, 1, 0, 0.5764706, 1,
1.25925, -0.456891, 1.48351, 1, 0, 0.5686275, 1,
1.265219, 0.265808, 1.066646, 1, 0, 0.5647059, 1,
1.267759, 2.161213, -0.3741475, 1, 0, 0.5568628, 1,
1.269032, -0.05849579, 2.750039, 1, 0, 0.5529412, 1,
1.277166, -0.7881943, 3.181517, 1, 0, 0.5450981, 1,
1.286716, -0.5194045, -0.06228097, 1, 0, 0.5411765, 1,
1.290707, 0.5233641, 2.820441, 1, 0, 0.5333334, 1,
1.293507, -1.198866, 1.20561, 1, 0, 0.5294118, 1,
1.30671, -0.3473489, 0.112953, 1, 0, 0.5215687, 1,
1.319232, -1.98789, 3.754423, 1, 0, 0.5176471, 1,
1.320501, 0.2560437, -0.2591465, 1, 0, 0.509804, 1,
1.33222, -0.3289513, 2.45358, 1, 0, 0.5058824, 1,
1.334617, -0.04972319, 3.563584, 1, 0, 0.4980392, 1,
1.348865, 1.538402, -0.24169, 1, 0, 0.4901961, 1,
1.354301, 0.1940608, 2.265538, 1, 0, 0.4862745, 1,
1.361508, -0.8927236, 3.114756, 1, 0, 0.4784314, 1,
1.368787, -0.2655205, 2.257586, 1, 0, 0.4745098, 1,
1.371293, 0.6207575, 3.216709, 1, 0, 0.4666667, 1,
1.381629, 0.7868617, 1.127568, 1, 0, 0.4627451, 1,
1.383663, 0.1107901, 1.030481, 1, 0, 0.454902, 1,
1.388597, 0.9421139, 2.03585, 1, 0, 0.4509804, 1,
1.389364, 0.2970065, 1.340151, 1, 0, 0.4431373, 1,
1.409668, -1.812875, 3.09945, 1, 0, 0.4392157, 1,
1.416103, -0.5062142, 1.552299, 1, 0, 0.4313726, 1,
1.416142, 0.04923902, 0.3803059, 1, 0, 0.427451, 1,
1.42344, -1.095316, 3.010751, 1, 0, 0.4196078, 1,
1.426586, 1.863993, 2.608696, 1, 0, 0.4156863, 1,
1.429445, -1.866468, 2.157644, 1, 0, 0.4078431, 1,
1.443095, 0.005411064, 2.577421, 1, 0, 0.4039216, 1,
1.443885, 0.6782286, 0.01142245, 1, 0, 0.3960784, 1,
1.451242, 0.5757084, 1.695511, 1, 0, 0.3882353, 1,
1.466557, 0.3605357, 2.157052, 1, 0, 0.3843137, 1,
1.490816, -0.5118564, 1.871772, 1, 0, 0.3764706, 1,
1.491844, -0.9393734, 2.852306, 1, 0, 0.372549, 1,
1.493249, -0.0411488, 2.413245, 1, 0, 0.3647059, 1,
1.493683, -1.469705, 3.242628, 1, 0, 0.3607843, 1,
1.505752, -0.674721, 0.685137, 1, 0, 0.3529412, 1,
1.544059, 0.4147069, 1.946107, 1, 0, 0.3490196, 1,
1.545771, -0.7248735, 1.961437, 1, 0, 0.3411765, 1,
1.545872, 1.256569, 1.25893, 1, 0, 0.3372549, 1,
1.549792, -0.9919041, 0.4292002, 1, 0, 0.3294118, 1,
1.559353, 0.01731496, 2.047507, 1, 0, 0.3254902, 1,
1.560002, -0.2778789, 2.616769, 1, 0, 0.3176471, 1,
1.56889, 0.6928858, 2.383559, 1, 0, 0.3137255, 1,
1.574227, 2.209498, 1.366757, 1, 0, 0.3058824, 1,
1.581135, -0.1142899, 1.795407, 1, 0, 0.2980392, 1,
1.586447, 1.459139, 1.054162, 1, 0, 0.2941177, 1,
1.602299, -0.6810115, 1.071644, 1, 0, 0.2862745, 1,
1.612862, -0.6429433, 1.104022, 1, 0, 0.282353, 1,
1.613617, -1.850675, 2.837937, 1, 0, 0.2745098, 1,
1.629436, -1.451032, 3.573714, 1, 0, 0.2705882, 1,
1.631124, 0.3403014, 0.7794974, 1, 0, 0.2627451, 1,
1.635774, 1.004889, 0.939212, 1, 0, 0.2588235, 1,
1.643808, -0.8052343, 2.512574, 1, 0, 0.2509804, 1,
1.658082, 0.8411365, 1.635175, 1, 0, 0.2470588, 1,
1.660703, -0.3746682, 1.007032, 1, 0, 0.2392157, 1,
1.682662, 0.2970228, 0.03160054, 1, 0, 0.2352941, 1,
1.689798, -0.9473123, 3.195163, 1, 0, 0.227451, 1,
1.714272, -0.5788562, 1.698969, 1, 0, 0.2235294, 1,
1.748366, 1.255232, -1.115408, 1, 0, 0.2156863, 1,
1.757851, 0.6167685, 1.635097, 1, 0, 0.2117647, 1,
1.779718, -1.414535, 3.196487, 1, 0, 0.2039216, 1,
1.787177, 0.07510096, 1.388661, 1, 0, 0.1960784, 1,
1.810833, -1.100067, 3.274799, 1, 0, 0.1921569, 1,
1.817242, -0.9669588, 2.934724, 1, 0, 0.1843137, 1,
1.826149, 1.025519, -0.2773264, 1, 0, 0.1803922, 1,
1.832486, 0.9798195, 0.1719519, 1, 0, 0.172549, 1,
1.834676, 2.112456, 1.265129, 1, 0, 0.1686275, 1,
1.84185, 0.4581749, 0.559605, 1, 0, 0.1607843, 1,
1.854341, 0.6047006, 1.963564, 1, 0, 0.1568628, 1,
1.873354, 1.282463, 0.06582277, 1, 0, 0.1490196, 1,
1.873985, 1.244684, 0.7199134, 1, 0, 0.145098, 1,
1.907521, 0.5360053, 1.452617, 1, 0, 0.1372549, 1,
1.91578, -0.617986, 2.943533, 1, 0, 0.1333333, 1,
1.956804, 0.4163612, 1.954787, 1, 0, 0.1254902, 1,
1.957489, 1.082184, 1.972105, 1, 0, 0.1215686, 1,
1.959445, -0.4069673, 4.084787, 1, 0, 0.1137255, 1,
2.011047, -0.7922174, 0.1382258, 1, 0, 0.1098039, 1,
2.016558, 0.09086615, 1.560854, 1, 0, 0.1019608, 1,
2.018831, -2.41705, 1.920431, 1, 0, 0.09411765, 1,
2.112463, 0.1037488, 1.029988, 1, 0, 0.09019608, 1,
2.139102, 1.077141, 0.6293569, 1, 0, 0.08235294, 1,
2.153992, 0.1135865, 2.479734, 1, 0, 0.07843138, 1,
2.155473, -0.3365013, 2.952619, 1, 0, 0.07058824, 1,
2.168971, -0.8409041, 0.2988732, 1, 0, 0.06666667, 1,
2.205587, -0.2568053, 0.8303087, 1, 0, 0.05882353, 1,
2.210905, -1.54171, 0.1995809, 1, 0, 0.05490196, 1,
2.321976, 0.6020234, 0.3240117, 1, 0, 0.04705882, 1,
2.366261, -0.08141346, 2.854264, 1, 0, 0.04313726, 1,
2.419383, 0.3158926, 2.207256, 1, 0, 0.03529412, 1,
2.425549, -0.2011551, 0.8414382, 1, 0, 0.03137255, 1,
2.441543, 0.4756985, -0.5652593, 1, 0, 0.02352941, 1,
2.773655, -0.01074975, -0.6800749, 1, 0, 0.01960784, 1,
2.868852, 1.143645, 2.379545, 1, 0, 0.01176471, 1,
2.902863, -1.551738, 1.737431, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.04761195, -4.324258, -7.582575, 0, -0.5, 0.5, 0.5,
0.04761195, -4.324258, -7.582575, 1, -0.5, 0.5, 0.5,
0.04761195, -4.324258, -7.582575, 1, 1.5, 0.5, 0.5,
0.04761195, -4.324258, -7.582575, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.775569, -0.2447714, -7.582575, 0, -0.5, 0.5, 0.5,
-3.775569, -0.2447714, -7.582575, 1, -0.5, 0.5, 0.5,
-3.775569, -0.2447714, -7.582575, 1, 1.5, 0.5, 0.5,
-3.775569, -0.2447714, -7.582575, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.775569, -4.324258, -0.04347658, 0, -0.5, 0.5, 0.5,
-3.775569, -4.324258, -0.04347658, 1, -0.5, 0.5, 0.5,
-3.775569, -4.324258, -0.04347658, 1, 1.5, 0.5, 0.5,
-3.775569, -4.324258, -0.04347658, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.382838, -5.842783,
2, -3.382838, -5.842783,
-2, -3.382838, -5.842783,
-2, -3.539741, -6.132748,
-1, -3.382838, -5.842783,
-1, -3.539741, -6.132748,
0, -3.382838, -5.842783,
0, -3.539741, -6.132748,
1, -3.382838, -5.842783,
1, -3.539741, -6.132748,
2, -3.382838, -5.842783,
2, -3.539741, -6.132748
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.853548, -6.712679, 0, -0.5, 0.5, 0.5,
-2, -3.853548, -6.712679, 1, -0.5, 0.5, 0.5,
-2, -3.853548, -6.712679, 1, 1.5, 0.5, 0.5,
-2, -3.853548, -6.712679, 0, 1.5, 0.5, 0.5,
-1, -3.853548, -6.712679, 0, -0.5, 0.5, 0.5,
-1, -3.853548, -6.712679, 1, -0.5, 0.5, 0.5,
-1, -3.853548, -6.712679, 1, 1.5, 0.5, 0.5,
-1, -3.853548, -6.712679, 0, 1.5, 0.5, 0.5,
0, -3.853548, -6.712679, 0, -0.5, 0.5, 0.5,
0, -3.853548, -6.712679, 1, -0.5, 0.5, 0.5,
0, -3.853548, -6.712679, 1, 1.5, 0.5, 0.5,
0, -3.853548, -6.712679, 0, 1.5, 0.5, 0.5,
1, -3.853548, -6.712679, 0, -0.5, 0.5, 0.5,
1, -3.853548, -6.712679, 1, -0.5, 0.5, 0.5,
1, -3.853548, -6.712679, 1, 1.5, 0.5, 0.5,
1, -3.853548, -6.712679, 0, 1.5, 0.5, 0.5,
2, -3.853548, -6.712679, 0, -0.5, 0.5, 0.5,
2, -3.853548, -6.712679, 1, -0.5, 0.5, 0.5,
2, -3.853548, -6.712679, 1, 1.5, 0.5, 0.5,
2, -3.853548, -6.712679, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.893297, -3, -5.842783,
-2.893297, 2, -5.842783,
-2.893297, -3, -5.842783,
-3.040342, -3, -6.132748,
-2.893297, -2, -5.842783,
-3.040342, -2, -6.132748,
-2.893297, -1, -5.842783,
-3.040342, -1, -6.132748,
-2.893297, 0, -5.842783,
-3.040342, 0, -6.132748,
-2.893297, 1, -5.842783,
-3.040342, 1, -6.132748,
-2.893297, 2, -5.842783,
-3.040342, 2, -6.132748
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.334433, -3, -6.712679, 0, -0.5, 0.5, 0.5,
-3.334433, -3, -6.712679, 1, -0.5, 0.5, 0.5,
-3.334433, -3, -6.712679, 1, 1.5, 0.5, 0.5,
-3.334433, -3, -6.712679, 0, 1.5, 0.5, 0.5,
-3.334433, -2, -6.712679, 0, -0.5, 0.5, 0.5,
-3.334433, -2, -6.712679, 1, -0.5, 0.5, 0.5,
-3.334433, -2, -6.712679, 1, 1.5, 0.5, 0.5,
-3.334433, -2, -6.712679, 0, 1.5, 0.5, 0.5,
-3.334433, -1, -6.712679, 0, -0.5, 0.5, 0.5,
-3.334433, -1, -6.712679, 1, -0.5, 0.5, 0.5,
-3.334433, -1, -6.712679, 1, 1.5, 0.5, 0.5,
-3.334433, -1, -6.712679, 0, 1.5, 0.5, 0.5,
-3.334433, 0, -6.712679, 0, -0.5, 0.5, 0.5,
-3.334433, 0, -6.712679, 1, -0.5, 0.5, 0.5,
-3.334433, 0, -6.712679, 1, 1.5, 0.5, 0.5,
-3.334433, 0, -6.712679, 0, 1.5, 0.5, 0.5,
-3.334433, 1, -6.712679, 0, -0.5, 0.5, 0.5,
-3.334433, 1, -6.712679, 1, -0.5, 0.5, 0.5,
-3.334433, 1, -6.712679, 1, 1.5, 0.5, 0.5,
-3.334433, 1, -6.712679, 0, 1.5, 0.5, 0.5,
-3.334433, 2, -6.712679, 0, -0.5, 0.5, 0.5,
-3.334433, 2, -6.712679, 1, -0.5, 0.5, 0.5,
-3.334433, 2, -6.712679, 1, 1.5, 0.5, 0.5,
-3.334433, 2, -6.712679, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.893297, -3.382838, -4,
-2.893297, -3.382838, 4,
-2.893297, -3.382838, -4,
-3.040342, -3.539741, -4,
-2.893297, -3.382838, -2,
-3.040342, -3.539741, -2,
-2.893297, -3.382838, 0,
-3.040342, -3.539741, 0,
-2.893297, -3.382838, 2,
-3.040342, -3.539741, 2,
-2.893297, -3.382838, 4,
-3.040342, -3.539741, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.334433, -3.853548, -4, 0, -0.5, 0.5, 0.5,
-3.334433, -3.853548, -4, 1, -0.5, 0.5, 0.5,
-3.334433, -3.853548, -4, 1, 1.5, 0.5, 0.5,
-3.334433, -3.853548, -4, 0, 1.5, 0.5, 0.5,
-3.334433, -3.853548, -2, 0, -0.5, 0.5, 0.5,
-3.334433, -3.853548, -2, 1, -0.5, 0.5, 0.5,
-3.334433, -3.853548, -2, 1, 1.5, 0.5, 0.5,
-3.334433, -3.853548, -2, 0, 1.5, 0.5, 0.5,
-3.334433, -3.853548, 0, 0, -0.5, 0.5, 0.5,
-3.334433, -3.853548, 0, 1, -0.5, 0.5, 0.5,
-3.334433, -3.853548, 0, 1, 1.5, 0.5, 0.5,
-3.334433, -3.853548, 0, 0, 1.5, 0.5, 0.5,
-3.334433, -3.853548, 2, 0, -0.5, 0.5, 0.5,
-3.334433, -3.853548, 2, 1, -0.5, 0.5, 0.5,
-3.334433, -3.853548, 2, 1, 1.5, 0.5, 0.5,
-3.334433, -3.853548, 2, 0, 1.5, 0.5, 0.5,
-3.334433, -3.853548, 4, 0, -0.5, 0.5, 0.5,
-3.334433, -3.853548, 4, 1, -0.5, 0.5, 0.5,
-3.334433, -3.853548, 4, 1, 1.5, 0.5, 0.5,
-3.334433, -3.853548, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.893297, -3.382838, -5.842783,
-2.893297, 2.893295, -5.842783,
-2.893297, -3.382838, 5.75583,
-2.893297, 2.893295, 5.75583,
-2.893297, -3.382838, -5.842783,
-2.893297, -3.382838, 5.75583,
-2.893297, 2.893295, -5.842783,
-2.893297, 2.893295, 5.75583,
-2.893297, -3.382838, -5.842783,
2.988521, -3.382838, -5.842783,
-2.893297, -3.382838, 5.75583,
2.988521, -3.382838, 5.75583,
-2.893297, 2.893295, -5.842783,
2.988521, 2.893295, -5.842783,
-2.893297, 2.893295, 5.75583,
2.988521, 2.893295, 5.75583,
2.988521, -3.382838, -5.842783,
2.988521, 2.893295, -5.842783,
2.988521, -3.382838, 5.75583,
2.988521, 2.893295, 5.75583,
2.988521, -3.382838, -5.842783,
2.988521, -3.382838, 5.75583,
2.988521, 2.893295, -5.842783,
2.988521, 2.893295, 5.75583
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.710677;
var distance = 34.30567;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.04761195, 0.2447714, 0.04347658 );
mvMatrix.scale( 1.417408, 1.328355, 0.7187873 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.30567);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Metalaxyl<-read.table("Metalaxyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Metalaxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
```

```r
y<-Metalaxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
```

```r
z<-Metalaxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Metalaxyl' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.807639, 0.9617041, -1.658632, 0, 0, 1, 1, 1,
-2.690832, 1.272851, 0.3413432, 1, 0, 0, 1, 1,
-2.468199, 0.9878936, -0.7102093, 1, 0, 0, 1, 1,
-2.430509, -0.01410899, -1.187523, 1, 0, 0, 1, 1,
-2.334491, -2.335876, -2.213631, 1, 0, 0, 1, 1,
-2.304263, 0.1210378, -1.375751, 1, 0, 0, 1, 1,
-2.21198, 0.1427048, -3.733405, 0, 0, 0, 1, 1,
-2.081491, 0.08057994, -1.214925, 0, 0, 0, 1, 1,
-2.071105, 0.02132023, -1.929821, 0, 0, 0, 1, 1,
-2.06753, 0.579933, -0.5893098, 0, 0, 0, 1, 1,
-2.00101, -0.9150109, -2.308122, 0, 0, 0, 1, 1,
-1.998366, -1.244265, -2.56378, 0, 0, 0, 1, 1,
-1.991251, 0.851862, -0.2147835, 0, 0, 0, 1, 1,
-1.974276, 0.03727146, -1.619136, 1, 1, 1, 1, 1,
-1.948405, 0.4440925, -1.06531, 1, 1, 1, 1, 1,
-1.932588, 0.04848124, -2.412403, 1, 1, 1, 1, 1,
-1.929036, 1.783837, 1.168832, 1, 1, 1, 1, 1,
-1.925132, -1.864947, -3.9253, 1, 1, 1, 1, 1,
-1.909579, 0.1913126, -1.797944, 1, 1, 1, 1, 1,
-1.906111, -0.1568084, -1.096142, 1, 1, 1, 1, 1,
-1.895536, -0.9734542, -2.799761, 1, 1, 1, 1, 1,
-1.858876, -1.026346, -1.4174, 1, 1, 1, 1, 1,
-1.827763, 0.9133178, 0.5398239, 1, 1, 1, 1, 1,
-1.822161, 0.883861, -1.529714, 1, 1, 1, 1, 1,
-1.82133, 1.98536, 0.6169546, 1, 1, 1, 1, 1,
-1.816049, 1.290685, -1.804159, 1, 1, 1, 1, 1,
-1.812076, -0.556183, -1.71554, 1, 1, 1, 1, 1,
-1.798926, 1.375853, 0.5254633, 1, 1, 1, 1, 1,
-1.766949, 0.7885221, 0.350667, 0, 0, 1, 1, 1,
-1.752988, -0.07628404, -0.749726, 1, 0, 0, 1, 1,
-1.74967, -0.9432702, -1.247291, 1, 0, 0, 1, 1,
-1.742436, 0.7019919, -3.413744, 1, 0, 0, 1, 1,
-1.73701, 1.125523, -0.2288341, 1, 0, 0, 1, 1,
-1.713698, -0.5671591, -2.878138, 1, 0, 0, 1, 1,
-1.707815, -2.101923, -1.576503, 0, 0, 0, 1, 1,
-1.697423, -0.6564293, -2.545112, 0, 0, 0, 1, 1,
-1.689024, -0.5966561, -0.6279094, 0, 0, 0, 1, 1,
-1.681509, -1.207321, -1.995304, 0, 0, 0, 1, 1,
-1.678971, 1.757555, -0.9882744, 0, 0, 0, 1, 1,
-1.669343, -0.6070179, -4.104466, 0, 0, 0, 1, 1,
-1.666072, -1.991395, -2.728561, 0, 0, 0, 1, 1,
-1.657512, -1.307261, -2.072687, 1, 1, 1, 1, 1,
-1.653024, -1.646926, -0.7930894, 1, 1, 1, 1, 1,
-1.639328, 0.1348717, -0.3036926, 1, 1, 1, 1, 1,
-1.638974, 1.512316, -1.375669, 1, 1, 1, 1, 1,
-1.635012, -0.8718574, -1.829436, 1, 1, 1, 1, 1,
-1.632339, -0.2481744, -3.619148, 1, 1, 1, 1, 1,
-1.631685, -0.8127493, -1.419605, 1, 1, 1, 1, 1,
-1.625012, -1.259828, -1.378409, 1, 1, 1, 1, 1,
-1.621373, 0.2656547, -0.7460888, 1, 1, 1, 1, 1,
-1.617763, -0.3979739, -1.536358, 1, 1, 1, 1, 1,
-1.608828, 0.8900049, -1.719251, 1, 1, 1, 1, 1,
-1.608636, -0.0253921, 0.175786, 1, 1, 1, 1, 1,
-1.606794, 0.5488953, -2.233196, 1, 1, 1, 1, 1,
-1.600011, 2.482126, 0.4731908, 1, 1, 1, 1, 1,
-1.588824, 0.4297079, -0.4941765, 1, 1, 1, 1, 1,
-1.578262, -1.898749, -1.368913, 0, 0, 1, 1, 1,
-1.574357, 0.2745011, -0.9307337, 1, 0, 0, 1, 1,
-1.569607, -0.1505517, -3.089558, 1, 0, 0, 1, 1,
-1.566653, -0.6700878, -1.04766, 1, 0, 0, 1, 1,
-1.565466, 0.2848651, -1.596746, 1, 0, 0, 1, 1,
-1.559818, 0.4537065, -1.685737, 1, 0, 0, 1, 1,
-1.548791, 0.3555304, -1.854333, 0, 0, 0, 1, 1,
-1.538082, 0.3743967, 0.2410552, 0, 0, 0, 1, 1,
-1.524616, 1.255169, -0.8706145, 0, 0, 0, 1, 1,
-1.524475, 0.362689, -1.391535, 0, 0, 0, 1, 1,
-1.518215, -0.3495399, -2.825871, 0, 0, 0, 1, 1,
-1.514006, 0.7954249, -2.466251, 0, 0, 0, 1, 1,
-1.504809, -1.119739, -3.512026, 0, 0, 0, 1, 1,
-1.502115, 0.1752438, -1.010104, 1, 1, 1, 1, 1,
-1.481853, -0.805837, -2.560373, 1, 1, 1, 1, 1,
-1.470794, 0.1610703, -1.407663, 1, 1, 1, 1, 1,
-1.467009, 0.6605375, -1.5671, 1, 1, 1, 1, 1,
-1.457901, 2.066922, -0.09010367, 1, 1, 1, 1, 1,
-1.457729, -1.329414, -3.266098, 1, 1, 1, 1, 1,
-1.448238, -0.08181744, -1.038119, 1, 1, 1, 1, 1,
-1.442779, 2.634282, 0.3068359, 1, 1, 1, 1, 1,
-1.431496, -1.774498, -2.259825, 1, 1, 1, 1, 1,
-1.431149, -0.4860878, -0.4473631, 1, 1, 1, 1, 1,
-1.42832, -1.837055, -2.170598, 1, 1, 1, 1, 1,
-1.414177, 1.153437, -0.642477, 1, 1, 1, 1, 1,
-1.402421, -0.5642727, -1.077263, 1, 1, 1, 1, 1,
-1.39634, 1.522132, -0.1593029, 1, 1, 1, 1, 1,
-1.393215, -0.2927377, -1.747355, 1, 1, 1, 1, 1,
-1.391716, 1.552938, -0.309872, 0, 0, 1, 1, 1,
-1.387805, -0.7845266, -1.391119, 1, 0, 0, 1, 1,
-1.382376, 1.216248, -0.3064175, 1, 0, 0, 1, 1,
-1.365508, 0.04852514, -0.761075, 1, 0, 0, 1, 1,
-1.350962, -2.942538, -2.631474, 1, 0, 0, 1, 1,
-1.33673, 1.750023, -1.288516, 1, 0, 0, 1, 1,
-1.335485, -0.2248874, -3.746639, 0, 0, 0, 1, 1,
-1.331634, -0.4589916, -3.157702, 0, 0, 0, 1, 1,
-1.329229, 0.4300592, -0.8082996, 0, 0, 0, 1, 1,
-1.318913, -0.5281219, -2.580401, 0, 0, 0, 1, 1,
-1.318557, -0.9654946, -1.22093, 0, 0, 0, 1, 1,
-1.318167, -1.716769, -3.537382, 0, 0, 0, 1, 1,
-1.299589, -0.113086, -3.693286, 0, 0, 0, 1, 1,
-1.293953, -0.5050309, -1.455124, 1, 1, 1, 1, 1,
-1.288884, -1.547456, -1.688674, 1, 1, 1, 1, 1,
-1.286359, -0.3613265, -1.132921, 1, 1, 1, 1, 1,
-1.284485, 0.1653462, -2.441419, 1, 1, 1, 1, 1,
-1.281024, -0.9943275, -2.652682, 1, 1, 1, 1, 1,
-1.27737, -0.3323872, -2.152283, 1, 1, 1, 1, 1,
-1.275551, -0.1588625, -1.888966, 1, 1, 1, 1, 1,
-1.259105, -0.4723828, -3.11653, 1, 1, 1, 1, 1,
-1.253014, -0.6874626, -1.533301, 1, 1, 1, 1, 1,
-1.252724, 1.711321, -1.748185, 1, 1, 1, 1, 1,
-1.251147, -0.8236589, -1.362548, 1, 1, 1, 1, 1,
-1.249996, 0.2115977, -2.596689, 1, 1, 1, 1, 1,
-1.240844, -0.03544502, -1.841474, 1, 1, 1, 1, 1,
-1.234406, -0.3717738, -1.721946, 1, 1, 1, 1, 1,
-1.230064, -0.347671, -3.280478, 1, 1, 1, 1, 1,
-1.229156, -2.336311, -2.589875, 0, 0, 1, 1, 1,
-1.223177, -0.4261412, -1.532543, 1, 0, 0, 1, 1,
-1.22271, -1.113189, -3.12684, 1, 0, 0, 1, 1,
-1.221247, -0.912375, -2.334379, 1, 0, 0, 1, 1,
-1.215659, 1.263211, -1.73183, 1, 0, 0, 1, 1,
-1.211463, 1.1442, -1.842259, 1, 0, 0, 1, 1,
-1.208633, 1.566741, 1.421711, 0, 0, 0, 1, 1,
-1.205241, 1.171527, -0.4030422, 0, 0, 0, 1, 1,
-1.201779, -2.148797, -4.554075, 0, 0, 0, 1, 1,
-1.201057, -1.976723, -1.399549, 0, 0, 0, 1, 1,
-1.194526, 1.318409, -1.379267, 0, 0, 0, 1, 1,
-1.192612, -0.4519149, -1.590891, 0, 0, 0, 1, 1,
-1.182675, 0.07807338, -1.305286, 0, 0, 0, 1, 1,
-1.179403, -0.8735946, -1.857625, 1, 1, 1, 1, 1,
-1.156636, 0.6050563, -0.8592984, 1, 1, 1, 1, 1,
-1.152293, 0.250747, -0.6218148, 1, 1, 1, 1, 1,
-1.151206, -0.9744631, -2.610375, 1, 1, 1, 1, 1,
-1.15082, 0.6429579, 0.5429437, 1, 1, 1, 1, 1,
-1.149516, -0.3394822, -0.4192693, 1, 1, 1, 1, 1,
-1.146192, 0.1910752, -1.898781, 1, 1, 1, 1, 1,
-1.143165, 0.2342868, -1.555869, 1, 1, 1, 1, 1,
-1.141248, 0.4643792, -0.6760482, 1, 1, 1, 1, 1,
-1.139982, 0.7989184, 0.5536281, 1, 1, 1, 1, 1,
-1.138588, -0.3539951, -1.136184, 1, 1, 1, 1, 1,
-1.136156, 0.8804572, -1.123966, 1, 1, 1, 1, 1,
-1.133984, -0.1069501, -0.7636072, 1, 1, 1, 1, 1,
-1.13178, -1.379987, -4.324568, 1, 1, 1, 1, 1,
-1.125506, 0.2495573, -1.387906, 1, 1, 1, 1, 1,
-1.123259, 1.650747, 0.8319253, 0, 0, 1, 1, 1,
-1.121034, -1.268753, -5.673871, 1, 0, 0, 1, 1,
-1.120234, -0.3329104, -2.646928, 1, 0, 0, 1, 1,
-1.118609, 0.2857457, -0.5245254, 1, 0, 0, 1, 1,
-1.11472, 0.02709863, -1.256582, 1, 0, 0, 1, 1,
-1.113801, -0.2350997, -1.700662, 1, 0, 0, 1, 1,
-1.089642, -0.6292843, -2.209886, 0, 0, 0, 1, 1,
-1.085416, 0.9783907, -0.8836814, 0, 0, 0, 1, 1,
-1.084368, -1.386812, -2.709363, 0, 0, 0, 1, 1,
-1.081051, 0.9337364, -2.781611, 0, 0, 0, 1, 1,
-1.078889, 0.5891275, -0.4096516, 0, 0, 0, 1, 1,
-1.078225, -1.27575, -2.539741, 0, 0, 0, 1, 1,
-1.072011, -1.05967, -4.32549, 0, 0, 0, 1, 1,
-1.071985, -0.6186587, -0.7856503, 1, 1, 1, 1, 1,
-1.071569, 0.8611856, -0.1414447, 1, 1, 1, 1, 1,
-1.067937, -0.06026836, -3.049962, 1, 1, 1, 1, 1,
-1.061769, -1.01138, -3.42763, 1, 1, 1, 1, 1,
-1.051718, 1.145259, -0.7554046, 1, 1, 1, 1, 1,
-1.048593, -0.8199982, -3.414538, 1, 1, 1, 1, 1,
-1.027429, 0.06708796, -0.06175578, 1, 1, 1, 1, 1,
-1.022912, 1.553754, -1.107734, 1, 1, 1, 1, 1,
-1.020394, 1.240018, 1.042827, 1, 1, 1, 1, 1,
-1.020168, -0.9881886, -2.725934, 1, 1, 1, 1, 1,
-1.018647, 0.7047809, -1.994973, 1, 1, 1, 1, 1,
-1.014112, 2.049032, 0.01171502, 1, 1, 1, 1, 1,
-1.004, 0.1438653, -1.644289, 1, 1, 1, 1, 1,
-0.9989567, -0.6296604, -1.883427, 1, 1, 1, 1, 1,
-0.9923262, 0.5472509, -1.21717, 1, 1, 1, 1, 1,
-0.9874976, -0.2069338, -2.631953, 0, 0, 1, 1, 1,
-0.9862649, -0.6244319, -2.674487, 1, 0, 0, 1, 1,
-0.9754468, 0.6478025, -1.447769, 1, 0, 0, 1, 1,
-0.9727688, 0.121889, -1.503909, 1, 0, 0, 1, 1,
-0.9646233, -1.066959, -2.28596, 1, 0, 0, 1, 1,
-0.9588735, 0.3130113, -1.336717, 1, 0, 0, 1, 1,
-0.9546229, 0.5634688, -1.361117, 0, 0, 0, 1, 1,
-0.9518588, -2.461333, -2.212177, 0, 0, 0, 1, 1,
-0.950029, 0.4639455, -0.2992118, 0, 0, 0, 1, 1,
-0.9465425, -0.2078189, -3.10509, 0, 0, 0, 1, 1,
-0.9454727, -1.492693, -1.45366, 0, 0, 0, 1, 1,
-0.9404643, -0.6623239, -1.53425, 0, 0, 0, 1, 1,
-0.9381507, 0.3472978, 0.787613, 0, 0, 0, 1, 1,
-0.9354386, 0.2892154, -1.367352, 1, 1, 1, 1, 1,
-0.9340606, -0.7245657, -3.463591, 1, 1, 1, 1, 1,
-0.9339846, -1.348972, -2.333084, 1, 1, 1, 1, 1,
-0.9222773, -0.5688296, -3.174682, 1, 1, 1, 1, 1,
-0.9219227, -1.047382, -2.438852, 1, 1, 1, 1, 1,
-0.9213021, 0.4423843, -2.052045, 1, 1, 1, 1, 1,
-0.9202202, 1.309707, -1.285726, 1, 1, 1, 1, 1,
-0.9171059, 0.08353292, -2.422745, 1, 1, 1, 1, 1,
-0.9077139, -1.767005, -2.682578, 1, 1, 1, 1, 1,
-0.9060352, -0.6607223, -3.673775, 1, 1, 1, 1, 1,
-0.9008912, -0.9982621, -2.452886, 1, 1, 1, 1, 1,
-0.8955076, 0.2169406, -2.219403, 1, 1, 1, 1, 1,
-0.8894203, -1.00231, -2.14077, 1, 1, 1, 1, 1,
-0.888256, 0.7361628, -1.944159, 1, 1, 1, 1, 1,
-0.8862119, -0.6872821, -2.507342, 1, 1, 1, 1, 1,
-0.8859186, 0.4297726, -1.114121, 0, 0, 1, 1, 1,
-0.883023, -1.183695, -1.123528, 1, 0, 0, 1, 1,
-0.8739405, 1.171568, 0.3664046, 1, 0, 0, 1, 1,
-0.8686701, 0.739407, -1.980897, 1, 0, 0, 1, 1,
-0.8682379, 0.09074629, -0.2779407, 1, 0, 0, 1, 1,
-0.8675256, 0.3781712, -0.6044958, 1, 0, 0, 1, 1,
-0.8625686, -0.4958428, -1.555088, 0, 0, 0, 1, 1,
-0.856806, 2.060965, -0.7796181, 0, 0, 0, 1, 1,
-0.8539426, 0.1045802, -0.4420449, 0, 0, 0, 1, 1,
-0.8507832, 1.168648, 0.05232299, 0, 0, 0, 1, 1,
-0.8505512, 0.05791872, -1.419459, 0, 0, 0, 1, 1,
-0.8483762, 1.249522, 0.9890918, 0, 0, 0, 1, 1,
-0.8469228, 1.303332, -0.8069847, 0, 0, 0, 1, 1,
-0.8416958, -0.076189, -0.6210082, 1, 1, 1, 1, 1,
-0.8400375, 0.3763747, -1.79315, 1, 1, 1, 1, 1,
-0.8382487, -1.019233, -2.782349, 1, 1, 1, 1, 1,
-0.8360261, -0.2680616, -2.058509, 1, 1, 1, 1, 1,
-0.8316449, -0.2037848, -0.4638292, 1, 1, 1, 1, 1,
-0.8276964, 0.599361, -0.06405459, 1, 1, 1, 1, 1,
-0.8268734, -1.145938, -1.722947, 1, 1, 1, 1, 1,
-0.8236175, 0.6382602, -1.028184, 1, 1, 1, 1, 1,
-0.8208647, -0.5298848, -3.06444, 1, 1, 1, 1, 1,
-0.8195063, 0.125845, -1.907244, 1, 1, 1, 1, 1,
-0.8171757, 0.04428932, -1.613898, 1, 1, 1, 1, 1,
-0.8146026, -1.332103, -0.9335343, 1, 1, 1, 1, 1,
-0.8140425, 1.190664, 0.2715852, 1, 1, 1, 1, 1,
-0.8137475, 0.2100525, -1.488277, 1, 1, 1, 1, 1,
-0.8097603, -1.087345, -2.012851, 1, 1, 1, 1, 1,
-0.8032879, 0.9554052, -0.4486075, 0, 0, 1, 1, 1,
-0.7959927, -2.321168, -2.675318, 1, 0, 0, 1, 1,
-0.7921789, -0.5555655, -1.491166, 1, 0, 0, 1, 1,
-0.7918926, -0.06621199, -2.470039, 1, 0, 0, 1, 1,
-0.7880687, -2.420496, -2.860932, 1, 0, 0, 1, 1,
-0.7873635, -0.1326105, -1.64756, 1, 0, 0, 1, 1,
-0.7829301, -0.08627015, -1.707313, 0, 0, 0, 1, 1,
-0.7828036, 0.9764608, 0.4124805, 0, 0, 0, 1, 1,
-0.7781094, 1.983395, -0.2595645, 0, 0, 0, 1, 1,
-0.7769579, -1.44752, -2.825799, 0, 0, 0, 1, 1,
-0.7723855, -0.8789734, -3.247585, 0, 0, 0, 1, 1,
-0.7680565, -1.170268, -4.242815, 0, 0, 0, 1, 1,
-0.7674648, -0.5451258, -1.681915, 0, 0, 0, 1, 1,
-0.7642617, -0.8190486, -2.588872, 1, 1, 1, 1, 1,
-0.7575186, 0.1742893, -2.763779, 1, 1, 1, 1, 1,
-0.7544079, -1.371605, -3.595475, 1, 1, 1, 1, 1,
-0.7480866, -0.2119243, -2.345583, 1, 1, 1, 1, 1,
-0.7433584, 0.9602839, 0.1594184, 1, 1, 1, 1, 1,
-0.7421808, 2.152045, 0.3250805, 1, 1, 1, 1, 1,
-0.7391263, -0.05554104, -2.815076, 1, 1, 1, 1, 1,
-0.7372386, 1.166913, 0.6741378, 1, 1, 1, 1, 1,
-0.736357, 1.894366, -1.097015, 1, 1, 1, 1, 1,
-0.7312084, -1.73494, -1.256376, 1, 1, 1, 1, 1,
-0.7301543, 0.6356577, -1.617282, 1, 1, 1, 1, 1,
-0.7250174, 0.8352681, -2.275224, 1, 1, 1, 1, 1,
-0.7243706, -1.18773, -2.194053, 1, 1, 1, 1, 1,
-0.7205949, 0.4240339, -0.1524834, 1, 1, 1, 1, 1,
-0.7200598, 1.178874, -1.01072, 1, 1, 1, 1, 1,
-0.7174768, 0.8599883, -1.081969, 0, 0, 1, 1, 1,
-0.7142068, -0.3013597, -1.758355, 1, 0, 0, 1, 1,
-0.7138903, 1.728266, -0.7081091, 1, 0, 0, 1, 1,
-0.7134719, -0.7899821, -3.337682, 1, 0, 0, 1, 1,
-0.7109249, -0.483779, -0.4180407, 1, 0, 0, 1, 1,
-0.7102085, 1.811223, 0.2222777, 1, 0, 0, 1, 1,
-0.7019507, -0.260757, -2.430564, 0, 0, 0, 1, 1,
-0.7013478, 0.2100473, -0.7498125, 0, 0, 0, 1, 1,
-0.6986214, 0.01235595, -0.6240932, 0, 0, 0, 1, 1,
-0.6915628, -1.431758, -3.621025, 0, 0, 0, 1, 1,
-0.6894524, 0.2684462, -0.4790845, 0, 0, 0, 1, 1,
-0.6885728, -0.005916348, -1.629725, 0, 0, 0, 1, 1,
-0.6759763, -0.314834, -0.6095157, 0, 0, 0, 1, 1,
-0.6704674, -0.6549333, -3.665636, 1, 1, 1, 1, 1,
-0.6685446, -0.2258842, 0.1763673, 1, 1, 1, 1, 1,
-0.665831, 0.4469747, 0.6980913, 1, 1, 1, 1, 1,
-0.6583187, -2.190236, -3.066932, 1, 1, 1, 1, 1,
-0.6580471, 0.2762229, -3.300791, 1, 1, 1, 1, 1,
-0.6572463, -0.3124516, -0.4761567, 1, 1, 1, 1, 1,
-0.6563666, 0.1726863, -0.8574618, 1, 1, 1, 1, 1,
-0.65438, 2.282847, -1.301442, 1, 1, 1, 1, 1,
-0.6508828, 2.211438, 0.2616116, 1, 1, 1, 1, 1,
-0.6475635, -0.5432029, -0.9240874, 1, 1, 1, 1, 1,
-0.647496, 1.120085, 1.467833, 1, 1, 1, 1, 1,
-0.6404729, 0.1713595, -0.9668254, 1, 1, 1, 1, 1,
-0.6376066, -0.863455, -2.101141, 1, 1, 1, 1, 1,
-0.6368636, 0.9768103, -1.929984, 1, 1, 1, 1, 1,
-0.6363711, -1.165925, -4.03285, 1, 1, 1, 1, 1,
-0.6338242, -0.2635906, -1.134757, 0, 0, 1, 1, 1,
-0.6288051, -2.470905, -3.747702, 1, 0, 0, 1, 1,
-0.6254162, -0.4426909, -0.8682069, 1, 0, 0, 1, 1,
-0.6200711, -1.464668, -2.587819, 1, 0, 0, 1, 1,
-0.6167248, 0.375273, -1.402315, 1, 0, 0, 1, 1,
-0.6130413, 1.434123, -0.7204092, 1, 0, 0, 1, 1,
-0.6129509, -0.02255908, -1.870868, 0, 0, 0, 1, 1,
-0.6121116, 0.7169062, -1.168602, 0, 0, 0, 1, 1,
-0.6081505, -1.461921, -4.530334, 0, 0, 0, 1, 1,
-0.6074901, -0.1794672, -1.677813, 0, 0, 0, 1, 1,
-0.6073499, 1.247732, 0.7237602, 0, 0, 0, 1, 1,
-0.6068364, -0.4275399, -1.551387, 0, 0, 0, 1, 1,
-0.6064879, -0.1280766, -2.636273, 0, 0, 0, 1, 1,
-0.6049122, -0.9323243, -3.625093, 1, 1, 1, 1, 1,
-0.5979692, -0.8581522, -2.522748, 1, 1, 1, 1, 1,
-0.5926458, -1.666928, -2.12926, 1, 1, 1, 1, 1,
-0.590488, -0.8216338, -1.621117, 1, 1, 1, 1, 1,
-0.5877593, 1.474527, -0.0909118, 1, 1, 1, 1, 1,
-0.5872114, 0.07761735, -1.07151, 1, 1, 1, 1, 1,
-0.5819739, -0.06237381, 1.173427, 1, 1, 1, 1, 1,
-0.5808606, -1.70235, -4.43434, 1, 1, 1, 1, 1,
-0.5673699, 1.455066, 1.05167, 1, 1, 1, 1, 1,
-0.5659314, 0.6082239, -0.8890278, 1, 1, 1, 1, 1,
-0.5508097, 0.2717792, -0.8017921, 1, 1, 1, 1, 1,
-0.5464737, 0.212254, 0.1219537, 1, 1, 1, 1, 1,
-0.546365, 0.8488969, 0.06878188, 1, 1, 1, 1, 1,
-0.5441737, -0.8169606, -3.922487, 1, 1, 1, 1, 1,
-0.5427942, 0.1417504, -1.731651, 1, 1, 1, 1, 1,
-0.5412448, -0.7893145, -2.656143, 0, 0, 1, 1, 1,
-0.536746, 1.067589, -1.574599, 1, 0, 0, 1, 1,
-0.5319614, 0.5500276, -1.910558, 1, 0, 0, 1, 1,
-0.5319235, -0.0234075, -1.753458, 1, 0, 0, 1, 1,
-0.530406, -1.166269, -4.268331, 1, 0, 0, 1, 1,
-0.5178151, 0.6082433, -1.005405, 1, 0, 0, 1, 1,
-0.5111484, -0.1232165, -1.421597, 0, 0, 0, 1, 1,
-0.5103038, 0.857083, 0.1442326, 0, 0, 0, 1, 1,
-0.5093679, -0.08128789, -1.962537, 0, 0, 0, 1, 1,
-0.5036592, 1.517329, -1.401728, 0, 0, 0, 1, 1,
-0.5001051, 1.15575, -0.7074679, 0, 0, 0, 1, 1,
-0.4931099, -0.5872518, -1.022516, 0, 0, 0, 1, 1,
-0.488131, 0.0107914, -0.1243737, 0, 0, 0, 1, 1,
-0.4844877, 0.5038722, -1.256775, 1, 1, 1, 1, 1,
-0.4843483, 0.4146738, -0.7881555, 1, 1, 1, 1, 1,
-0.4774023, 0.5788481, -2.776227, 1, 1, 1, 1, 1,
-0.4729486, -0.6398163, -1.559273, 1, 1, 1, 1, 1,
-0.4726868, -0.337364, -1.105072, 1, 1, 1, 1, 1,
-0.4683266, 2.324401, -0.1483465, 1, 1, 1, 1, 1,
-0.4671375, 0.1712901, -2.127424, 1, 1, 1, 1, 1,
-0.4661172, 1.092888, 0.1768783, 1, 1, 1, 1, 1,
-0.4646099, -2.136234, -3.443398, 1, 1, 1, 1, 1,
-0.463807, -0.6386284, -2.844465, 1, 1, 1, 1, 1,
-0.4596348, -0.2560841, -3.598181, 1, 1, 1, 1, 1,
-0.4594417, 1.135781, -0.02557785, 1, 1, 1, 1, 1,
-0.4553611, 2.622237, -0.07718109, 1, 1, 1, 1, 1,
-0.451101, -0.6737647, -4.42113, 1, 1, 1, 1, 1,
-0.449319, -1.710654, -2.686983, 1, 1, 1, 1, 1,
-0.4490979, 0.1898084, -0.9406673, 0, 0, 1, 1, 1,
-0.4480105, -1.019083, -2.944133, 1, 0, 0, 1, 1,
-0.4410742, -0.6571177, -3.27049, 1, 0, 0, 1, 1,
-0.4345529, -0.04786983, -1.833661, 1, 0, 0, 1, 1,
-0.4311821, 0.2833431, 0.7499936, 1, 0, 0, 1, 1,
-0.4292919, -1.680954, -1.69921, 1, 0, 0, 1, 1,
-0.4184144, 0.6177315, -0.7042692, 0, 0, 0, 1, 1,
-0.4044759, 0.4102163, 0.2954769, 0, 0, 0, 1, 1,
-0.4018199, -0.8333701, -3.929595, 0, 0, 0, 1, 1,
-0.3986878, -0.1662151, -2.405805, 0, 0, 0, 1, 1,
-0.3984001, -0.5500646, -3.055665, 0, 0, 0, 1, 1,
-0.3979257, -0.1106883, -1.238304, 0, 0, 0, 1, 1,
-0.3924501, -0.02432156, -2.041296, 0, 0, 0, 1, 1,
-0.3907782, -0.5061413, -2.193734, 1, 1, 1, 1, 1,
-0.3898838, -0.2435206, -1.848247, 1, 1, 1, 1, 1,
-0.3890781, -0.9148209, -3.028737, 1, 1, 1, 1, 1,
-0.38768, 0.5576348, -2.401462, 1, 1, 1, 1, 1,
-0.3843414, -1.067979, -2.938175, 1, 1, 1, 1, 1,
-0.3802553, 0.3733485, -0.557716, 1, 1, 1, 1, 1,
-0.3719091, 0.4275447, 1.30266, 1, 1, 1, 1, 1,
-0.3623842, 0.5613667, -1.115067, 1, 1, 1, 1, 1,
-0.3614608, -0.2234063, -1.270157, 1, 1, 1, 1, 1,
-0.3589683, -0.466396, -1.394047, 1, 1, 1, 1, 1,
-0.3575941, 0.005802721, -0.5895995, 1, 1, 1, 1, 1,
-0.3571346, -0.09662358, -1.819898, 1, 1, 1, 1, 1,
-0.355848, 0.5614085, -0.4064264, 1, 1, 1, 1, 1,
-0.3554489, 0.1767506, -0.9954153, 1, 1, 1, 1, 1,
-0.3547753, -1.489798, -2.738578, 1, 1, 1, 1, 1,
-0.350623, -0.5799915, -0.9948712, 0, 0, 1, 1, 1,
-0.3455289, -0.7207808, -3.313775, 1, 0, 0, 1, 1,
-0.3438028, -0.6134142, -3.595364, 1, 0, 0, 1, 1,
-0.3409751, -1.263796, -3.445679, 1, 0, 0, 1, 1,
-0.3376517, 0.3020574, -1.240277, 1, 0, 0, 1, 1,
-0.3339714, -1.295194, -1.94831, 1, 0, 0, 1, 1,
-0.3339142, -1.783462, -3.970077, 0, 0, 0, 1, 1,
-0.3313715, -0.7517335, -4.298229, 0, 0, 0, 1, 1,
-0.3254628, -0.4351137, -2.070045, 0, 0, 0, 1, 1,
-0.3217381, -1.271584, -1.545468, 0, 0, 0, 1, 1,
-0.3206946, -0.4217003, -2.551722, 0, 0, 0, 1, 1,
-0.316788, -0.07204457, -1.332867, 0, 0, 0, 1, 1,
-0.3096308, -0.6748496, -3.647652, 0, 0, 0, 1, 1,
-0.3074586, -0.06133436, -2.134527, 1, 1, 1, 1, 1,
-0.304534, -0.5827666, -3.658915, 1, 1, 1, 1, 1,
-0.3038182, 0.1483775, -1.181349, 1, 1, 1, 1, 1,
-0.3019614, 1.176101, -0.8466244, 1, 1, 1, 1, 1,
-0.2987603, -0.4642263, -1.528638, 1, 1, 1, 1, 1,
-0.2986971, -0.1792926, -3.538949, 1, 1, 1, 1, 1,
-0.2952716, 0.6647416, -0.04028024, 1, 1, 1, 1, 1,
-0.2919347, -1.256437, -3.656632, 1, 1, 1, 1, 1,
-0.2865459, -0.3837806, -3.536876, 1, 1, 1, 1, 1,
-0.2857412, 1.416155, 0.2210718, 1, 1, 1, 1, 1,
-0.2844998, 0.5336109, 1.286807, 1, 1, 1, 1, 1,
-0.2835523, -1.676932, -2.374786, 1, 1, 1, 1, 1,
-0.2805775, 0.02972623, -1.767189, 1, 1, 1, 1, 1,
-0.2804667, 1.740211, -0.309679, 1, 1, 1, 1, 1,
-0.2743197, 0.3487633, 1.461416, 1, 1, 1, 1, 1,
-0.2695733, -0.4260684, -2.457642, 0, 0, 1, 1, 1,
-0.2659235, 2.059719, -0.2321839, 1, 0, 0, 1, 1,
-0.2650163, 1.149158, -0.6436576, 1, 0, 0, 1, 1,
-0.2643729, 0.4580384, -0.7384024, 1, 0, 0, 1, 1,
-0.2638033, 0.528627, -1.155803, 1, 0, 0, 1, 1,
-0.262778, -0.3962987, -4.064155, 1, 0, 0, 1, 1,
-0.2550729, -1.43924, -3.42853, 0, 0, 0, 1, 1,
-0.2510244, -0.4575223, -1.592037, 0, 0, 0, 1, 1,
-0.2485751, 1.196061, -0.3576404, 0, 0, 0, 1, 1,
-0.2477554, 1.235445, 0.3527827, 0, 0, 0, 1, 1,
-0.2457561, 1.408497, -0.6517027, 0, 0, 0, 1, 1,
-0.2418038, 0.1465389, -0.4161184, 0, 0, 0, 1, 1,
-0.240234, -0.08063907, -0.4688013, 0, 0, 0, 1, 1,
-0.238123, -0.7538734, -2.873111, 1, 1, 1, 1, 1,
-0.2358546, 0.495822, 1.081878, 1, 1, 1, 1, 1,
-0.2343216, 0.4635431, 0.6139489, 1, 1, 1, 1, 1,
-0.2312444, 0.9718629, 0.9290293, 1, 1, 1, 1, 1,
-0.2311322, 0.06838359, -2.866356, 1, 1, 1, 1, 1,
-0.2287496, 0.1595818, 0.1505472, 1, 1, 1, 1, 1,
-0.2280295, 2.313958, 0.7700555, 1, 1, 1, 1, 1,
-0.2250502, 0.7887165, 0.1962818, 1, 1, 1, 1, 1,
-0.224288, 0.9427629, 0.4155501, 1, 1, 1, 1, 1,
-0.2238101, 1.604288, 1.473242, 1, 1, 1, 1, 1,
-0.2212289, -0.3789917, -3.67227, 1, 1, 1, 1, 1,
-0.2198114, -0.1405383, -2.558893, 1, 1, 1, 1, 1,
-0.216212, 0.4627583, 0.05452859, 1, 1, 1, 1, 1,
-0.2160437, 0.8618044, -0.4501006, 1, 1, 1, 1, 1,
-0.2138672, -0.3887868, -3.157241, 1, 1, 1, 1, 1,
-0.2039572, 0.4172101, -2.176887, 0, 0, 1, 1, 1,
-0.2033882, 0.05083423, -0.006016579, 1, 0, 0, 1, 1,
-0.2027362, 0.7413259, 1.003547, 1, 0, 0, 1, 1,
-0.1985073, 1.619274, 1.171294, 1, 0, 0, 1, 1,
-0.1942393, 0.7765952, 0.8597275, 1, 0, 0, 1, 1,
-0.1926354, 0.2737821, 0.788838, 1, 0, 0, 1, 1,
-0.1925808, 0.01048373, -2.374396, 0, 0, 0, 1, 1,
-0.1896724, -2.21158, -3.057105, 0, 0, 0, 1, 1,
-0.1852892, 0.4015501, -0.06333272, 0, 0, 0, 1, 1,
-0.1839366, -0.1316251, -2.448954, 0, 0, 0, 1, 1,
-0.1805659, 0.1093169, -0.9165159, 0, 0, 0, 1, 1,
-0.1804084, -0.1245187, -2.971087, 0, 0, 0, 1, 1,
-0.1684618, 1.351895, -1.75641, 0, 0, 0, 1, 1,
-0.1633712, 1.120648, 1.360398, 1, 1, 1, 1, 1,
-0.1623519, 1.295138, 0.3603598, 1, 1, 1, 1, 1,
-0.1603706, -1.651917, -1.973462, 1, 1, 1, 1, 1,
-0.1540038, -0.9554574, -3.784702, 1, 1, 1, 1, 1,
-0.1468061, -0.55224, -3.925731, 1, 1, 1, 1, 1,
-0.1458834, -0.3230747, -3.984612, 1, 1, 1, 1, 1,
-0.142713, 0.4268331, -0.7832443, 1, 1, 1, 1, 1,
-0.1420005, 1.773712, -0.06248052, 1, 1, 1, 1, 1,
-0.1415296, -0.4795566, -2.458405, 1, 1, 1, 1, 1,
-0.1357039, -0.4560272, -2.467739, 1, 1, 1, 1, 1,
-0.1338143, -1.525217, -3.125693, 1, 1, 1, 1, 1,
-0.1328929, 0.4936956, -0.02081099, 1, 1, 1, 1, 1,
-0.1320527, -0.9496693, -4.287131, 1, 1, 1, 1, 1,
-0.1292018, 0.5618905, -0.9090081, 1, 1, 1, 1, 1,
-0.1241025, 0.5434753, -2.296885, 1, 1, 1, 1, 1,
-0.1224582, -0.9547628, -1.297573, 0, 0, 1, 1, 1,
-0.121656, 1.618499, -0.07128223, 1, 0, 0, 1, 1,
-0.1183207, 0.8120052, 0.557065, 1, 0, 0, 1, 1,
-0.1170079, -0.2744975, -0.7010313, 1, 0, 0, 1, 1,
-0.116022, -0.1436082, -2.428272, 1, 0, 0, 1, 1,
-0.103714, 0.5025105, -0.09349963, 1, 0, 0, 1, 1,
-0.09935332, 1.224193, -0.4616286, 0, 0, 0, 1, 1,
-0.09836436, -1.60278, -2.481903, 0, 0, 0, 1, 1,
-0.09775981, -1.029842, -3.602088, 0, 0, 0, 1, 1,
-0.09766188, 0.9098629, -0.6575402, 0, 0, 0, 1, 1,
-0.09746671, -0.1537658, -3.971089, 0, 0, 0, 1, 1,
-0.09238072, 2.264619, -1.450806, 0, 0, 0, 1, 1,
-0.09174125, 0.05286604, -0.6782215, 0, 0, 0, 1, 1,
-0.09018997, 0.2636766, -0.2062213, 1, 1, 1, 1, 1,
-0.08767877, 0.588847, 1.177931, 1, 1, 1, 1, 1,
-0.08721589, -1.786918, -4.857649, 1, 1, 1, 1, 1,
-0.08266588, -0.7276079, -3.595325, 1, 1, 1, 1, 1,
-0.08056876, 2.750468, 1.026927, 1, 1, 1, 1, 1,
-0.07534485, 1.811174, 2.089065, 1, 1, 1, 1, 1,
-0.07425504, -0.9420804, -2.086239, 1, 1, 1, 1, 1,
-0.07370292, 0.2207024, 1.283069, 1, 1, 1, 1, 1,
-0.0727758, 0.7669688, -0.2782005, 1, 1, 1, 1, 1,
-0.06754211, 1.411073, -0.2834024, 1, 1, 1, 1, 1,
-0.06659336, -0.3624329, -4.814666, 1, 1, 1, 1, 1,
-0.06333299, -1.155677, -2.407523, 1, 1, 1, 1, 1,
-0.05520026, -1.212246, -3.272034, 1, 1, 1, 1, 1,
-0.05354111, -0.6624019, -3.602056, 1, 1, 1, 1, 1,
-0.05235822, 0.7464354, 2.189383, 1, 1, 1, 1, 1,
-0.04858593, -0.1434588, -3.28543, 0, 0, 1, 1, 1,
-0.04776055, -1.443563, -3.317125, 1, 0, 0, 1, 1,
-0.04568566, -1.005739, -1.77577, 1, 0, 0, 1, 1,
-0.03766248, -0.5099802, -3.135755, 1, 0, 0, 1, 1,
-0.03717323, -0.1424007, -1.839993, 1, 0, 0, 1, 1,
-0.03535786, -1.378543, -1.33118, 1, 0, 0, 1, 1,
-0.03311721, 0.04069126, -0.5098301, 0, 0, 0, 1, 1,
-0.0309033, 0.7715754, -1.906201, 0, 0, 0, 1, 1,
-0.03062645, 0.8078606, 2.497444, 0, 0, 0, 1, 1,
-0.02772704, -0.9484981, -3.734696, 0, 0, 0, 1, 1,
-0.0246029, 1.064303, -0.6810008, 0, 0, 0, 1, 1,
-0.02221062, 0.1792802, -0.7140353, 0, 0, 0, 1, 1,
-0.02090553, -0.208481, -4.471917, 0, 0, 0, 1, 1,
-0.01666295, 0.6422405, -0.02378378, 1, 1, 1, 1, 1,
-0.01657827, -1.394698, -2.56, 1, 1, 1, 1, 1,
-0.009220253, 0.389714, 0.789228, 1, 1, 1, 1, 1,
-0.007925564, -0.617037, -3.040162, 1, 1, 1, 1, 1,
-0.006144063, -0.327633, -4.253521, 1, 1, 1, 1, 1,
-0.005812102, -1.954169, -1.835945, 1, 1, 1, 1, 1,
-0.005054289, -0.6798176, -4.453734, 1, 1, 1, 1, 1,
-0.004470738, -0.227941, -5.242192, 1, 1, 1, 1, 1,
0.001037853, 0.5130382, 1.537515, 1, 1, 1, 1, 1,
0.002722132, -1.687236, 2.959631, 1, 1, 1, 1, 1,
0.008294974, -0.5994977, 2.919928, 1, 1, 1, 1, 1,
0.01201643, 1.825943, -0.3018559, 1, 1, 1, 1, 1,
0.01286133, -0.6491912, 2.98878, 1, 1, 1, 1, 1,
0.01461659, 0.02794541, 1.588162, 1, 1, 1, 1, 1,
0.01930955, 0.7691358, 0.9312537, 1, 1, 1, 1, 1,
0.02591449, -1.131612, 5.586918, 0, 0, 1, 1, 1,
0.02656429, 0.7361253, 1.062618, 1, 0, 0, 1, 1,
0.02863553, -0.6642478, 2.709783, 1, 0, 0, 1, 1,
0.02874518, -0.4344567, 3.819314, 1, 0, 0, 1, 1,
0.02936147, 0.7848466, -0.634908, 1, 0, 0, 1, 1,
0.03017373, 1.041682, -0.3303799, 1, 0, 0, 1, 1,
0.03087195, 0.2480807, 0.8434299, 0, 0, 0, 1, 1,
0.03186552, 0.7134318, -0.02386235, 0, 0, 0, 1, 1,
0.03406451, -0.9064422, 2.769707, 0, 0, 0, 1, 1,
0.03442496, -0.2566276, 2.055455, 0, 0, 0, 1, 1,
0.03462303, 0.4766877, 0.1563231, 0, 0, 0, 1, 1,
0.03650752, -0.3224339, 2.968493, 0, 0, 0, 1, 1,
0.03719963, -1.900709, 4.6015, 0, 0, 0, 1, 1,
0.0375274, 1.153659, 0.2693301, 1, 1, 1, 1, 1,
0.04340534, 0.5868884, 0.1448473, 1, 1, 1, 1, 1,
0.04558625, 0.1844531, 0.4996582, 1, 1, 1, 1, 1,
0.04615569, -0.1035666, 0.892908, 1, 1, 1, 1, 1,
0.0526987, -0.1046894, 1.674554, 1, 1, 1, 1, 1,
0.05438616, 0.437146, 2.590937, 1, 1, 1, 1, 1,
0.05714689, 0.2273093, 0.4175074, 1, 1, 1, 1, 1,
0.0572981, -0.7150684, 2.75855, 1, 1, 1, 1, 1,
0.06296891, 1.205227, 0.5249673, 1, 1, 1, 1, 1,
0.06340947, -0.6621178, 1.548685, 1, 1, 1, 1, 1,
0.0675813, -0.5492378, 1.395028, 1, 1, 1, 1, 1,
0.07510602, -1.373746, 3.250547, 1, 1, 1, 1, 1,
0.07705624, -0.2473705, 0.5251994, 1, 1, 1, 1, 1,
0.07910614, 0.07082061, -0.04992862, 1, 1, 1, 1, 1,
0.08038603, -0.3987855, 2.005279, 1, 1, 1, 1, 1,
0.09099825, 0.9173284, 0.5265194, 0, 0, 1, 1, 1,
0.0915093, -0.8019639, 3.072139, 1, 0, 0, 1, 1,
0.09383307, 2.646993, 0.3136798, 1, 0, 0, 1, 1,
0.09487779, 2.233046, -1.931075, 1, 0, 0, 1, 1,
0.09660853, 1.010431, 1.417247, 1, 0, 0, 1, 1,
0.09748083, -0.3469162, 0.2292452, 1, 0, 0, 1, 1,
0.09987058, -0.05401871, 3.177355, 0, 0, 0, 1, 1,
0.1006903, -0.09587234, 2.582027, 0, 0, 0, 1, 1,
0.1007727, -0.3062994, 1.986059, 0, 0, 0, 1, 1,
0.1017091, 0.04844148, 0.1298781, 0, 0, 0, 1, 1,
0.1050696, -0.1732409, 2.242471, 0, 0, 0, 1, 1,
0.1169967, 0.3940224, -0.4437566, 0, 0, 0, 1, 1,
0.1180656, 1.775496, 1.006567, 0, 0, 0, 1, 1,
0.1191856, 0.04491248, 2.374581, 1, 1, 1, 1, 1,
0.1193451, 1.210498, 1.32121, 1, 1, 1, 1, 1,
0.1217428, 1.870677, 1.101734, 1, 1, 1, 1, 1,
0.1233264, 0.0401119, 1.227018, 1, 1, 1, 1, 1,
0.1244484, -0.6955314, 1.879845, 1, 1, 1, 1, 1,
0.1255894, 1.228568, 0.5769806, 1, 1, 1, 1, 1,
0.1256582, -1.342852, 2.707049, 1, 1, 1, 1, 1,
0.1325776, -0.4212375, 1.953178, 1, 1, 1, 1, 1,
0.1361619, -1.365176, 4.467446, 1, 1, 1, 1, 1,
0.1391449, -1.649841, 3.2603, 1, 1, 1, 1, 1,
0.1392587, 0.1237697, -0.7025818, 1, 1, 1, 1, 1,
0.1409858, 1.288093, -0.8603336, 1, 1, 1, 1, 1,
0.1430163, -0.03473702, 3.133467, 1, 1, 1, 1, 1,
0.1436563, -1.483983, 2.645012, 1, 1, 1, 1, 1,
0.1450623, -2.150823, 2.767403, 1, 1, 1, 1, 1,
0.1506696, 1.073118, -1.221066, 0, 0, 1, 1, 1,
0.1535215, -1.658412, 2.276381, 1, 0, 0, 1, 1,
0.1559471, 0.3007336, -0.4475603, 1, 0, 0, 1, 1,
0.1561253, 1.133934, 1.007372, 1, 0, 0, 1, 1,
0.1581515, -0.1839936, 3.21289, 1, 0, 0, 1, 1,
0.1585876, 0.7419556, -0.01241611, 1, 0, 0, 1, 1,
0.1631254, -0.8665928, 1.883552, 0, 0, 0, 1, 1,
0.1633194, 1.20865, -0.5074341, 0, 0, 0, 1, 1,
0.1677524, 1.173738, 1.930312, 0, 0, 0, 1, 1,
0.1695251, 1.023588, 0.42724, 0, 0, 0, 1, 1,
0.1767197, -0.08574325, 3.990478, 0, 0, 0, 1, 1,
0.1793314, 2.130448, 1.352668, 0, 0, 0, 1, 1,
0.1807109, 0.1120667, 1.486167, 0, 0, 0, 1, 1,
0.1820133, -2.092168, 1.535909, 1, 1, 1, 1, 1,
0.1836627, -0.7223793, 1.460307, 1, 1, 1, 1, 1,
0.1843747, 0.08173203, 2.060692, 1, 1, 1, 1, 1,
0.1853103, -2.140036, 2.464554, 1, 1, 1, 1, 1,
0.1863349, -0.07899996, 2.067549, 1, 1, 1, 1, 1,
0.1869864, -0.5247647, 3.421626, 1, 1, 1, 1, 1,
0.1896485, -3.014875, 2.831186, 1, 1, 1, 1, 1,
0.1970854, 1.953671, -0.2691495, 1, 1, 1, 1, 1,
0.1978097, 0.4700871, -1.182075, 1, 1, 1, 1, 1,
0.2001772, 0.3669682, 2.340624, 1, 1, 1, 1, 1,
0.2003391, -0.306025, 2.252259, 1, 1, 1, 1, 1,
0.2026052, 0.3444373, -0.5408591, 1, 1, 1, 1, 1,
0.2034518, 0.4664288, -0.7154521, 1, 1, 1, 1, 1,
0.2048097, -0.86807, 1.652541, 1, 1, 1, 1, 1,
0.2052798, 1.155665, 0.7471687, 1, 1, 1, 1, 1,
0.2095861, -0.585631, 1.908622, 0, 0, 1, 1, 1,
0.2110477, -1.165499, 2.605978, 1, 0, 0, 1, 1,
0.2111465, -1.477505, 2.713911, 1, 0, 0, 1, 1,
0.2115171, -0.3101451, 1.519965, 1, 0, 0, 1, 1,
0.2120424, -1.177452, 2.933697, 1, 0, 0, 1, 1,
0.2129005, 0.6308354, 0.4308652, 1, 0, 0, 1, 1,
0.2130474, -0.4677973, 2.404624, 0, 0, 0, 1, 1,
0.2132759, -1.064536, 2.28517, 0, 0, 0, 1, 1,
0.2141327, 1.23203, 0.4520253, 0, 0, 0, 1, 1,
0.2204996, -0.3745076, 1.907359, 0, 0, 0, 1, 1,
0.2207363, -0.7835602, 2.825457, 0, 0, 0, 1, 1,
0.2246511, -0.5973717, 2.244982, 0, 0, 0, 1, 1,
0.2273916, -0.2772231, 3.262819, 0, 0, 0, 1, 1,
0.2294704, 0.4688065, -0.2213783, 1, 1, 1, 1, 1,
0.2339799, -0.2671737, 2.313654, 1, 1, 1, 1, 1,
0.2352746, 0.4316852, 1.724234, 1, 1, 1, 1, 1,
0.2355232, 0.3364017, 1.001594, 1, 1, 1, 1, 1,
0.2366486, 0.8340021, -0.9389819, 1, 1, 1, 1, 1,
0.2373105, 0.9467224, -0.208032, 1, 1, 1, 1, 1,
0.244741, 1.798642, 0.999193, 1, 1, 1, 1, 1,
0.2448432, 0.4067668, 0.8112567, 1, 1, 1, 1, 1,
0.2463263, 0.2752665, 1.357437, 1, 1, 1, 1, 1,
0.2478182, -0.4024784, 3.476676, 1, 1, 1, 1, 1,
0.2508997, 0.2957238, -2.599717, 1, 1, 1, 1, 1,
0.2531009, 0.7961879, -0.1714779, 1, 1, 1, 1, 1,
0.2532652, 0.2325733, 0.3393932, 1, 1, 1, 1, 1,
0.2639408, 0.2267429, 1.253681, 1, 1, 1, 1, 1,
0.269952, 0.09110974, 3.093357, 1, 1, 1, 1, 1,
0.2712031, -0.004250925, 1.251766, 0, 0, 1, 1, 1,
0.2718101, 2.365842, -0.4358996, 1, 0, 0, 1, 1,
0.2759954, 1.078278, -0.5044989, 1, 0, 0, 1, 1,
0.2765995, 0.312608, 1.575913, 1, 0, 0, 1, 1,
0.2795879, 2.062093, -2.224392, 1, 0, 0, 1, 1,
0.2853514, -0.7952467, 3.637117, 1, 0, 0, 1, 1,
0.2927298, 1.043582, -0.4295936, 0, 0, 0, 1, 1,
0.2939798, 0.04029145, 2.165452, 0, 0, 0, 1, 1,
0.3026345, -0.6022498, 3.672025, 0, 0, 0, 1, 1,
0.304074, -0.8520123, 3.563043, 0, 0, 0, 1, 1,
0.3063235, -0.6004986, 3.438115, 0, 0, 0, 1, 1,
0.3133112, 1.693795, 1.435754, 0, 0, 0, 1, 1,
0.3140943, -0.3973878, 3.54947, 0, 0, 0, 1, 1,
0.3214464, -0.5012117, 3.897142, 1, 1, 1, 1, 1,
0.32178, 0.4091662, 3.108215, 1, 1, 1, 1, 1,
0.3243409, -0.8010378, 2.149952, 1, 1, 1, 1, 1,
0.3255654, -1.104874, 2.61266, 1, 1, 1, 1, 1,
0.3284202, 1.297019, 1.788859, 1, 1, 1, 1, 1,
0.3295673, 0.1862418, 0.4138457, 1, 1, 1, 1, 1,
0.3299281, 0.5106179, 0.0762112, 1, 1, 1, 1, 1,
0.3321014, 1.29178, 0.1117162, 1, 1, 1, 1, 1,
0.3354553, -1.417607, 4.671331, 1, 1, 1, 1, 1,
0.3370435, 1.264719, 0.5742943, 1, 1, 1, 1, 1,
0.3387398, 0.9399413, 0.05719974, 1, 1, 1, 1, 1,
0.3459377, 0.653237, 0.4839008, 1, 1, 1, 1, 1,
0.3473867, -1.082029, 3.697534, 1, 1, 1, 1, 1,
0.3474206, 0.7414378, 0.4642152, 1, 1, 1, 1, 1,
0.350653, 0.5776891, -1.851737, 1, 1, 1, 1, 1,
0.3550709, 0.1771992, -0.2647711, 0, 0, 1, 1, 1,
0.3577532, 1.170441, -2.570855, 1, 0, 0, 1, 1,
0.3578811, 0.5825561, 2.134995, 1, 0, 0, 1, 1,
0.3620898, -0.6358367, 4.192013, 1, 0, 0, 1, 1,
0.3646003, -2.186652, 3.570124, 1, 0, 0, 1, 1,
0.3675613, 0.1429584, 2.257187, 1, 0, 0, 1, 1,
0.3702655, 0.01667029, 1.573207, 0, 0, 0, 1, 1,
0.3705391, 0.4669298, -0.1692666, 0, 0, 0, 1, 1,
0.3710997, 0.54414, 1.558807, 0, 0, 0, 1, 1,
0.3725615, 0.4516587, 0.8378214, 0, 0, 0, 1, 1,
0.3775711, -0.3006991, 2.137545, 0, 0, 0, 1, 1,
0.3804624, -0.485454, 2.770231, 0, 0, 0, 1, 1,
0.3858607, 0.6866208, 1.497336, 0, 0, 0, 1, 1,
0.3859558, 1.154411, 0.8622172, 1, 1, 1, 1, 1,
0.3864836, -0.6278896, 2.608583, 1, 1, 1, 1, 1,
0.3866523, 0.2271158, 0.1527477, 1, 1, 1, 1, 1,
0.3885579, 0.7935057, -0.8488855, 1, 1, 1, 1, 1,
0.3931353, -1.165927, 3.196369, 1, 1, 1, 1, 1,
0.3946334, -0.1495424, 2.428589, 1, 1, 1, 1, 1,
0.3953961, 0.4671844, 1.709428, 1, 1, 1, 1, 1,
0.3966504, -0.8547276, 4.251356, 1, 1, 1, 1, 1,
0.3967377, 0.163987, 1.557546, 1, 1, 1, 1, 1,
0.3982511, 0.6578192, 0.830488, 1, 1, 1, 1, 1,
0.4025567, -0.5776766, 2.320588, 1, 1, 1, 1, 1,
0.4042022, -1.874066, 2.814289, 1, 1, 1, 1, 1,
0.4051847, 1.289883, -1.295213, 1, 1, 1, 1, 1,
0.4057365, 0.05629874, 0.5114945, 1, 1, 1, 1, 1,
0.4057769, -0.8925638, 2.32971, 1, 1, 1, 1, 1,
0.4132086, -0.5048976, 1.111436, 0, 0, 1, 1, 1,
0.4218282, 0.5452162, 0.9025179, 1, 0, 0, 1, 1,
0.4250087, -0.5324578, 2.871172, 1, 0, 0, 1, 1,
0.4281524, -0.0388625, 3.594918, 1, 0, 0, 1, 1,
0.4348603, 0.2863592, 0.6708437, 1, 0, 0, 1, 1,
0.439357, 2.080433, -0.3040048, 1, 0, 0, 1, 1,
0.4451193, 1.254995, 0.6743579, 0, 0, 0, 1, 1,
0.4502878, -1.494025, 3.078332, 0, 0, 0, 1, 1,
0.4506752, -0.6277033, 2.540921, 0, 0, 0, 1, 1,
0.4520993, 0.2457087, 2.309992, 0, 0, 0, 1, 1,
0.4559003, 0.9799763, 0.4471682, 0, 0, 0, 1, 1,
0.4562738, 0.3891509, 2.477492, 0, 0, 0, 1, 1,
0.4585306, 0.5261697, 0.8933216, 0, 0, 0, 1, 1,
0.4620308, 1.969548, 0.04203437, 1, 1, 1, 1, 1,
0.4629973, 0.4412966, 0.5323769, 1, 1, 1, 1, 1,
0.4671316, 0.8748549, -1.250712, 1, 1, 1, 1, 1,
0.4676383, 0.9969674, 1.220526, 1, 1, 1, 1, 1,
0.4698427, -3.227426, 2.902203, 1, 1, 1, 1, 1,
0.4742966, 0.575403, 0.2853983, 1, 1, 1, 1, 1,
0.4775038, 0.2847107, 1.349079, 1, 1, 1, 1, 1,
0.4785281, -0.1297341, 2.711796, 1, 1, 1, 1, 1,
0.4877655, -0.5569171, 1.925507, 1, 1, 1, 1, 1,
0.4946306, -0.09212156, 3.31046, 1, 1, 1, 1, 1,
0.4979191, -0.4058448, 3.755086, 1, 1, 1, 1, 1,
0.4980091, -0.199236, 1.129163, 1, 1, 1, 1, 1,
0.4982102, -1.740742, 3.319802, 1, 1, 1, 1, 1,
0.4998139, 1.196736, -0.4051185, 1, 1, 1, 1, 1,
0.5002767, 1.178338, 0.1492052, 1, 1, 1, 1, 1,
0.5004612, -3.291438, 2.157103, 0, 0, 1, 1, 1,
0.5145977, 0.6427239, 1.576818, 1, 0, 0, 1, 1,
0.5188721, -0.3491676, 1.949448, 1, 0, 0, 1, 1,
0.5197749, -0.7532378, 3.278174, 1, 0, 0, 1, 1,
0.5252874, -1.62391, 3.920746, 1, 0, 0, 1, 1,
0.5294303, -1.876362, 1.358808, 1, 0, 0, 1, 1,
0.5362348, 1.435622, -0.1265167, 0, 0, 0, 1, 1,
0.5365016, 0.8746888, -0.5068671, 0, 0, 0, 1, 1,
0.5376072, -1.099834, 1.5713, 0, 0, 0, 1, 1,
0.54191, 0.3222425, 1.2367, 0, 0, 0, 1, 1,
0.5442778, -0.4061669, 2.047455, 0, 0, 0, 1, 1,
0.5457769, -0.1570847, 1.337738, 0, 0, 0, 1, 1,
0.550221, 0.7105648, 1.216355, 0, 0, 0, 1, 1,
0.5530394, -0.4357981, 2.517158, 1, 1, 1, 1, 1,
0.5577852, 0.8290229, 0.6796386, 1, 1, 1, 1, 1,
0.567621, -0.4424789, -0.02079119, 1, 1, 1, 1, 1,
0.5758067, -0.4692035, 3.328749, 1, 1, 1, 1, 1,
0.5778419, -0.6610708, 3.517576, 1, 1, 1, 1, 1,
0.5780496, -0.9401282, 2.333901, 1, 1, 1, 1, 1,
0.5816621, 0.6338434, 0.7972944, 1, 1, 1, 1, 1,
0.5839413, -0.4603412, 0.7378126, 1, 1, 1, 1, 1,
0.5857589, -0.7866067, 3.673365, 1, 1, 1, 1, 1,
0.5909078, 0.1685852, 0.3866872, 1, 1, 1, 1, 1,
0.5912546, -1.118077, 1.022227, 1, 1, 1, 1, 1,
0.5935591, 2.097973, -1.503928, 1, 1, 1, 1, 1,
0.5984458, 0.5951054, 1.070122, 1, 1, 1, 1, 1,
0.6031363, 0.342674, 1.461032, 1, 1, 1, 1, 1,
0.6035078, -0.8330413, 2.391568, 1, 1, 1, 1, 1,
0.6035403, -0.4930784, 2.280531, 0, 0, 1, 1, 1,
0.6041292, -0.1024775, 1.65422, 1, 0, 0, 1, 1,
0.6041834, -0.9110959, 3.435265, 1, 0, 0, 1, 1,
0.6052269, -1.014804, 1.739766, 1, 0, 0, 1, 1,
0.6053417, -0.8003508, 2.616612, 1, 0, 0, 1, 1,
0.6077357, 1.052089, 0.3883323, 1, 0, 0, 1, 1,
0.612035, 1.654187, -0.01890054, 0, 0, 0, 1, 1,
0.614244, -1.012317, 1.899476, 0, 0, 0, 1, 1,
0.6257898, -1.877654, 1.721677, 0, 0, 0, 1, 1,
0.6383683, 0.13068, 1.947249, 0, 0, 0, 1, 1,
0.6403816, -0.1958349, 0.559725, 0, 0, 0, 1, 1,
0.6435862, 1.108611, -1.069653, 0, 0, 0, 1, 1,
0.6471806, -0.2370501, 2.394266, 0, 0, 0, 1, 1,
0.6497846, -1.013115, 2.534381, 1, 1, 1, 1, 1,
0.652943, 1.149847, -0.002426944, 1, 1, 1, 1, 1,
0.6562406, -0.9597865, 1.528227, 1, 1, 1, 1, 1,
0.6609644, -0.2364647, 1.896977, 1, 1, 1, 1, 1,
0.6618741, -0.2002114, 3.073019, 1, 1, 1, 1, 1,
0.6683953, 1.37402, 1.471569, 1, 1, 1, 1, 1,
0.6711478, 0.9162762, 1.332077, 1, 1, 1, 1, 1,
0.6716859, -0.5975977, 4.715744, 1, 1, 1, 1, 1,
0.6754573, -0.4907816, 1.166175, 1, 1, 1, 1, 1,
0.6756361, 0.2409247, 0.5697423, 1, 1, 1, 1, 1,
0.6759109, 1.809074, 0.6282969, 1, 1, 1, 1, 1,
0.6775338, 2.155173, -0.06247947, 1, 1, 1, 1, 1,
0.6777565, -0.8280676, 1.027802, 1, 1, 1, 1, 1,
0.6784217, 0.5676467, -0.318308, 1, 1, 1, 1, 1,
0.683739, 0.2114826, 0.8770823, 1, 1, 1, 1, 1,
0.68435, 0.3602741, 1.253328, 0, 0, 1, 1, 1,
0.6870213, -0.4413633, 1.444943, 1, 0, 0, 1, 1,
0.688305, 0.3250906, -0.4339002, 1, 0, 0, 1, 1,
0.6897821, -0.1862379, 1.013155, 1, 0, 0, 1, 1,
0.6942055, -1.079059, 3.996152, 1, 0, 0, 1, 1,
0.6981084, -0.9209366, 3.23948, 1, 0, 0, 1, 1,
0.7055415, 0.070159, 0.9634386, 0, 0, 0, 1, 1,
0.7059817, 0.5224745, 0.3800496, 0, 0, 0, 1, 1,
0.7071381, 1.795038, 2.197553, 0, 0, 0, 1, 1,
0.7227179, 1.615988, 0.9272118, 0, 0, 0, 1, 1,
0.72568, 1.988765, 0.3836336, 0, 0, 0, 1, 1,
0.7329552, -0.5870973, 3.310966, 0, 0, 0, 1, 1,
0.7408817, 1.498719, 0.8839225, 0, 0, 0, 1, 1,
0.7426218, 1.389149, 1.440736, 1, 1, 1, 1, 1,
0.7479467, -1.303398, 2.391779, 1, 1, 1, 1, 1,
0.7518293, 0.1651336, 0.2232267, 1, 1, 1, 1, 1,
0.755443, -0.594363, 2.933549, 1, 1, 1, 1, 1,
0.7559664, -1.041997, 3.30078, 1, 1, 1, 1, 1,
0.7593784, -2.271892, 3.71819, 1, 1, 1, 1, 1,
0.7616255, -1.585241, 3.088739, 1, 1, 1, 1, 1,
0.7691948, 0.07307247, 1.75844, 1, 1, 1, 1, 1,
0.7758129, 1.021136, 0.6367273, 1, 1, 1, 1, 1,
0.7768887, -0.02475264, 1.948906, 1, 1, 1, 1, 1,
0.7823957, 0.6617169, 0.7483796, 1, 1, 1, 1, 1,
0.7833308, 0.1546081, 0.8685995, 1, 1, 1, 1, 1,
0.7852929, -1.260346, 2.260976, 1, 1, 1, 1, 1,
0.7861916, 0.1285333, -0.07574936, 1, 1, 1, 1, 1,
0.7873245, 0.5168984, -0.3588632, 1, 1, 1, 1, 1,
0.7877905, 0.3611067, 0.300134, 0, 0, 1, 1, 1,
0.7900597, 0.2045724, 0.8119863, 1, 0, 0, 1, 1,
0.7917479, -0.9680834, 2.03639, 1, 0, 0, 1, 1,
0.7932665, -0.1474537, 2.529833, 1, 0, 0, 1, 1,
0.7939635, -1.319619, 4.091754, 1, 0, 0, 1, 1,
0.7949525, 0.07072006, 1.050476, 1, 0, 0, 1, 1,
0.7986974, -0.4340189, -0.2916268, 0, 0, 0, 1, 1,
0.7989079, -1.060557, 1.875711, 0, 0, 0, 1, 1,
0.799091, -1.266956, 2.315132, 0, 0, 0, 1, 1,
0.799168, -0.1179219, 3.751054, 0, 0, 0, 1, 1,
0.8011692, 1.050103, 2.540562, 0, 0, 0, 1, 1,
0.8139527, -0.2442608, 2.177343, 0, 0, 0, 1, 1,
0.8166391, 0.2757963, 0.872345, 0, 0, 0, 1, 1,
0.8202395, -0.3140776, 2.017271, 1, 1, 1, 1, 1,
0.8233075, 1.173854, 2.143832, 1, 1, 1, 1, 1,
0.8258433, 1.377506, -1.869349, 1, 1, 1, 1, 1,
0.8261806, 1.080132, -0.1292602, 1, 1, 1, 1, 1,
0.8289122, -1.429245, 2.409329, 1, 1, 1, 1, 1,
0.8394942, 0.01977638, 0.36733, 1, 1, 1, 1, 1,
0.8448547, 0.8139575, -0.3628077, 1, 1, 1, 1, 1,
0.847653, 0.6833799, 1.747078, 1, 1, 1, 1, 1,
0.8489054, -0.7137585, 1.151992, 1, 1, 1, 1, 1,
0.8546826, 1.364126, -1.144848, 1, 1, 1, 1, 1,
0.8579541, 0.8680385, 0.5385348, 1, 1, 1, 1, 1,
0.8622614, -1.83648, 0.9912012, 1, 1, 1, 1, 1,
0.862443, 1.005111, 1.141456, 1, 1, 1, 1, 1,
0.8692846, -0.2573139, 1.371174, 1, 1, 1, 1, 1,
0.8692967, 0.5513515, 2.76582, 1, 1, 1, 1, 1,
0.8695586, -0.3996226, 3.290788, 0, 0, 1, 1, 1,
0.8707875, 0.1515103, 2.621287, 1, 0, 0, 1, 1,
0.8750643, 1.54094, 0.8546181, 1, 0, 0, 1, 1,
0.879379, 0.491053, -0.7348396, 1, 0, 0, 1, 1,
0.8818427, 0.6320894, -1.911695, 1, 0, 0, 1, 1,
0.8847553, -0.5879545, 2.095881, 1, 0, 0, 1, 1,
0.8867932, 2.228736, 1.245517, 0, 0, 0, 1, 1,
0.9010605, -1.680674, 2.639592, 0, 0, 0, 1, 1,
0.905502, 0.3245041, 1.849959, 0, 0, 0, 1, 1,
0.9076546, -0.4050595, 1.767905, 0, 0, 0, 1, 1,
0.9193997, 1.269819, 0.4199495, 0, 0, 0, 1, 1,
0.9316403, -1.184157, 4.389653, 0, 0, 0, 1, 1,
0.9357763, -0.006446344, 1.658444, 0, 0, 0, 1, 1,
0.9360844, 0.02444013, -0.1795048, 1, 1, 1, 1, 1,
0.9401575, 0.1375944, 1.427078, 1, 1, 1, 1, 1,
0.9401754, -0.302662, 1.846537, 1, 1, 1, 1, 1,
0.9414172, 1.652777, 1.077161, 1, 1, 1, 1, 1,
0.9444736, -0.7520567, 0.6057264, 1, 1, 1, 1, 1,
0.9495578, 1.93439, 0.07846887, 1, 1, 1, 1, 1,
0.9585311, 0.8647729, -0.01470429, 1, 1, 1, 1, 1,
0.9618762, -0.4256452, 0.4925811, 1, 1, 1, 1, 1,
0.9637521, -0.5198839, 3.078454, 1, 1, 1, 1, 1,
0.9660286, -0.7085871, 1.474761, 1, 1, 1, 1, 1,
0.9667168, 0.314667, 1.766178, 1, 1, 1, 1, 1,
0.9690083, 1.371911, 0.7868124, 1, 1, 1, 1, 1,
0.9730202, 1.479324, 0.9250605, 1, 1, 1, 1, 1,
0.9776644, 0.06007896, 2.837667, 1, 1, 1, 1, 1,
0.977951, 0.02304819, 1.853682, 1, 1, 1, 1, 1,
0.9833404, 0.7622713, 0.2700614, 0, 0, 1, 1, 1,
0.9834425, -0.7644169, 2.245636, 1, 0, 0, 1, 1,
0.9959553, -1.174069, 1.750482, 1, 0, 0, 1, 1,
0.9981423, -0.8042706, 3.512658, 1, 0, 0, 1, 1,
1.006472, 0.3089894, 1.635325, 1, 0, 0, 1, 1,
1.006642, -0.03792462, 0.3239447, 1, 0, 0, 1, 1,
1.021664, -1.89769, 2.539128, 0, 0, 0, 1, 1,
1.022359, 0.1483349, 0.1077472, 0, 0, 0, 1, 1,
1.024241, 0.9869124, 0.05392921, 0, 0, 0, 1, 1,
1.029644, 0.2094868, 0.9345699, 0, 0, 0, 1, 1,
1.031331, 0.1320009, 1.405186, 0, 0, 0, 1, 1,
1.031758, 0.5593783, 2.59385, 0, 0, 0, 1, 1,
1.032169, -0.5407902, 0.1291475, 0, 0, 0, 1, 1,
1.036651, 0.2068547, 1.467345, 1, 1, 1, 1, 1,
1.038078, -0.3899781, 1.503414, 1, 1, 1, 1, 1,
1.039572, -0.4659801, 4.005257, 1, 1, 1, 1, 1,
1.041559, 0.001846002, 2.015985, 1, 1, 1, 1, 1,
1.043819, 1.057443, 0.7175876, 1, 1, 1, 1, 1,
1.051782, 0.8211439, -0.6779568, 1, 1, 1, 1, 1,
1.056418, 0.07219417, -1.015718, 1, 1, 1, 1, 1,
1.060352, -0.8384901, 3.305999, 1, 1, 1, 1, 1,
1.064212, 0.4204044, 1.616057, 1, 1, 1, 1, 1,
1.067529, -0.2230395, 1.535609, 1, 1, 1, 1, 1,
1.070802, 0.1520776, 1.795558, 1, 1, 1, 1, 1,
1.073148, 0.09636126, 0.4067467, 1, 1, 1, 1, 1,
1.074252, -0.07207077, 3.058845, 1, 1, 1, 1, 1,
1.078162, 1.49362, 1.653727, 1, 1, 1, 1, 1,
1.0794, 0.07500401, 0.7857521, 1, 1, 1, 1, 1,
1.083125, 0.1709921, 1.578857, 0, 0, 1, 1, 1,
1.087248, 0.8977754, 1.774709, 1, 0, 0, 1, 1,
1.099429, 0.302332, 1.788124, 1, 0, 0, 1, 1,
1.09971, 0.6374908, 1.034701, 1, 0, 0, 1, 1,
1.109835, 0.03585985, 3.305548, 1, 0, 0, 1, 1,
1.112876, -1.143163, 3.728585, 1, 0, 0, 1, 1,
1.115298, 0.68977, 4.242837, 0, 0, 0, 1, 1,
1.117128, 0.1041017, 2.162991, 0, 0, 0, 1, 1,
1.119782, 0.4943357, 2.668846, 0, 0, 0, 1, 1,
1.121722, -0.1802306, 0.09710474, 0, 0, 0, 1, 1,
1.123846, -0.01722875, 2.094205, 0, 0, 0, 1, 1,
1.12853, 0.8244447, 0.9475916, 0, 0, 0, 1, 1,
1.13873, -1.441666, 3.271472, 0, 0, 0, 1, 1,
1.139803, 2.801895, 0.4652055, 1, 1, 1, 1, 1,
1.143311, 0.1013553, 1.087944, 1, 1, 1, 1, 1,
1.151922, -0.195242, 2.641824, 1, 1, 1, 1, 1,
1.155522, 0.2578819, 1.984927, 1, 1, 1, 1, 1,
1.156636, 0.6553189, 1.297545, 1, 1, 1, 1, 1,
1.16319, 1.817376, 1.757641, 1, 1, 1, 1, 1,
1.164833, 0.512962, -0.3556024, 1, 1, 1, 1, 1,
1.168763, 0.06965602, 1.620092, 1, 1, 1, 1, 1,
1.170606, 1.306275, 3.766563, 1, 1, 1, 1, 1,
1.17985, -1.703298, 2.518429, 1, 1, 1, 1, 1,
1.181029, -2.883642, 2.826819, 1, 1, 1, 1, 1,
1.192197, 1.805496, -1.09765, 1, 1, 1, 1, 1,
1.194921, 1.066225, 1.15616, 1, 1, 1, 1, 1,
1.19625, 0.3122428, 3.303322, 1, 1, 1, 1, 1,
1.202896, -0.9535311, 2.298466, 1, 1, 1, 1, 1,
1.206303, 0.422686, 2.065413, 0, 0, 1, 1, 1,
1.209705, 1.988799, -0.1515463, 1, 0, 0, 1, 1,
1.217155, 0.7291035, 0.5790058, 1, 0, 0, 1, 1,
1.220548, 0.518733, 2.034701, 1, 0, 0, 1, 1,
1.229726, -0.7336273, 2.637026, 1, 0, 0, 1, 1,
1.242186, -0.9080607, 0.2979686, 1, 0, 0, 1, 1,
1.242313, -0.6428194, 1.224969, 0, 0, 0, 1, 1,
1.244506, -0.008520357, 3.263109, 0, 0, 0, 1, 1,
1.253341, 0.4949501, 2.284879, 0, 0, 0, 1, 1,
1.25925, -0.456891, 1.48351, 0, 0, 0, 1, 1,
1.265219, 0.265808, 1.066646, 0, 0, 0, 1, 1,
1.267759, 2.161213, -0.3741475, 0, 0, 0, 1, 1,
1.269032, -0.05849579, 2.750039, 0, 0, 0, 1, 1,
1.277166, -0.7881943, 3.181517, 1, 1, 1, 1, 1,
1.286716, -0.5194045, -0.06228097, 1, 1, 1, 1, 1,
1.290707, 0.5233641, 2.820441, 1, 1, 1, 1, 1,
1.293507, -1.198866, 1.20561, 1, 1, 1, 1, 1,
1.30671, -0.3473489, 0.112953, 1, 1, 1, 1, 1,
1.319232, -1.98789, 3.754423, 1, 1, 1, 1, 1,
1.320501, 0.2560437, -0.2591465, 1, 1, 1, 1, 1,
1.33222, -0.3289513, 2.45358, 1, 1, 1, 1, 1,
1.334617, -0.04972319, 3.563584, 1, 1, 1, 1, 1,
1.348865, 1.538402, -0.24169, 1, 1, 1, 1, 1,
1.354301, 0.1940608, 2.265538, 1, 1, 1, 1, 1,
1.361508, -0.8927236, 3.114756, 1, 1, 1, 1, 1,
1.368787, -0.2655205, 2.257586, 1, 1, 1, 1, 1,
1.371293, 0.6207575, 3.216709, 1, 1, 1, 1, 1,
1.381629, 0.7868617, 1.127568, 1, 1, 1, 1, 1,
1.383663, 0.1107901, 1.030481, 0, 0, 1, 1, 1,
1.388597, 0.9421139, 2.03585, 1, 0, 0, 1, 1,
1.389364, 0.2970065, 1.340151, 1, 0, 0, 1, 1,
1.409668, -1.812875, 3.09945, 1, 0, 0, 1, 1,
1.416103, -0.5062142, 1.552299, 1, 0, 0, 1, 1,
1.416142, 0.04923902, 0.3803059, 1, 0, 0, 1, 1,
1.42344, -1.095316, 3.010751, 0, 0, 0, 1, 1,
1.426586, 1.863993, 2.608696, 0, 0, 0, 1, 1,
1.429445, -1.866468, 2.157644, 0, 0, 0, 1, 1,
1.443095, 0.005411064, 2.577421, 0, 0, 0, 1, 1,
1.443885, 0.6782286, 0.01142245, 0, 0, 0, 1, 1,
1.451242, 0.5757084, 1.695511, 0, 0, 0, 1, 1,
1.466557, 0.3605357, 2.157052, 0, 0, 0, 1, 1,
1.490816, -0.5118564, 1.871772, 1, 1, 1, 1, 1,
1.491844, -0.9393734, 2.852306, 1, 1, 1, 1, 1,
1.493249, -0.0411488, 2.413245, 1, 1, 1, 1, 1,
1.493683, -1.469705, 3.242628, 1, 1, 1, 1, 1,
1.505752, -0.674721, 0.685137, 1, 1, 1, 1, 1,
1.544059, 0.4147069, 1.946107, 1, 1, 1, 1, 1,
1.545771, -0.7248735, 1.961437, 1, 1, 1, 1, 1,
1.545872, 1.256569, 1.25893, 1, 1, 1, 1, 1,
1.549792, -0.9919041, 0.4292002, 1, 1, 1, 1, 1,
1.559353, 0.01731496, 2.047507, 1, 1, 1, 1, 1,
1.560002, -0.2778789, 2.616769, 1, 1, 1, 1, 1,
1.56889, 0.6928858, 2.383559, 1, 1, 1, 1, 1,
1.574227, 2.209498, 1.366757, 1, 1, 1, 1, 1,
1.581135, -0.1142899, 1.795407, 1, 1, 1, 1, 1,
1.586447, 1.459139, 1.054162, 1, 1, 1, 1, 1,
1.602299, -0.6810115, 1.071644, 0, 0, 1, 1, 1,
1.612862, -0.6429433, 1.104022, 1, 0, 0, 1, 1,
1.613617, -1.850675, 2.837937, 1, 0, 0, 1, 1,
1.629436, -1.451032, 3.573714, 1, 0, 0, 1, 1,
1.631124, 0.3403014, 0.7794974, 1, 0, 0, 1, 1,
1.635774, 1.004889, 0.939212, 1, 0, 0, 1, 1,
1.643808, -0.8052343, 2.512574, 0, 0, 0, 1, 1,
1.658082, 0.8411365, 1.635175, 0, 0, 0, 1, 1,
1.660703, -0.3746682, 1.007032, 0, 0, 0, 1, 1,
1.682662, 0.2970228, 0.03160054, 0, 0, 0, 1, 1,
1.689798, -0.9473123, 3.195163, 0, 0, 0, 1, 1,
1.714272, -0.5788562, 1.698969, 0, 0, 0, 1, 1,
1.748366, 1.255232, -1.115408, 0, 0, 0, 1, 1,
1.757851, 0.6167685, 1.635097, 1, 1, 1, 1, 1,
1.779718, -1.414535, 3.196487, 1, 1, 1, 1, 1,
1.787177, 0.07510096, 1.388661, 1, 1, 1, 1, 1,
1.810833, -1.100067, 3.274799, 1, 1, 1, 1, 1,
1.817242, -0.9669588, 2.934724, 1, 1, 1, 1, 1,
1.826149, 1.025519, -0.2773264, 1, 1, 1, 1, 1,
1.832486, 0.9798195, 0.1719519, 1, 1, 1, 1, 1,
1.834676, 2.112456, 1.265129, 1, 1, 1, 1, 1,
1.84185, 0.4581749, 0.559605, 1, 1, 1, 1, 1,
1.854341, 0.6047006, 1.963564, 1, 1, 1, 1, 1,
1.873354, 1.282463, 0.06582277, 1, 1, 1, 1, 1,
1.873985, 1.244684, 0.7199134, 1, 1, 1, 1, 1,
1.907521, 0.5360053, 1.452617, 1, 1, 1, 1, 1,
1.91578, -0.617986, 2.943533, 1, 1, 1, 1, 1,
1.956804, 0.4163612, 1.954787, 1, 1, 1, 1, 1,
1.957489, 1.082184, 1.972105, 0, 0, 1, 1, 1,
1.959445, -0.4069673, 4.084787, 1, 0, 0, 1, 1,
2.011047, -0.7922174, 0.1382258, 1, 0, 0, 1, 1,
2.016558, 0.09086615, 1.560854, 1, 0, 0, 1, 1,
2.018831, -2.41705, 1.920431, 1, 0, 0, 1, 1,
2.112463, 0.1037488, 1.029988, 1, 0, 0, 1, 1,
2.139102, 1.077141, 0.6293569, 0, 0, 0, 1, 1,
2.153992, 0.1135865, 2.479734, 0, 0, 0, 1, 1,
2.155473, -0.3365013, 2.952619, 0, 0, 0, 1, 1,
2.168971, -0.8409041, 0.2988732, 0, 0, 0, 1, 1,
2.205587, -0.2568053, 0.8303087, 0, 0, 0, 1, 1,
2.210905, -1.54171, 0.1995809, 0, 0, 0, 1, 1,
2.321976, 0.6020234, 0.3240117, 0, 0, 0, 1, 1,
2.366261, -0.08141346, 2.854264, 1, 1, 1, 1, 1,
2.419383, 0.3158926, 2.207256, 1, 1, 1, 1, 1,
2.425549, -0.2011551, 0.8414382, 1, 1, 1, 1, 1,
2.441543, 0.4756985, -0.5652593, 1, 1, 1, 1, 1,
2.773655, -0.01074975, -0.6800749, 1, 1, 1, 1, 1,
2.868852, 1.143645, 2.379545, 1, 1, 1, 1, 1,
2.902863, -1.551738, 1.737431, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.539011;
var distance = 33.50537;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.04761195, 0.2447715, 0.04347658 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50537);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
