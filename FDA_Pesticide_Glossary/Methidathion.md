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
-3.095505, -0.6537665, -2.8748, 1, 0, 0, 1,
-3.070754, 0.8665901, -1.288602, 1, 0.007843138, 0, 1,
-2.791578, -0.07519803, -1.165995, 1, 0.01176471, 0, 1,
-2.597318, -1.478954, -1.927499, 1, 0.01960784, 0, 1,
-2.555069, -0.7554534, -2.755627, 1, 0.02352941, 0, 1,
-2.508024, -1.199352, -2.902625, 1, 0.03137255, 0, 1,
-2.483681, -1.454732, -3.753989, 1, 0.03529412, 0, 1,
-2.431617, 0.1560345, -2.446502, 1, 0.04313726, 0, 1,
-2.377841, -1.119453, -1.994586, 1, 0.04705882, 0, 1,
-2.358539, 1.178698, -0.795549, 1, 0.05490196, 0, 1,
-2.355292, -0.6437763, -1.403246, 1, 0.05882353, 0, 1,
-2.32116, -1.837901, 0.06315689, 1, 0.06666667, 0, 1,
-2.211432, -1.239656, -1.512707, 1, 0.07058824, 0, 1,
-2.183384, -0.5068469, -3.875519, 1, 0.07843138, 0, 1,
-2.134538, 0.06684007, -1.015254, 1, 0.08235294, 0, 1,
-2.063145, 0.2505287, -2.454354, 1, 0.09019608, 0, 1,
-2.059931, 0.0173413, -0.5521966, 1, 0.09411765, 0, 1,
-2.058425, -0.9269614, -2.132722, 1, 0.1019608, 0, 1,
-2.02509, 2.09082, -1.001325, 1, 0.1098039, 0, 1,
-2.024497, 0.016983, -1.607915, 1, 0.1137255, 0, 1,
-2.02001, 0.5451284, -1.811186, 1, 0.1215686, 0, 1,
-2.016892, -0.1448662, -1.492455, 1, 0.1254902, 0, 1,
-2.007377, -0.2363897, -1.326203, 1, 0.1333333, 0, 1,
-2.001487, -0.05235, -0.5233642, 1, 0.1372549, 0, 1,
-1.992917, 0.1705766, -1.99871, 1, 0.145098, 0, 1,
-1.982472, 1.702369, 0.07996751, 1, 0.1490196, 0, 1,
-1.974689, 1.709511, -1.92894, 1, 0.1568628, 0, 1,
-1.958948, -0.6069559, 0.7421111, 1, 0.1607843, 0, 1,
-1.9155, 0.337674, -1.001933, 1, 0.1686275, 0, 1,
-1.908614, -2.070276, -1.978624, 1, 0.172549, 0, 1,
-1.897494, 0.556687, -2.749164, 1, 0.1803922, 0, 1,
-1.893445, 0.1121986, -1.361111, 1, 0.1843137, 0, 1,
-1.884372, 0.8329606, -1.605659, 1, 0.1921569, 0, 1,
-1.87239, 0.02066451, 0.7948571, 1, 0.1960784, 0, 1,
-1.853867, 0.8447373, -1.440369, 1, 0.2039216, 0, 1,
-1.848645, 2.251658, -1.477614, 1, 0.2117647, 0, 1,
-1.834996, -0.3589503, -3.009963, 1, 0.2156863, 0, 1,
-1.826141, -0.0688249, -1.905967, 1, 0.2235294, 0, 1,
-1.802188, -0.1739508, -0.6068134, 1, 0.227451, 0, 1,
-1.786922, 0.07236031, -0.7555972, 1, 0.2352941, 0, 1,
-1.772111, 0.7235827, 0.2233009, 1, 0.2392157, 0, 1,
-1.759378, 0.06840958, -1.271669, 1, 0.2470588, 0, 1,
-1.753709, -0.1663642, -2.499006, 1, 0.2509804, 0, 1,
-1.752725, 1.964229, 0.4295892, 1, 0.2588235, 0, 1,
-1.743358, -0.0820714, -0.5004682, 1, 0.2627451, 0, 1,
-1.733755, 1.451138, -0.300358, 1, 0.2705882, 0, 1,
-1.726546, -0.1033821, -2.000777, 1, 0.2745098, 0, 1,
-1.720742, 0.03530698, 0.134788, 1, 0.282353, 0, 1,
-1.696396, -2.400111, -3.619287, 1, 0.2862745, 0, 1,
-1.696079, -1.802065, -0.673788, 1, 0.2941177, 0, 1,
-1.686578, -0.3873444, 0.1003808, 1, 0.3019608, 0, 1,
-1.685313, -0.6879416, 0.07556639, 1, 0.3058824, 0, 1,
-1.682323, 1.119351, -0.9580867, 1, 0.3137255, 0, 1,
-1.664912, 2.19442, -1.840958, 1, 0.3176471, 0, 1,
-1.662936, 0.8942578, -1.069451, 1, 0.3254902, 0, 1,
-1.656293, 0.5109215, -0.2611025, 1, 0.3294118, 0, 1,
-1.649812, -0.2852849, -2.081863, 1, 0.3372549, 0, 1,
-1.646726, -0.1538229, -2.483367, 1, 0.3411765, 0, 1,
-1.643281, 2.405147, -1.732558, 1, 0.3490196, 0, 1,
-1.637892, 1.486284, -2.270523, 1, 0.3529412, 0, 1,
-1.610688, 0.2290953, -1.896789, 1, 0.3607843, 0, 1,
-1.594417, -2.126599, -3.401089, 1, 0.3647059, 0, 1,
-1.590713, -1.32715, -1.324185, 1, 0.372549, 0, 1,
-1.560095, 0.1375355, -0.03646284, 1, 0.3764706, 0, 1,
-1.555849, -1.349062, -2.305718, 1, 0.3843137, 0, 1,
-1.55354, 0.7279143, -0.2836478, 1, 0.3882353, 0, 1,
-1.546849, 0.1124128, -0.9937487, 1, 0.3960784, 0, 1,
-1.542466, -0.4708037, -2.880552, 1, 0.4039216, 0, 1,
-1.531962, -0.01056656, -1.554515, 1, 0.4078431, 0, 1,
-1.528358, 0.3076648, -1.410109, 1, 0.4156863, 0, 1,
-1.51035, -0.4530382, -1.448698, 1, 0.4196078, 0, 1,
-1.497431, -1.775919, -2.351245, 1, 0.427451, 0, 1,
-1.49631, 0.05456037, -1.436169, 1, 0.4313726, 0, 1,
-1.49096, -1.113626, -0.8228495, 1, 0.4392157, 0, 1,
-1.479262, -0.2557087, -1.040711, 1, 0.4431373, 0, 1,
-1.478858, -0.7501418, -2.579613, 1, 0.4509804, 0, 1,
-1.456244, -0.2121669, -3.206043, 1, 0.454902, 0, 1,
-1.451817, -1.068386, -3.482634, 1, 0.4627451, 0, 1,
-1.44949, -1.554994, -1.356166, 1, 0.4666667, 0, 1,
-1.448797, -0.2205687, -2.499538, 1, 0.4745098, 0, 1,
-1.445944, 0.07841184, -2.914314, 1, 0.4784314, 0, 1,
-1.435238, 1.608517, -1.726541, 1, 0.4862745, 0, 1,
-1.43492, -0.2506391, -2.698947, 1, 0.4901961, 0, 1,
-1.424013, 0.1810194, -1.577729, 1, 0.4980392, 0, 1,
-1.423652, -0.6452059, -2.77227, 1, 0.5058824, 0, 1,
-1.422555, -1.032342, -2.509229, 1, 0.509804, 0, 1,
-1.415319, -0.8551622, -2.809509, 1, 0.5176471, 0, 1,
-1.393556, 0.5799405, -1.106907, 1, 0.5215687, 0, 1,
-1.391582, 0.7691973, -2.362822, 1, 0.5294118, 0, 1,
-1.389706, 0.5229756, -2.176693, 1, 0.5333334, 0, 1,
-1.388372, -0.5796983, -2.125284, 1, 0.5411765, 0, 1,
-1.384621, 0.8682306, -0.4751396, 1, 0.5450981, 0, 1,
-1.373073, 0.4733126, -2.293031, 1, 0.5529412, 0, 1,
-1.372207, 0.3394237, -1.160234, 1, 0.5568628, 0, 1,
-1.368519, -1.062886, -2.35464, 1, 0.5647059, 0, 1,
-1.366761, -0.5713599, -1.130198, 1, 0.5686275, 0, 1,
-1.366431, -0.4727675, 0.195528, 1, 0.5764706, 0, 1,
-1.356377, 2.369556, 0.3457468, 1, 0.5803922, 0, 1,
-1.353762, 0.1798657, -0.8128054, 1, 0.5882353, 0, 1,
-1.334563, -1.089749, -3.34206, 1, 0.5921569, 0, 1,
-1.323173, 0.5078561, -0.971564, 1, 0.6, 0, 1,
-1.315053, 0.587418, -0.2026757, 1, 0.6078432, 0, 1,
-1.311333, 0.764911, -0.3330371, 1, 0.6117647, 0, 1,
-1.300764, 2.891218, -0.02287215, 1, 0.6196079, 0, 1,
-1.299112, 1.813117, 1.483367, 1, 0.6235294, 0, 1,
-1.298311, 1.246085, -0.3150374, 1, 0.6313726, 0, 1,
-1.291962, 1.105821, -1.734651, 1, 0.6352941, 0, 1,
-1.287755, 1.314382, 0.9652671, 1, 0.6431373, 0, 1,
-1.28512, -0.9394881, -1.492094, 1, 0.6470588, 0, 1,
-1.281081, -1.743264, -1.614949, 1, 0.654902, 0, 1,
-1.279566, 0.01575532, -0.9980399, 1, 0.6588235, 0, 1,
-1.264328, -1.144602, -2.906826, 1, 0.6666667, 0, 1,
-1.260916, -1.382892, -2.07092, 1, 0.6705883, 0, 1,
-1.260146, -0.2935288, -0.456466, 1, 0.6784314, 0, 1,
-1.258739, 0.3634842, -2.044613, 1, 0.682353, 0, 1,
-1.257535, 2.773078, -0.7633, 1, 0.6901961, 0, 1,
-1.250934, -0.3605143, -1.77664, 1, 0.6941177, 0, 1,
-1.227418, -0.5659774, -2.273077, 1, 0.7019608, 0, 1,
-1.224608, 1.116647, -1.424006, 1, 0.7098039, 0, 1,
-1.21624, -2.34932, -2.941445, 1, 0.7137255, 0, 1,
-1.216204, -0.3186818, -2.861449, 1, 0.7215686, 0, 1,
-1.216196, -0.6599917, -1.549532, 1, 0.7254902, 0, 1,
-1.210919, -0.5522112, -3.700248, 1, 0.7333333, 0, 1,
-1.193031, 0.7264818, -0.5143695, 1, 0.7372549, 0, 1,
-1.190112, 0.1311871, -1.7161, 1, 0.7450981, 0, 1,
-1.18958, -0.1215525, -1.566416, 1, 0.7490196, 0, 1,
-1.189324, 2.00295, -1.049551, 1, 0.7568628, 0, 1,
-1.188623, 0.1852363, -1.088144, 1, 0.7607843, 0, 1,
-1.187672, -0.7552599, -1.649709, 1, 0.7686275, 0, 1,
-1.185985, -0.2340716, -2.281116, 1, 0.772549, 0, 1,
-1.183404, 0.9589672, -0.868222, 1, 0.7803922, 0, 1,
-1.177242, 0.1080188, 0.53109, 1, 0.7843137, 0, 1,
-1.170279, -0.5264638, -2.199807, 1, 0.7921569, 0, 1,
-1.166769, -0.1974134, -1.272535, 1, 0.7960784, 0, 1,
-1.155586, 0.4006869, -2.806074, 1, 0.8039216, 0, 1,
-1.152852, 0.3809659, 1.508224, 1, 0.8117647, 0, 1,
-1.150558, 1.311698, -1.040216, 1, 0.8156863, 0, 1,
-1.150342, -0.8702529, -0.2865824, 1, 0.8235294, 0, 1,
-1.143293, -0.5264714, -2.07869, 1, 0.827451, 0, 1,
-1.143284, 0.09655382, -1.376619, 1, 0.8352941, 0, 1,
-1.140926, -1.188624, -2.510705, 1, 0.8392157, 0, 1,
-1.134222, 2.622451, 0.5348881, 1, 0.8470588, 0, 1,
-1.133815, -0.1488602, -1.534146, 1, 0.8509804, 0, 1,
-1.133529, -0.05213153, -2.554871, 1, 0.8588235, 0, 1,
-1.130114, -0.5008928, -1.682713, 1, 0.8627451, 0, 1,
-1.116124, -0.5569811, -1.097917, 1, 0.8705882, 0, 1,
-1.114163, -0.2399301, -1.73644, 1, 0.8745098, 0, 1,
-1.114007, -0.4981143, -2.358316, 1, 0.8823529, 0, 1,
-1.111457, 1.154738, -1.628444, 1, 0.8862745, 0, 1,
-1.105978, 0.7164975, -2.252771, 1, 0.8941177, 0, 1,
-1.103043, 0.4075102, -1.670529, 1, 0.8980392, 0, 1,
-1.098092, -0.8673578, -3.017852, 1, 0.9058824, 0, 1,
-1.096725, -2.467004, -2.801313, 1, 0.9137255, 0, 1,
-1.090365, -0.3289607, -0.2887068, 1, 0.9176471, 0, 1,
-1.082171, -1.310346, -1.544056, 1, 0.9254902, 0, 1,
-1.078401, -0.140625, -1.710682, 1, 0.9294118, 0, 1,
-1.075977, 0.9792275, -0.6766202, 1, 0.9372549, 0, 1,
-1.074333, -0.01004193, -0.9885679, 1, 0.9411765, 0, 1,
-1.066983, 1.785092, -1.656765, 1, 0.9490196, 0, 1,
-1.04483, 0.1550255, -1.482269, 1, 0.9529412, 0, 1,
-1.038948, 0.7289605, -2.423407, 1, 0.9607843, 0, 1,
-1.038594, 0.1751177, -1.441403, 1, 0.9647059, 0, 1,
-1.036397, -1.283135, -2.509055, 1, 0.972549, 0, 1,
-1.026054, 0.5942266, -0.920243, 1, 0.9764706, 0, 1,
-1.025505, 0.2798362, -2.591934, 1, 0.9843137, 0, 1,
-1.024114, -1.039511, -0.9556865, 1, 0.9882353, 0, 1,
-1.015918, 0.01746795, 0.02037721, 1, 0.9960784, 0, 1,
-1.01482, -0.07628727, -1.569975, 0.9960784, 1, 0, 1,
-1.014806, 0.7268806, -2.044335, 0.9921569, 1, 0, 1,
-1.008119, -0.8225357, -2.671169, 0.9843137, 1, 0, 1,
-1.007186, 0.6505412, 0.1459038, 0.9803922, 1, 0, 1,
-1.002265, -0.7815444, -2.78849, 0.972549, 1, 0, 1,
-0.9968961, 0.3187174, -0.05318585, 0.9686275, 1, 0, 1,
-0.9952365, -0.2986241, -2.09344, 0.9607843, 1, 0, 1,
-0.9937397, -1.31245, -2.779363, 0.9568627, 1, 0, 1,
-0.9870407, -1.478711, -3.076404, 0.9490196, 1, 0, 1,
-0.9739974, 1.140671, -0.4928544, 0.945098, 1, 0, 1,
-0.9716623, -1.577263, -4.068693, 0.9372549, 1, 0, 1,
-0.9710925, -0.6016576, -3.043957, 0.9333333, 1, 0, 1,
-0.9709487, -1.014326, -2.954288, 0.9254902, 1, 0, 1,
-0.9688203, 0.7721491, -1.690842, 0.9215686, 1, 0, 1,
-0.9648078, -1.275198, -4.462055, 0.9137255, 1, 0, 1,
-0.962036, -0.4854746, -1.781438, 0.9098039, 1, 0, 1,
-0.9525521, 0.8530151, -0.09016959, 0.9019608, 1, 0, 1,
-0.9501352, -2.010958, -2.900772, 0.8941177, 1, 0, 1,
-0.9445143, 0.6582584, 0.1175713, 0.8901961, 1, 0, 1,
-0.9325712, 0.6755609, 1.248398, 0.8823529, 1, 0, 1,
-0.9319703, -1.507873, -3.197941, 0.8784314, 1, 0, 1,
-0.9301921, 0.2333416, -1.691515, 0.8705882, 1, 0, 1,
-0.9285847, -1.294407, -3.231693, 0.8666667, 1, 0, 1,
-0.9245085, -0.5986581, -0.3424162, 0.8588235, 1, 0, 1,
-0.9224018, -0.8495952, -2.088182, 0.854902, 1, 0, 1,
-0.9100193, 1.268796, 1.526589, 0.8470588, 1, 0, 1,
-0.9028434, -0.8706378, -3.803082, 0.8431373, 1, 0, 1,
-0.9024761, -0.04165632, -2.111524, 0.8352941, 1, 0, 1,
-0.9014899, -0.9772722, -5.246531, 0.8313726, 1, 0, 1,
-0.8995644, 1.913009, -0.3322571, 0.8235294, 1, 0, 1,
-0.8986284, 3.111368, -0.1639013, 0.8196079, 1, 0, 1,
-0.8969769, 2.001717, 1.0934, 0.8117647, 1, 0, 1,
-0.8925898, -1.089609, -2.330149, 0.8078431, 1, 0, 1,
-0.8873904, -0.6252279, -2.667227, 0.8, 1, 0, 1,
-0.8700955, 3.720733, -0.5152363, 0.7921569, 1, 0, 1,
-0.8643924, -0.8340384, -1.303857, 0.7882353, 1, 0, 1,
-0.863925, -0.846666, -3.983366, 0.7803922, 1, 0, 1,
-0.8611795, -1.758139, -2.818258, 0.7764706, 1, 0, 1,
-0.8458849, 0.05987282, -1.425631, 0.7686275, 1, 0, 1,
-0.8385528, 0.1505188, -2.099944, 0.7647059, 1, 0, 1,
-0.8244023, -0.902655, -3.369157, 0.7568628, 1, 0, 1,
-0.8234554, -0.8142585, -1.144396, 0.7529412, 1, 0, 1,
-0.8075954, -2.215921, -2.490073, 0.7450981, 1, 0, 1,
-0.7957436, 0.9248415, -1.556689, 0.7411765, 1, 0, 1,
-0.7902785, -1.529632, -2.747306, 0.7333333, 1, 0, 1,
-0.7875658, -0.843522, -3.086027, 0.7294118, 1, 0, 1,
-0.7839642, 0.05442845, -2.968253, 0.7215686, 1, 0, 1,
-0.7835096, 0.2158154, -1.483702, 0.7176471, 1, 0, 1,
-0.7830116, -0.2191578, 0.4758901, 0.7098039, 1, 0, 1,
-0.7810282, 2.026617, 0.6852344, 0.7058824, 1, 0, 1,
-0.7749969, -0.2328285, -0.3242373, 0.6980392, 1, 0, 1,
-0.7743626, -0.6635799, -2.939291, 0.6901961, 1, 0, 1,
-0.768358, 0.246962, -2.418266, 0.6862745, 1, 0, 1,
-0.7670899, 0.3785034, -0.8009241, 0.6784314, 1, 0, 1,
-0.7642827, -1.250044, -3.382501, 0.6745098, 1, 0, 1,
-0.7552368, 1.014647, -0.739329, 0.6666667, 1, 0, 1,
-0.7529191, 0.2971354, -1.634432, 0.6627451, 1, 0, 1,
-0.7464454, 0.1135697, -3.485882, 0.654902, 1, 0, 1,
-0.7334567, 0.240359, -1.578199, 0.6509804, 1, 0, 1,
-0.7306163, -1.404347, -2.865844, 0.6431373, 1, 0, 1,
-0.7304164, 1.05973, -0.1841003, 0.6392157, 1, 0, 1,
-0.7285465, -0.5649894, -4.897464, 0.6313726, 1, 0, 1,
-0.7239518, -1.460342, -1.724382, 0.627451, 1, 0, 1,
-0.7184077, 0.1686558, -2.521819, 0.6196079, 1, 0, 1,
-0.7159218, -0.7252271, -1.719246, 0.6156863, 1, 0, 1,
-0.7113844, -1.642027, -1.845317, 0.6078432, 1, 0, 1,
-0.7095583, -2.944817, -3.665938, 0.6039216, 1, 0, 1,
-0.7089782, -1.320938, -1.837419, 0.5960785, 1, 0, 1,
-0.7076282, 0.8250806, 0.2290767, 0.5882353, 1, 0, 1,
-0.6986441, 0.4776937, -2.540104, 0.5843138, 1, 0, 1,
-0.6981673, 0.2997722, -1.501484, 0.5764706, 1, 0, 1,
-0.6934826, 0.7600273, -2.738409, 0.572549, 1, 0, 1,
-0.6912018, -1.581013, -3.802106, 0.5647059, 1, 0, 1,
-0.6872678, 0.9389307, 1.570649, 0.5607843, 1, 0, 1,
-0.6864138, -0.8095632, -1.68514, 0.5529412, 1, 0, 1,
-0.6851935, -0.6181608, -2.795964, 0.5490196, 1, 0, 1,
-0.6844105, 1.140684, -1.827876, 0.5411765, 1, 0, 1,
-0.6731244, 0.388287, -2.748803, 0.5372549, 1, 0, 1,
-0.6692801, 0.2938426, -1.864349, 0.5294118, 1, 0, 1,
-0.6679443, -0.962024, -2.422139, 0.5254902, 1, 0, 1,
-0.6653379, 0.05215801, -2.85806, 0.5176471, 1, 0, 1,
-0.6652107, -0.6056485, -1.914991, 0.5137255, 1, 0, 1,
-0.6602357, 0.9668452, 0.002962898, 0.5058824, 1, 0, 1,
-0.6598201, 2.624284, 0.2733384, 0.5019608, 1, 0, 1,
-0.6568158, 1.479699, -1.251829, 0.4941176, 1, 0, 1,
-0.6532011, 1.597629, -0.8409489, 0.4862745, 1, 0, 1,
-0.6520594, 0.656181, -2.198006, 0.4823529, 1, 0, 1,
-0.6484585, -0.4202122, -2.274741, 0.4745098, 1, 0, 1,
-0.6440532, 1.29068, -1.18561, 0.4705882, 1, 0, 1,
-0.6396827, -0.6184535, -1.168779, 0.4627451, 1, 0, 1,
-0.6391686, -1.308311, -3.561935, 0.4588235, 1, 0, 1,
-0.6383445, -0.6125032, -1.033065, 0.4509804, 1, 0, 1,
-0.6270778, -1.478423, -2.836735, 0.4470588, 1, 0, 1,
-0.6251611, -0.2140853, -2.35516, 0.4392157, 1, 0, 1,
-0.6251041, 0.0788624, -2.462185, 0.4352941, 1, 0, 1,
-0.6189048, 0.4555408, -0.4291655, 0.427451, 1, 0, 1,
-0.6165169, 0.4719005, -1.026627, 0.4235294, 1, 0, 1,
-0.6158124, 1.089193, -0.991102, 0.4156863, 1, 0, 1,
-0.614318, -1.035501, -3.708132, 0.4117647, 1, 0, 1,
-0.6106362, -0.6987716, -2.237047, 0.4039216, 1, 0, 1,
-0.6044439, 0.1101312, -0.5014384, 0.3960784, 1, 0, 1,
-0.5977539, 0.3512691, 0.050664, 0.3921569, 1, 0, 1,
-0.5928551, -0.01612304, -1.778039, 0.3843137, 1, 0, 1,
-0.5925851, 1.130533, -1.480705, 0.3803922, 1, 0, 1,
-0.590775, -0.6525137, -2.53842, 0.372549, 1, 0, 1,
-0.5898393, -0.09372553, -1.06758, 0.3686275, 1, 0, 1,
-0.5864523, -0.2529275, -1.868256, 0.3607843, 1, 0, 1,
-0.5859469, 0.0129194, -3.064685, 0.3568628, 1, 0, 1,
-0.5844956, -0.3640215, -1.288636, 0.3490196, 1, 0, 1,
-0.5774252, -1.56305, -1.609107, 0.345098, 1, 0, 1,
-0.5695019, -0.1689278, -0.6139472, 0.3372549, 1, 0, 1,
-0.5691959, 0.7574657, -1.354612, 0.3333333, 1, 0, 1,
-0.5685869, -1.398756, -2.74441, 0.3254902, 1, 0, 1,
-0.5662909, -0.1288408, -0.339439, 0.3215686, 1, 0, 1,
-0.5660141, 1.245499, -0.3241903, 0.3137255, 1, 0, 1,
-0.5646957, 0.2850478, -1.772572, 0.3098039, 1, 0, 1,
-0.5633621, 1.688981, -1.314338, 0.3019608, 1, 0, 1,
-0.5594865, -1.398141, -3.35585, 0.2941177, 1, 0, 1,
-0.5583886, -0.5748619, -3.504878, 0.2901961, 1, 0, 1,
-0.5545846, -2.043369, -2.938467, 0.282353, 1, 0, 1,
-0.5529032, 0.3090409, -2.960362, 0.2784314, 1, 0, 1,
-0.5465103, 0.2797716, -2.167085, 0.2705882, 1, 0, 1,
-0.5453021, 1.097448, -3.612741, 0.2666667, 1, 0, 1,
-0.5417718, 0.02694692, -3.314006, 0.2588235, 1, 0, 1,
-0.5383623, -0.5421798, -0.4303491, 0.254902, 1, 0, 1,
-0.5375503, -0.3025807, -1.963085, 0.2470588, 1, 0, 1,
-0.5369558, -1.15828, -4.291574, 0.2431373, 1, 0, 1,
-0.5299106, 0.7802564, -0.9917166, 0.2352941, 1, 0, 1,
-0.5258685, 1.627858, 0.7545794, 0.2313726, 1, 0, 1,
-0.5258051, -0.2973392, -2.265859, 0.2235294, 1, 0, 1,
-0.5244123, -0.803396, -4.799154, 0.2196078, 1, 0, 1,
-0.5173211, 0.180466, -2.190578, 0.2117647, 1, 0, 1,
-0.5172094, -1.379105, -1.999004, 0.2078431, 1, 0, 1,
-0.5156395, -1.14459, -2.24505, 0.2, 1, 0, 1,
-0.5099934, -0.038781, -0.1519824, 0.1921569, 1, 0, 1,
-0.5097296, -0.8328989, -1.691985, 0.1882353, 1, 0, 1,
-0.5058724, -1.42182, -2.348161, 0.1803922, 1, 0, 1,
-0.5032582, 0.5549828, -0.6921018, 0.1764706, 1, 0, 1,
-0.5031666, 0.651939, 0.3962959, 0.1686275, 1, 0, 1,
-0.5022343, -0.5530949, -1.973774, 0.1647059, 1, 0, 1,
-0.4661295, 0.4377971, -1.494889, 0.1568628, 1, 0, 1,
-0.4661261, -0.1753069, -1.806659, 0.1529412, 1, 0, 1,
-0.4641233, -1.186668, -2.294859, 0.145098, 1, 0, 1,
-0.4608377, 1.917088, 0.01185171, 0.1411765, 1, 0, 1,
-0.4604225, -0.4934002, -4.106984, 0.1333333, 1, 0, 1,
-0.4545115, -0.112669, -1.92929, 0.1294118, 1, 0, 1,
-0.4536452, -0.2097742, -2.706231, 0.1215686, 1, 0, 1,
-0.4531822, 2.934684, -0.3837818, 0.1176471, 1, 0, 1,
-0.45151, -1.491688, -3.323281, 0.1098039, 1, 0, 1,
-0.4514943, 0.1632105, -0.2903755, 0.1058824, 1, 0, 1,
-0.4486724, 0.800343, -0.6207097, 0.09803922, 1, 0, 1,
-0.4470926, 0.2560715, -0.1989585, 0.09019608, 1, 0, 1,
-0.445903, -1.17979, -3.090746, 0.08627451, 1, 0, 1,
-0.4455507, -0.8425437, -1.253262, 0.07843138, 1, 0, 1,
-0.4418965, 0.2003584, -1.795233, 0.07450981, 1, 0, 1,
-0.4408996, -1.201785, -1.119086, 0.06666667, 1, 0, 1,
-0.437351, -0.2833311, -0.8864653, 0.0627451, 1, 0, 1,
-0.435157, -2.139889, -3.839255, 0.05490196, 1, 0, 1,
-0.4342131, -1.809868, -1.300686, 0.05098039, 1, 0, 1,
-0.4272492, 0.09878907, -0.2809083, 0.04313726, 1, 0, 1,
-0.42662, -1.246525, -2.848395, 0.03921569, 1, 0, 1,
-0.4226449, 1.016395, -0.9845294, 0.03137255, 1, 0, 1,
-0.4210224, 0.5505639, -1.242595, 0.02745098, 1, 0, 1,
-0.4193417, -1.931249, -4.023737, 0.01960784, 1, 0, 1,
-0.4185927, -0.3528552, -2.125426, 0.01568628, 1, 0, 1,
-0.4147422, 1.899111, 0.08122309, 0.007843138, 1, 0, 1,
-0.4142947, 1.908831, 0.3424484, 0.003921569, 1, 0, 1,
-0.4137764, -1.137227, -1.011938, 0, 1, 0.003921569, 1,
-0.4136969, 1.198323, -1.151921, 0, 1, 0.01176471, 1,
-0.4107823, -0.2531499, -1.269436, 0, 1, 0.01568628, 1,
-0.4049833, 0.8287186, 0.004151805, 0, 1, 0.02352941, 1,
-0.4024796, -0.5965574, -2.546654, 0, 1, 0.02745098, 1,
-0.4020839, -0.225179, -1.700333, 0, 1, 0.03529412, 1,
-0.4005446, -0.304279, -4.073752, 0, 1, 0.03921569, 1,
-0.3987495, -0.4435727, -2.683502, 0, 1, 0.04705882, 1,
-0.3833529, -0.7387397, -1.984557, 0, 1, 0.05098039, 1,
-0.3828654, 0.2209557, -1.742283, 0, 1, 0.05882353, 1,
-0.3740648, -0.2952394, -2.557583, 0, 1, 0.0627451, 1,
-0.3717533, -0.5022022, -1.33224, 0, 1, 0.07058824, 1,
-0.3672696, -0.8168283, -4.012919, 0, 1, 0.07450981, 1,
-0.3653754, -0.2997973, -0.4813682, 0, 1, 0.08235294, 1,
-0.365215, -0.1530225, -0.511512, 0, 1, 0.08627451, 1,
-0.3607668, -0.3509314, -3.233372, 0, 1, 0.09411765, 1,
-0.3605818, 0.4615697, -1.574231, 0, 1, 0.1019608, 1,
-0.3600639, -1.412252, -1.419896, 0, 1, 0.1058824, 1,
-0.3571453, 0.001255755, -1.941651, 0, 1, 0.1137255, 1,
-0.3560557, 0.03131555, -0.6396655, 0, 1, 0.1176471, 1,
-0.3478207, -0.3449433, -1.429562, 0, 1, 0.1254902, 1,
-0.3466302, 0.5259942, -0.6918092, 0, 1, 0.1294118, 1,
-0.3433012, -0.8480045, -2.355971, 0, 1, 0.1372549, 1,
-0.3427729, 1.122558, 0.3188564, 0, 1, 0.1411765, 1,
-0.3359983, 0.5094499, -0.6973606, 0, 1, 0.1490196, 1,
-0.334349, -1.189527, -2.126142, 0, 1, 0.1529412, 1,
-0.3330866, 1.379424, -0.617671, 0, 1, 0.1607843, 1,
-0.3317055, 0.7164112, 0.7221684, 0, 1, 0.1647059, 1,
-0.3211849, 0.3123944, -0.04966231, 0, 1, 0.172549, 1,
-0.3152906, -1.057019, -1.56404, 0, 1, 0.1764706, 1,
-0.3136549, 0.06548969, -0.7397598, 0, 1, 0.1843137, 1,
-0.3095402, -0.1200492, -2.698143, 0, 1, 0.1882353, 1,
-0.3089729, -1.102292, -1.54197, 0, 1, 0.1960784, 1,
-0.3083028, 0.31523, -1.970833, 0, 1, 0.2039216, 1,
-0.3059604, -0.08373818, 0.3097239, 0, 1, 0.2078431, 1,
-0.304728, -0.681667, -1.011234, 0, 1, 0.2156863, 1,
-0.3026445, 0.8975508, 1.39873, 0, 1, 0.2196078, 1,
-0.3005057, -0.5585806, -2.627508, 0, 1, 0.227451, 1,
-0.2999397, 1.402897, 0.02904148, 0, 1, 0.2313726, 1,
-0.2953864, 0.4011837, -1.205972, 0, 1, 0.2392157, 1,
-0.2940983, 1.949314, 0.3393165, 0, 1, 0.2431373, 1,
-0.2936157, -0.8978432, -2.806074, 0, 1, 0.2509804, 1,
-0.2923996, 0.3744974, -1.988385, 0, 1, 0.254902, 1,
-0.2917185, 2.315666, 2.203263, 0, 1, 0.2627451, 1,
-0.2890463, -0.5892204, -2.296936, 0, 1, 0.2666667, 1,
-0.2886109, 1.441835, 0.02202186, 0, 1, 0.2745098, 1,
-0.2800726, 1.277995, -1.335957, 0, 1, 0.2784314, 1,
-0.2783583, -0.002151036, -1.142667, 0, 1, 0.2862745, 1,
-0.2764364, -2.132837, -3.955931, 0, 1, 0.2901961, 1,
-0.2713618, -0.6475953, -1.941571, 0, 1, 0.2980392, 1,
-0.2701846, -1.252585, -4.258735, 0, 1, 0.3058824, 1,
-0.2684257, 0.9282701, -1.325667, 0, 1, 0.3098039, 1,
-0.2580351, 0.4838947, 1.388415, 0, 1, 0.3176471, 1,
-0.2469129, 0.1456479, -0.4918055, 0, 1, 0.3215686, 1,
-0.2465798, -0.9716353, -3.383905, 0, 1, 0.3294118, 1,
-0.245813, 0.08766857, -0.9409761, 0, 1, 0.3333333, 1,
-0.2440552, -1.446469, -0.7572276, 0, 1, 0.3411765, 1,
-0.2430788, 0.5230142, -1.183524, 0, 1, 0.345098, 1,
-0.2407504, 0.2378167, 0.1109999, 0, 1, 0.3529412, 1,
-0.2403868, 0.3893914, -0.06308962, 0, 1, 0.3568628, 1,
-0.2402831, 0.7681384, -0.08199012, 0, 1, 0.3647059, 1,
-0.2357992, 0.8885811, -0.6946641, 0, 1, 0.3686275, 1,
-0.2314191, 0.8636866, -0.4126169, 0, 1, 0.3764706, 1,
-0.2199406, 1.145424, 0.4218151, 0, 1, 0.3803922, 1,
-0.2163861, -0.1236999, -2.948924, 0, 1, 0.3882353, 1,
-0.2152721, -0.1325998, -2.254316, 0, 1, 0.3921569, 1,
-0.2112014, -0.6267546, -3.525199, 0, 1, 0.4, 1,
-0.2089992, -0.266172, -3.958532, 0, 1, 0.4078431, 1,
-0.2079171, -0.7707781, -3.615542, 0, 1, 0.4117647, 1,
-0.2067292, 0.2662912, 0.4753138, 0, 1, 0.4196078, 1,
-0.2047003, -1.785184, -0.865279, 0, 1, 0.4235294, 1,
-0.2036858, -0.1862863, -2.791856, 0, 1, 0.4313726, 1,
-0.2023353, -0.2390396, -1.650256, 0, 1, 0.4352941, 1,
-0.2021642, -0.5608746, -3.824382, 0, 1, 0.4431373, 1,
-0.2005318, 1.039313, -1.153809, 0, 1, 0.4470588, 1,
-0.1990803, 0.2847153, -0.7024397, 0, 1, 0.454902, 1,
-0.1961111, -1.211694, -1.8923, 0, 1, 0.4588235, 1,
-0.1961104, -0.6499371, -3.858914, 0, 1, 0.4666667, 1,
-0.1943866, -1.339816, -5.04852, 0, 1, 0.4705882, 1,
-0.1913393, 0.5022438, -0.5274076, 0, 1, 0.4784314, 1,
-0.189296, -1.309245, -3.090534, 0, 1, 0.4823529, 1,
-0.1880292, -0.3117608, -3.265913, 0, 1, 0.4901961, 1,
-0.1859809, 0.05648325, -3.401894, 0, 1, 0.4941176, 1,
-0.1794841, 1.661609, 0.8291024, 0, 1, 0.5019608, 1,
-0.1791969, 0.8361479, -1.772029, 0, 1, 0.509804, 1,
-0.1779774, -0.2569974, -1.247409, 0, 1, 0.5137255, 1,
-0.1755273, -0.1787724, -1.859633, 0, 1, 0.5215687, 1,
-0.175279, -0.9795327, -3.516093, 0, 1, 0.5254902, 1,
-0.1646938, 0.4262195, -0.6942911, 0, 1, 0.5333334, 1,
-0.1565754, -0.03000928, -2.226782, 0, 1, 0.5372549, 1,
-0.1463859, -0.2703744, -0.8815866, 0, 1, 0.5450981, 1,
-0.145788, -0.7788166, -3.456187, 0, 1, 0.5490196, 1,
-0.1442858, 2.012454, -1.583321, 0, 1, 0.5568628, 1,
-0.1406898, 0.8571994, -0.03877009, 0, 1, 0.5607843, 1,
-0.1353984, 0.7185714, 0.003617945, 0, 1, 0.5686275, 1,
-0.1351782, 0.3774575, 0.5147886, 0, 1, 0.572549, 1,
-0.1319897, -0.7371902, -3.799172, 0, 1, 0.5803922, 1,
-0.1312637, 0.6848242, -0.1522137, 0, 1, 0.5843138, 1,
-0.1245447, 0.514502, 0.2113364, 0, 1, 0.5921569, 1,
-0.1237964, -0.3535325, -3.753485, 0, 1, 0.5960785, 1,
-0.1221624, -0.6929955, -2.919852, 0, 1, 0.6039216, 1,
-0.120968, 1.376142, -0.5676641, 0, 1, 0.6117647, 1,
-0.120779, -1.104847, -2.840098, 0, 1, 0.6156863, 1,
-0.1172638, -0.4152361, -2.666096, 0, 1, 0.6235294, 1,
-0.1160437, -1.111654, -3.12732, 0, 1, 0.627451, 1,
-0.1110129, 0.823288, -1.108211, 0, 1, 0.6352941, 1,
-0.1059272, 0.3125566, -1.20516, 0, 1, 0.6392157, 1,
-0.1009314, -0.6371595, -2.639811, 0, 1, 0.6470588, 1,
-0.1001758, -0.8748757, -2.649282, 0, 1, 0.6509804, 1,
-0.09863097, 1.133549, -0.1814276, 0, 1, 0.6588235, 1,
-0.09573779, -0.1367983, -0.7419444, 0, 1, 0.6627451, 1,
-0.09565839, 0.2238087, 0.3192788, 0, 1, 0.6705883, 1,
-0.09452172, -0.02651164, -1.392694, 0, 1, 0.6745098, 1,
-0.09184533, 0.8810028, 1.233125, 0, 1, 0.682353, 1,
-0.08972152, 0.1304865, -0.6576637, 0, 1, 0.6862745, 1,
-0.08456069, 1.455687, -0.468832, 0, 1, 0.6941177, 1,
-0.08396555, 0.2930088, -0.1840286, 0, 1, 0.7019608, 1,
-0.08144639, 0.3895442, -1.265021, 0, 1, 0.7058824, 1,
-0.0812843, -0.9224695, -4.078096, 0, 1, 0.7137255, 1,
-0.07744525, -0.0183913, -1.379964, 0, 1, 0.7176471, 1,
-0.07583198, -0.7787413, -1.958069, 0, 1, 0.7254902, 1,
-0.0757165, -0.9826513, -3.587475, 0, 1, 0.7294118, 1,
-0.07075982, -0.1628628, -2.547003, 0, 1, 0.7372549, 1,
-0.07063093, -1.083019, -4.207409, 0, 1, 0.7411765, 1,
-0.070608, 0.6355331, -1.585594, 0, 1, 0.7490196, 1,
-0.06988645, -1.462457, -2.732632, 0, 1, 0.7529412, 1,
-0.06791008, -1.13161, -3.124069, 0, 1, 0.7607843, 1,
-0.06447355, -2.907086, -3.094683, 0, 1, 0.7647059, 1,
-0.06110735, 0.7039661, -0.1603995, 0, 1, 0.772549, 1,
-0.06083646, 0.176822, -0.1954362, 0, 1, 0.7764706, 1,
-0.05904677, -1.562439, -2.966679, 0, 1, 0.7843137, 1,
-0.0589196, -0.2152966, -3.39463, 0, 1, 0.7882353, 1,
-0.05277678, -0.5716064, -3.017572, 0, 1, 0.7960784, 1,
-0.05169225, 0.1212547, 1.471777, 0, 1, 0.8039216, 1,
-0.04936568, 0.3660381, 0.6353841, 0, 1, 0.8078431, 1,
-0.04730104, -0.2330942, -2.372409, 0, 1, 0.8156863, 1,
-0.03963221, 0.0004984046, -2.927525, 0, 1, 0.8196079, 1,
-0.0349381, 1.70153, -0.07590403, 0, 1, 0.827451, 1,
-0.03485067, 0.5011985, 0.1868608, 0, 1, 0.8313726, 1,
-0.03377151, 0.2653134, -0.03695871, 0, 1, 0.8392157, 1,
-0.03208205, -1.670119, -2.87622, 0, 1, 0.8431373, 1,
-0.03206707, 1.79337, -1.332918, 0, 1, 0.8509804, 1,
-0.03149305, -0.04770466, -2.158529, 0, 1, 0.854902, 1,
-0.03135415, 0.9400309, -1.293351, 0, 1, 0.8627451, 1,
-0.02978642, 0.08239845, -0.9313133, 0, 1, 0.8666667, 1,
-0.02397009, 0.726366, -1.262762, 0, 1, 0.8745098, 1,
-0.02358732, 0.04600861, -0.5683188, 0, 1, 0.8784314, 1,
-0.02143514, -0.9381773, -2.166041, 0, 1, 0.8862745, 1,
-0.01952841, 0.7112198, 1.165368, 0, 1, 0.8901961, 1,
-0.01881297, 0.301377, 1.715381, 0, 1, 0.8980392, 1,
-0.01827655, 2.490692, -0.005738186, 0, 1, 0.9058824, 1,
-0.01197592, -0.3932253, -2.095903, 0, 1, 0.9098039, 1,
-0.01093088, 0.02803238, -0.7500186, 0, 1, 0.9176471, 1,
-0.01022063, 0.6278033, 0.6977339, 0, 1, 0.9215686, 1,
-0.009845164, 1.728416, 0.3522414, 0, 1, 0.9294118, 1,
-0.008056724, 0.1593833, 0.2149755, 0, 1, 0.9333333, 1,
-0.002889082, 2.092131, -2.090732, 0, 1, 0.9411765, 1,
-0.001907054, -0.1704312, -2.355938, 0, 1, 0.945098, 1,
0.00126382, -1.587767, 3.717507, 0, 1, 0.9529412, 1,
0.001977741, 0.1661676, 0.2979195, 0, 1, 0.9568627, 1,
0.003315801, -1.171425, 2.684283, 0, 1, 0.9647059, 1,
0.004936479, -2.830976, 3.885702, 0, 1, 0.9686275, 1,
0.008661231, 0.3608172, -0.2670402, 0, 1, 0.9764706, 1,
0.012724, -0.9918603, 2.215856, 0, 1, 0.9803922, 1,
0.01711803, -1.297689, 3.180759, 0, 1, 0.9882353, 1,
0.01770902, -0.2778147, 3.729369, 0, 1, 0.9921569, 1,
0.02927749, 0.8781136, -0.01461065, 0, 1, 1, 1,
0.02966918, 0.5591267, -0.8370663, 0, 0.9921569, 1, 1,
0.02991538, -0.7303216, 3.294284, 0, 0.9882353, 1, 1,
0.03579838, -0.01793536, 1.575498, 0, 0.9803922, 1, 1,
0.04149586, 0.8550884, 2.088767, 0, 0.9764706, 1, 1,
0.04574183, -1.757969, 2.842809, 0, 0.9686275, 1, 1,
0.04957934, -1.007777, 1.011693, 0, 0.9647059, 1, 1,
0.04960831, -0.3655755, 3.242696, 0, 0.9568627, 1, 1,
0.05190931, 0.1947486, -1.2141, 0, 0.9529412, 1, 1,
0.05229133, -0.9189786, 4.384753, 0, 0.945098, 1, 1,
0.05240436, -0.8613797, 4.019341, 0, 0.9411765, 1, 1,
0.05257154, 0.7331839, -1.2809, 0, 0.9333333, 1, 1,
0.05494659, 0.5161047, -2.218298, 0, 0.9294118, 1, 1,
0.05681054, 2.409011, 1.651736, 0, 0.9215686, 1, 1,
0.05717712, -0.7147887, 5.596444, 0, 0.9176471, 1, 1,
0.06003948, 0.9684705, -1.702522, 0, 0.9098039, 1, 1,
0.06099005, 2.377716, 0.649699, 0, 0.9058824, 1, 1,
0.06105567, -0.006355687, 2.587983, 0, 0.8980392, 1, 1,
0.06115045, 1.32334, -0.6929125, 0, 0.8901961, 1, 1,
0.07185508, -0.729457, 2.160423, 0, 0.8862745, 1, 1,
0.07208479, -0.7110462, 5.479593, 0, 0.8784314, 1, 1,
0.07437413, 1.513107, 0.6929566, 0, 0.8745098, 1, 1,
0.0747282, 2.255441, 0.7152348, 0, 0.8666667, 1, 1,
0.08320534, -0.6854495, 2.711039, 0, 0.8627451, 1, 1,
0.09095715, 0.8761955, -0.0185321, 0, 0.854902, 1, 1,
0.09232816, 0.4269782, 0.2717745, 0, 0.8509804, 1, 1,
0.09322668, -0.07372215, 1.023014, 0, 0.8431373, 1, 1,
0.09528293, -2.049037, 3.590217, 0, 0.8392157, 1, 1,
0.09884047, -0.02952825, 2.40013, 0, 0.8313726, 1, 1,
0.1011029, -0.2809974, 0.8157177, 0, 0.827451, 1, 1,
0.1013053, 1.050415, -0.5621213, 0, 0.8196079, 1, 1,
0.1017454, 0.7564498, 0.187627, 0, 0.8156863, 1, 1,
0.1047554, 0.8173686, -1.138918, 0, 0.8078431, 1, 1,
0.1054955, -0.1997177, 3.068739, 0, 0.8039216, 1, 1,
0.1065121, -1.16845, 2.665144, 0, 0.7960784, 1, 1,
0.1078344, -0.9936737, 4.301129, 0, 0.7882353, 1, 1,
0.1082914, -0.8907338, 1.985559, 0, 0.7843137, 1, 1,
0.1084161, -1.445259, 2.832143, 0, 0.7764706, 1, 1,
0.1145052, -0.4104387, 1.403937, 0, 0.772549, 1, 1,
0.1172521, -0.4505691, 1.695903, 0, 0.7647059, 1, 1,
0.118368, 0.264218, 0.7527593, 0, 0.7607843, 1, 1,
0.121557, -0.4184881, 3.432423, 0, 0.7529412, 1, 1,
0.1232878, -1.06634, 2.666622, 0, 0.7490196, 1, 1,
0.1294613, -1.430506, 4.351763, 0, 0.7411765, 1, 1,
0.1349597, -1.952037, 3.554636, 0, 0.7372549, 1, 1,
0.1393958, 0.5909157, -1.082031, 0, 0.7294118, 1, 1,
0.1434099, 1.139215, 0.6315679, 0, 0.7254902, 1, 1,
0.1446037, 0.6667717, 0.6423628, 0, 0.7176471, 1, 1,
0.1496592, 0.3580942, 1.532309, 0, 0.7137255, 1, 1,
0.1499577, -1.413079, 3.662569, 0, 0.7058824, 1, 1,
0.1573049, -1.402928, 3.248784, 0, 0.6980392, 1, 1,
0.1589893, -1.227741, 3.646284, 0, 0.6941177, 1, 1,
0.1609129, 0.04174201, 0.2261467, 0, 0.6862745, 1, 1,
0.1676444, 0.1513551, 0.6188254, 0, 0.682353, 1, 1,
0.1751387, 0.2181147, 0.587701, 0, 0.6745098, 1, 1,
0.1797993, -0.1269389, 1.18939, 0, 0.6705883, 1, 1,
0.1856881, 0.860693, 2.75102, 0, 0.6627451, 1, 1,
0.1865697, -0.6420932, 3.308421, 0, 0.6588235, 1, 1,
0.1868403, -2.498749, 3.168018, 0, 0.6509804, 1, 1,
0.1894522, 1.671123, -0.09051589, 0, 0.6470588, 1, 1,
0.1957292, -0.3976147, 4.914006, 0, 0.6392157, 1, 1,
0.196549, 0.0472279, 1.65943, 0, 0.6352941, 1, 1,
0.1997862, 0.7314931, -0.6841782, 0, 0.627451, 1, 1,
0.2006782, -0.7296605, 5.812888, 0, 0.6235294, 1, 1,
0.2045426, -0.3678119, 3.31913, 0, 0.6156863, 1, 1,
0.2095185, -0.5951793, 5.388369, 0, 0.6117647, 1, 1,
0.213403, 2.043241, -0.305353, 0, 0.6039216, 1, 1,
0.2170572, 1.363316, -0.5922678, 0, 0.5960785, 1, 1,
0.2181827, 0.2097654, 2.071749, 0, 0.5921569, 1, 1,
0.2221333, 0.2484025, 1.266474, 0, 0.5843138, 1, 1,
0.2221463, 1.270572, 1.870462, 0, 0.5803922, 1, 1,
0.2235098, 0.357433, -1.738298, 0, 0.572549, 1, 1,
0.2268881, -1.129327, 3.904856, 0, 0.5686275, 1, 1,
0.2273556, 0.3182177, 0.8159732, 0, 0.5607843, 1, 1,
0.2277649, -1.518733, 1.472749, 0, 0.5568628, 1, 1,
0.228469, -0.3629196, 3.096303, 0, 0.5490196, 1, 1,
0.2289991, -1.325204, 2.656417, 0, 0.5450981, 1, 1,
0.2300246, -0.2599343, 2.357236, 0, 0.5372549, 1, 1,
0.2304408, 1.158935, -0.0474087, 0, 0.5333334, 1, 1,
0.231811, 0.5432943, -1.527072, 0, 0.5254902, 1, 1,
0.2417787, 1.489231, -0.3793748, 0, 0.5215687, 1, 1,
0.2492741, 0.1585712, -0.8955085, 0, 0.5137255, 1, 1,
0.2494354, -0.2871483, 2.128637, 0, 0.509804, 1, 1,
0.2499116, 0.4204703, -0.1401175, 0, 0.5019608, 1, 1,
0.250538, 1.34339, 0.8916578, 0, 0.4941176, 1, 1,
0.2516193, 0.8417624, -0.4868883, 0, 0.4901961, 1, 1,
0.2538516, -1.077545, 3.785519, 0, 0.4823529, 1, 1,
0.2541864, 1.256746, 1.262192, 0, 0.4784314, 1, 1,
0.2585021, 0.3891152, -0.8572106, 0, 0.4705882, 1, 1,
0.2635479, 0.4074237, -0.1431261, 0, 0.4666667, 1, 1,
0.265206, 1.004051, -2.022845, 0, 0.4588235, 1, 1,
0.2682858, 0.1459766, 0.9762353, 0, 0.454902, 1, 1,
0.2729405, 0.549967, 0.5140641, 0, 0.4470588, 1, 1,
0.2762044, -0.6548998, 2.800696, 0, 0.4431373, 1, 1,
0.2778501, -0.1254102, 2.728415, 0, 0.4352941, 1, 1,
0.2805298, -0.9962716, 3.291394, 0, 0.4313726, 1, 1,
0.2815967, -0.9648744, 1.694131, 0, 0.4235294, 1, 1,
0.2849633, -0.1078411, 1.971589, 0, 0.4196078, 1, 1,
0.289029, 0.6326235, 1.19846, 0, 0.4117647, 1, 1,
0.295079, 0.551043, -0.7880183, 0, 0.4078431, 1, 1,
0.2951992, -1.912638, 2.560988, 0, 0.4, 1, 1,
0.2977225, -1.883047, 1.978042, 0, 0.3921569, 1, 1,
0.2990647, 0.2146233, 0.8909004, 0, 0.3882353, 1, 1,
0.3138679, 1.498389, 0.2093145, 0, 0.3803922, 1, 1,
0.3188208, 1.555939, 1.166824, 0, 0.3764706, 1, 1,
0.3240395, 0.70079, 1.476301, 0, 0.3686275, 1, 1,
0.3249776, 2.057109, -0.4020979, 0, 0.3647059, 1, 1,
0.3271495, 0.9470148, 1.969925, 0, 0.3568628, 1, 1,
0.33033, -0.8004572, 3.060789, 0, 0.3529412, 1, 1,
0.3310713, -0.7785975, 3.724857, 0, 0.345098, 1, 1,
0.3338383, 0.7082413, 1.508618, 0, 0.3411765, 1, 1,
0.3410363, -0.4244677, 4.260328, 0, 0.3333333, 1, 1,
0.3416693, 0.1155269, 1.70823, 0, 0.3294118, 1, 1,
0.3442757, 0.3555259, 0.3420612, 0, 0.3215686, 1, 1,
0.3447241, 0.8784897, -1.26066, 0, 0.3176471, 1, 1,
0.3478785, 0.8417014, 2.27138, 0, 0.3098039, 1, 1,
0.3557468, 1.75291, 2.454799, 0, 0.3058824, 1, 1,
0.3579229, -0.2256903, 3.501905, 0, 0.2980392, 1, 1,
0.3582157, 0.6376013, -0.5432689, 0, 0.2901961, 1, 1,
0.3607418, -0.1194131, 2.034607, 0, 0.2862745, 1, 1,
0.3641796, -0.931549, 3.549702, 0, 0.2784314, 1, 1,
0.3664529, 0.1766561, 1.414413, 0, 0.2745098, 1, 1,
0.3696515, -1.078111, 2.459605, 0, 0.2666667, 1, 1,
0.3698321, 0.0678477, 1.002234, 0, 0.2627451, 1, 1,
0.3700503, -0.7262596, 1.875198, 0, 0.254902, 1, 1,
0.37085, 2.036508, 0.2886846, 0, 0.2509804, 1, 1,
0.3755193, 0.9288393, 0.6493272, 0, 0.2431373, 1, 1,
0.3759352, -0.8778277, 5.050086, 0, 0.2392157, 1, 1,
0.3785922, 0.2891497, 1.062822, 0, 0.2313726, 1, 1,
0.3810017, 0.927747, -0.493827, 0, 0.227451, 1, 1,
0.3812712, -1.654939, 1.31953, 0, 0.2196078, 1, 1,
0.3865106, 1.75651, 1.771001, 0, 0.2156863, 1, 1,
0.3998258, -0.6910883, 3.301458, 0, 0.2078431, 1, 1,
0.401014, -0.3625267, 2.055435, 0, 0.2039216, 1, 1,
0.403172, -0.6712719, 3.68195, 0, 0.1960784, 1, 1,
0.4132282, -1.47711, 2.67253, 0, 0.1882353, 1, 1,
0.4169029, 1.440466, 1.368231, 0, 0.1843137, 1, 1,
0.4175383, -0.9773487, 1.956635, 0, 0.1764706, 1, 1,
0.4198314, 0.06392694, 0.9410403, 0, 0.172549, 1, 1,
0.4206893, 1.626549, 0.5192283, 0, 0.1647059, 1, 1,
0.4216691, 0.8507078, 0.8242539, 0, 0.1607843, 1, 1,
0.4217157, -0.7359861, 2.16031, 0, 0.1529412, 1, 1,
0.4236307, -1.326198, 1.751057, 0, 0.1490196, 1, 1,
0.4271597, 1.507153, 0.7397619, 0, 0.1411765, 1, 1,
0.4311837, 0.6989065, 0.8331937, 0, 0.1372549, 1, 1,
0.4314409, -0.2138592, 2.755681, 0, 0.1294118, 1, 1,
0.4352607, 0.813408, 0.4949565, 0, 0.1254902, 1, 1,
0.4401036, 0.9117438, 0.7217292, 0, 0.1176471, 1, 1,
0.4418591, -0.01767485, 1.383825, 0, 0.1137255, 1, 1,
0.44224, 0.6735904, 2.700851, 0, 0.1058824, 1, 1,
0.4438361, 0.7034049, 1.017877, 0, 0.09803922, 1, 1,
0.4439667, 0.269816, 1.136425, 0, 0.09411765, 1, 1,
0.4448119, -0.1551452, 2.754011, 0, 0.08627451, 1, 1,
0.4476154, 0.5613983, 2.169344, 0, 0.08235294, 1, 1,
0.4478101, -1.080314, 1.198056, 0, 0.07450981, 1, 1,
0.4506896, -1.966277, 0.06426336, 0, 0.07058824, 1, 1,
0.450847, 0.6469377, -0.7986181, 0, 0.0627451, 1, 1,
0.4516684, -1.582787, 2.002209, 0, 0.05882353, 1, 1,
0.4550918, 0.3645389, 0.7701607, 0, 0.05098039, 1, 1,
0.4584899, 0.5159931, 0.0363603, 0, 0.04705882, 1, 1,
0.4612696, 0.2749497, -1.236644, 0, 0.03921569, 1, 1,
0.4614791, -2.549777, 3.372071, 0, 0.03529412, 1, 1,
0.4645626, 1.370737, 0.5734203, 0, 0.02745098, 1, 1,
0.464661, 1.865634, 0.965149, 0, 0.02352941, 1, 1,
0.4668102, 0.1481988, 0.5218392, 0, 0.01568628, 1, 1,
0.475722, -1.265687, 2.714182, 0, 0.01176471, 1, 1,
0.4758725, -0.9289947, 2.280876, 0, 0.003921569, 1, 1,
0.4759237, 1.430726, -1.045615, 0.003921569, 0, 1, 1,
0.4763879, -0.5130205, 1.46937, 0.007843138, 0, 1, 1,
0.4784425, -0.05642675, 1.971476, 0.01568628, 0, 1, 1,
0.4784625, -0.6152402, 2.601856, 0.01960784, 0, 1, 1,
0.48016, 0.6117807, 2.179527, 0.02745098, 0, 1, 1,
0.4803339, 0.7025533, -0.1498634, 0.03137255, 0, 1, 1,
0.4821543, 1.175917, 1.002608, 0.03921569, 0, 1, 1,
0.4856725, 0.829381, -0.02653956, 0.04313726, 0, 1, 1,
0.4905268, 0.3363248, 1.806878, 0.05098039, 0, 1, 1,
0.4919218, -0.5537502, 2.321724, 0.05490196, 0, 1, 1,
0.4934051, -0.07871328, 0.686824, 0.0627451, 0, 1, 1,
0.5017443, 0.2384897, 0.7985229, 0.06666667, 0, 1, 1,
0.5063147, 1.12769, -0.6800124, 0.07450981, 0, 1, 1,
0.508065, 0.245375, 2.051271, 0.07843138, 0, 1, 1,
0.5086306, -0.6965999, 3.071419, 0.08627451, 0, 1, 1,
0.5090457, 0.5218925, 2.585256, 0.09019608, 0, 1, 1,
0.5127347, -0.8391531, 2.452058, 0.09803922, 0, 1, 1,
0.5203906, -0.4705308, 1.444821, 0.1058824, 0, 1, 1,
0.5232881, 0.1549061, 3.274427, 0.1098039, 0, 1, 1,
0.5238345, -0.8890212, 2.465887, 0.1176471, 0, 1, 1,
0.5292604, 0.5077835, 0.1595716, 0.1215686, 0, 1, 1,
0.5300319, -0.5516972, 2.028907, 0.1294118, 0, 1, 1,
0.5321708, 0.379534, 0.4185275, 0.1333333, 0, 1, 1,
0.5360425, -0.7318257, 2.043293, 0.1411765, 0, 1, 1,
0.5376043, 0.7603252, -0.2815215, 0.145098, 0, 1, 1,
0.5385204, -1.981515, 2.005407, 0.1529412, 0, 1, 1,
0.5428911, 0.6583762, 0.4243461, 0.1568628, 0, 1, 1,
0.5456809, 0.2337806, 1.728288, 0.1647059, 0, 1, 1,
0.5469111, -0.3521297, 2.023415, 0.1686275, 0, 1, 1,
0.5485196, -0.08815102, 2.399649, 0.1764706, 0, 1, 1,
0.5528316, 0.7800962, -0.338697, 0.1803922, 0, 1, 1,
0.5542948, -0.197938, 2.750572, 0.1882353, 0, 1, 1,
0.5578703, 0.7556018, 2.095942, 0.1921569, 0, 1, 1,
0.5586008, -0.3157145, 2.518228, 0.2, 0, 1, 1,
0.5617353, -0.3077098, 2.040475, 0.2078431, 0, 1, 1,
0.5662285, -0.3222301, 1.127568, 0.2117647, 0, 1, 1,
0.5672628, 0.189168, 1.655659, 0.2196078, 0, 1, 1,
0.5706194, -0.7085438, 4.318241, 0.2235294, 0, 1, 1,
0.5724302, 1.262543, -0.362851, 0.2313726, 0, 1, 1,
0.57267, -0.5949208, 0.666578, 0.2352941, 0, 1, 1,
0.5735515, 1.370841, 0.6737622, 0.2431373, 0, 1, 1,
0.5752507, -0.5540901, -0.02429164, 0.2470588, 0, 1, 1,
0.5770348, 1.770091, 1.778115, 0.254902, 0, 1, 1,
0.5773577, -1.051945, 2.334969, 0.2588235, 0, 1, 1,
0.5867892, 0.3120872, -0.387094, 0.2666667, 0, 1, 1,
0.5886247, -0.09579781, 1.719073, 0.2705882, 0, 1, 1,
0.5953364, -0.8207818, 3.846206, 0.2784314, 0, 1, 1,
0.5984328, 2.144817, 1.305597, 0.282353, 0, 1, 1,
0.6017531, -1.93125, 3.087316, 0.2901961, 0, 1, 1,
0.6033527, -0.319987, 2.479575, 0.2941177, 0, 1, 1,
0.6069546, -0.6087384, 2.577491, 0.3019608, 0, 1, 1,
0.6100636, 0.1342568, 0.4881722, 0.3098039, 0, 1, 1,
0.6119732, -0.6060079, 3.386858, 0.3137255, 0, 1, 1,
0.6149943, 0.1072549, 1.920936, 0.3215686, 0, 1, 1,
0.6157035, 1.363165, 1.431949, 0.3254902, 0, 1, 1,
0.6158855, -0.2123381, 1.136394, 0.3333333, 0, 1, 1,
0.6245025, -0.3105067, 0.6208512, 0.3372549, 0, 1, 1,
0.6255107, 0.5039497, 1.381843, 0.345098, 0, 1, 1,
0.625513, 0.4524387, 1.121209, 0.3490196, 0, 1, 1,
0.6301779, 0.7559029, 0.7772914, 0.3568628, 0, 1, 1,
0.6307835, 0.3907196, 0.03092153, 0.3607843, 0, 1, 1,
0.6309724, 1.907476, -2.193117, 0.3686275, 0, 1, 1,
0.6369195, -0.3165757, 1.989772, 0.372549, 0, 1, 1,
0.6397253, 0.3121533, 1.330074, 0.3803922, 0, 1, 1,
0.6414823, 0.2214035, 2.484944, 0.3843137, 0, 1, 1,
0.642932, -0.8313903, 2.981651, 0.3921569, 0, 1, 1,
0.647454, 0.8907702, 1.807466, 0.3960784, 0, 1, 1,
0.6494934, -0.1709434, 3.124527, 0.4039216, 0, 1, 1,
0.6502628, 0.6268749, 1.696486, 0.4117647, 0, 1, 1,
0.653156, -0.07706352, 1.489447, 0.4156863, 0, 1, 1,
0.6562911, -1.275094, 2.440331, 0.4235294, 0, 1, 1,
0.6676618, -1.058843, 3.020001, 0.427451, 0, 1, 1,
0.6692818, -1.418839, 3.385783, 0.4352941, 0, 1, 1,
0.6694988, 0.1662593, 1.449077, 0.4392157, 0, 1, 1,
0.6708866, -0.4242329, 1.614581, 0.4470588, 0, 1, 1,
0.6873155, 0.7536992, -0.3585917, 0.4509804, 0, 1, 1,
0.6894136, 0.2870776, 1.64214, 0.4588235, 0, 1, 1,
0.7031034, -0.335576, 0.7865161, 0.4627451, 0, 1, 1,
0.7063551, 0.5682523, 0.1747805, 0.4705882, 0, 1, 1,
0.7076922, -1.254305, 2.884624, 0.4745098, 0, 1, 1,
0.710009, -0.3409126, 1.436167, 0.4823529, 0, 1, 1,
0.712303, -0.211701, 1.542898, 0.4862745, 0, 1, 1,
0.7329386, -1.172601, 1.041609, 0.4941176, 0, 1, 1,
0.7330144, 0.06263305, 2.239555, 0.5019608, 0, 1, 1,
0.7361644, 0.7207562, -1.340644, 0.5058824, 0, 1, 1,
0.7363397, 1.010165, 0.3739888, 0.5137255, 0, 1, 1,
0.737593, 0.8298491, 0.2692396, 0.5176471, 0, 1, 1,
0.7388725, 1.386784, 0.1380424, 0.5254902, 0, 1, 1,
0.7485307, 0.2761348, 0.9282313, 0.5294118, 0, 1, 1,
0.7539077, 0.7898712, -0.03431747, 0.5372549, 0, 1, 1,
0.7603689, 1.423988, 1.976148, 0.5411765, 0, 1, 1,
0.7645394, 0.2661345, 3.254525, 0.5490196, 0, 1, 1,
0.7672753, 0.6917374, 1.023904, 0.5529412, 0, 1, 1,
0.7674044, 0.3967252, 0.7619194, 0.5607843, 0, 1, 1,
0.7684889, 0.9159911, 0.7538192, 0.5647059, 0, 1, 1,
0.773825, 1.006999, 0.4605834, 0.572549, 0, 1, 1,
0.7752059, 0.6865357, -0.14817, 0.5764706, 0, 1, 1,
0.7752567, -2.003281, 2.186717, 0.5843138, 0, 1, 1,
0.7777871, -1.079166, 2.968364, 0.5882353, 0, 1, 1,
0.7833117, -1.140731, 1.825723, 0.5960785, 0, 1, 1,
0.7891964, 1.527835, 0.5648403, 0.6039216, 0, 1, 1,
0.7903051, -0.1158239, 1.927554, 0.6078432, 0, 1, 1,
0.7918697, 0.4064313, 0.476439, 0.6156863, 0, 1, 1,
0.7924892, 1.119752, 0.5730497, 0.6196079, 0, 1, 1,
0.7939232, 0.3739956, 2.489153, 0.627451, 0, 1, 1,
0.8003214, -0.3888836, 2.811453, 0.6313726, 0, 1, 1,
0.8034443, -0.1137639, 1.372554, 0.6392157, 0, 1, 1,
0.8053364, 1.152061, 0.5898177, 0.6431373, 0, 1, 1,
0.8186153, 1.77598, 1.572274, 0.6509804, 0, 1, 1,
0.8227434, -0.3398795, 1.590449, 0.654902, 0, 1, 1,
0.8245478, 1.646976, -0.7010023, 0.6627451, 0, 1, 1,
0.8267747, 1.508232, -0.5723906, 0.6666667, 0, 1, 1,
0.8275312, 1.668389, -0.6192977, 0.6745098, 0, 1, 1,
0.8284748, 1.080817, 0.8881772, 0.6784314, 0, 1, 1,
0.8314142, 0.7670307, 0.2457311, 0.6862745, 0, 1, 1,
0.8337095, 0.6907632, 1.020615, 0.6901961, 0, 1, 1,
0.8344082, -0.5809983, 1.128269, 0.6980392, 0, 1, 1,
0.8402265, 0.6136197, 0.7600893, 0.7058824, 0, 1, 1,
0.8498451, -1.144393, 2.742332, 0.7098039, 0, 1, 1,
0.8529248, 0.8003898, 0.9615611, 0.7176471, 0, 1, 1,
0.8574386, 1.366298, -0.08445737, 0.7215686, 0, 1, 1,
0.8600999, -0.410039, 0.5175099, 0.7294118, 0, 1, 1,
0.8617992, -0.1727627, 2.510471, 0.7333333, 0, 1, 1,
0.8701713, 0.4642186, 1.259376, 0.7411765, 0, 1, 1,
0.87252, 0.05995633, 1.195564, 0.7450981, 0, 1, 1,
0.8743759, -0.4339451, 3.317994, 0.7529412, 0, 1, 1,
0.875446, 0.8496861, 2.05668, 0.7568628, 0, 1, 1,
0.875484, -0.5088225, 0.8684697, 0.7647059, 0, 1, 1,
0.8785013, 0.1205162, 0.717362, 0.7686275, 0, 1, 1,
0.880002, 1.373578, -0.7608961, 0.7764706, 0, 1, 1,
0.8806469, 0.0737858, 3.006085, 0.7803922, 0, 1, 1,
0.8830543, 0.6704514, 0.9485634, 0.7882353, 0, 1, 1,
0.8972046, 0.2957889, 0.3952373, 0.7921569, 0, 1, 1,
0.8984382, 3.259162, 0.8690925, 0.8, 0, 1, 1,
0.8991669, 0.1008418, 1.548169, 0.8078431, 0, 1, 1,
0.9065512, 0.1402582, 0.8766738, 0.8117647, 0, 1, 1,
0.9076741, -0.2769196, 1.734488, 0.8196079, 0, 1, 1,
0.9129556, 0.8259861, 1.038192, 0.8235294, 0, 1, 1,
0.9138139, -1.06285, 2.932433, 0.8313726, 0, 1, 1,
0.9202143, -0.7543995, 3.585656, 0.8352941, 0, 1, 1,
0.9228876, -0.6354151, 0.6102106, 0.8431373, 0, 1, 1,
0.9251176, -0.464609, 2.689819, 0.8470588, 0, 1, 1,
0.9310294, 0.6413785, 1.056176, 0.854902, 0, 1, 1,
0.9331703, 0.3605009, 0.3188032, 0.8588235, 0, 1, 1,
0.9406358, 0.9452822, 2.370961, 0.8666667, 0, 1, 1,
0.9456834, -0.8853382, 2.902562, 0.8705882, 0, 1, 1,
0.9474161, -0.2870093, 1.835235, 0.8784314, 0, 1, 1,
0.9500687, 0.1905525, 1.252228, 0.8823529, 0, 1, 1,
0.9588982, -0.6547288, 4.063824, 0.8901961, 0, 1, 1,
0.9667739, 0.3392739, 1.269101, 0.8941177, 0, 1, 1,
0.9673707, 0.256669, 1.448944, 0.9019608, 0, 1, 1,
0.9740885, 1.515835, 1.197016, 0.9098039, 0, 1, 1,
0.9750608, -2.510432, 3.205598, 0.9137255, 0, 1, 1,
0.9764446, -0.2979397, 0.9863957, 0.9215686, 0, 1, 1,
0.9812487, 1.323139, 0.4645437, 0.9254902, 0, 1, 1,
0.9828955, -1.178487, 3.684233, 0.9333333, 0, 1, 1,
0.9840668, 0.677963, 1.963048, 0.9372549, 0, 1, 1,
0.9947717, -1.695592, 1.648244, 0.945098, 0, 1, 1,
0.9981201, 0.8128259, 1.004732, 0.9490196, 0, 1, 1,
0.9983172, 0.005671979, 1.92221, 0.9568627, 0, 1, 1,
1.000439, -0.4960774, 2.49673, 0.9607843, 0, 1, 1,
1.00149, 1.044321, 0.5355017, 0.9686275, 0, 1, 1,
1.008991, -0.02697321, 1.388631, 0.972549, 0, 1, 1,
1.015491, -1.216092, 3.298139, 0.9803922, 0, 1, 1,
1.016863, 0.6629002, 1.401162, 0.9843137, 0, 1, 1,
1.018283, -0.1390186, 0.6986061, 0.9921569, 0, 1, 1,
1.022095, 0.9141908, 0.9681777, 0.9960784, 0, 1, 1,
1.023126, 0.3882057, 0.1174602, 1, 0, 0.9960784, 1,
1.024187, 1.289696, 0.4358315, 1, 0, 0.9882353, 1,
1.033062, 1.297839, 3.49577, 1, 0, 0.9843137, 1,
1.036911, -0.2514684, 1.111081, 1, 0, 0.9764706, 1,
1.041186, -2.015377, 2.352631, 1, 0, 0.972549, 1,
1.045413, 0.9111799, 1.196074, 1, 0, 0.9647059, 1,
1.048209, 1.693894, 3.711283, 1, 0, 0.9607843, 1,
1.054618, 1.305769, 1.934365, 1, 0, 0.9529412, 1,
1.059345, -2.362069, 0.9302214, 1, 0, 0.9490196, 1,
1.061571, -0.3995244, 0.9478857, 1, 0, 0.9411765, 1,
1.062579, -1.948251, 1.875916, 1, 0, 0.9372549, 1,
1.065048, -1.682508, 0.5111933, 1, 0, 0.9294118, 1,
1.08481, 0.9535616, 1.167344, 1, 0, 0.9254902, 1,
1.094151, -0.4156703, 1.919805, 1, 0, 0.9176471, 1,
1.09516, 0.3699659, 1.597422, 1, 0, 0.9137255, 1,
1.098292, -0.2692748, 1.456118, 1, 0, 0.9058824, 1,
1.100817, -0.2559949, 0.126848, 1, 0, 0.9019608, 1,
1.102911, 1.736236, 0.09857203, 1, 0, 0.8941177, 1,
1.105358, -0.182081, 1.392904, 1, 0, 0.8862745, 1,
1.108601, -0.04154566, 0.9835357, 1, 0, 0.8823529, 1,
1.112672, -0.3194865, 2.385012, 1, 0, 0.8745098, 1,
1.116598, 0.6479899, 2.359912, 1, 0, 0.8705882, 1,
1.120755, -0.683707, 0.8600062, 1, 0, 0.8627451, 1,
1.130155, -1.38324, 3.354003, 1, 0, 0.8588235, 1,
1.130597, -0.03961972, 0.5522636, 1, 0, 0.8509804, 1,
1.136627, 2.798795, 0.2256717, 1, 0, 0.8470588, 1,
1.136696, 0.5150931, -1.382808, 1, 0, 0.8392157, 1,
1.144291, -1.028383, 0.6266885, 1, 0, 0.8352941, 1,
1.14678, 1.749932, 0.6081845, 1, 0, 0.827451, 1,
1.147243, 0.5269359, 0.2119648, 1, 0, 0.8235294, 1,
1.148956, 0.8932495, 2.024881, 1, 0, 0.8156863, 1,
1.155202, 0.6021849, 1.598614, 1, 0, 0.8117647, 1,
1.159318, -0.8538207, 2.75355, 1, 0, 0.8039216, 1,
1.160038, -0.6832399, 1.114805, 1, 0, 0.7960784, 1,
1.170294, 0.7309145, 0.4169796, 1, 0, 0.7921569, 1,
1.171536, -0.2982371, 0.04989742, 1, 0, 0.7843137, 1,
1.177734, -2.300184, 2.079269, 1, 0, 0.7803922, 1,
1.183885, -1.876967, 3.266095, 1, 0, 0.772549, 1,
1.185429, 0.04326126, 2.923376, 1, 0, 0.7686275, 1,
1.189865, -0.7525387, 2.013386, 1, 0, 0.7607843, 1,
1.194856, 0.06227997, 0.5334639, 1, 0, 0.7568628, 1,
1.199346, 0.2641609, 1.542171, 1, 0, 0.7490196, 1,
1.238918, -0.9116941, -0.1192403, 1, 0, 0.7450981, 1,
1.23955, -1.110961, 2.5301, 1, 0, 0.7372549, 1,
1.240345, 0.9597824, 0.4996226, 1, 0, 0.7333333, 1,
1.243636, -1.200558, 0.4464743, 1, 0, 0.7254902, 1,
1.244209, -0.3071909, 3.261108, 1, 0, 0.7215686, 1,
1.24591, 0.5415258, 0.1908156, 1, 0, 0.7137255, 1,
1.246031, 0.9399117, 1.093828, 1, 0, 0.7098039, 1,
1.251573, 1.13186, 0.3592074, 1, 0, 0.7019608, 1,
1.251914, -1.544154, 2.168002, 1, 0, 0.6941177, 1,
1.258157, -1.30238, 1.923322, 1, 0, 0.6901961, 1,
1.263573, 1.509958, 2.008795, 1, 0, 0.682353, 1,
1.269175, -0.1248093, 1.596809, 1, 0, 0.6784314, 1,
1.277529, -1.511399, 2.933426, 1, 0, 0.6705883, 1,
1.285138, 0.1984009, 0.449376, 1, 0, 0.6666667, 1,
1.292782, -0.1831438, 3.361955, 1, 0, 0.6588235, 1,
1.293261, 0.8710449, -0.747724, 1, 0, 0.654902, 1,
1.300324, 3.168801, -0.2807147, 1, 0, 0.6470588, 1,
1.305538, -0.7817863, 2.621721, 1, 0, 0.6431373, 1,
1.308578, -2.125867, 3.523662, 1, 0, 0.6352941, 1,
1.308661, -0.7904583, 2.726263, 1, 0, 0.6313726, 1,
1.313286, 0.5627512, 0.5217285, 1, 0, 0.6235294, 1,
1.314145, -0.529213, 1.401222, 1, 0, 0.6196079, 1,
1.318544, 0.4709568, 2.537473, 1, 0, 0.6117647, 1,
1.329182, -2.259384, 4.467266, 1, 0, 0.6078432, 1,
1.337938, -0.4568487, -0.03364725, 1, 0, 0.6, 1,
1.339673, 0.2018475, 1.700246, 1, 0, 0.5921569, 1,
1.339808, 0.01187752, 1.349437, 1, 0, 0.5882353, 1,
1.344034, -0.6719544, 1.645171, 1, 0, 0.5803922, 1,
1.350751, 0.4044321, 0.3416874, 1, 0, 0.5764706, 1,
1.35528, 0.6504018, 0.4412698, 1, 0, 0.5686275, 1,
1.360062, -0.8935128, 0.8917699, 1, 0, 0.5647059, 1,
1.376294, 1.894884, -0.8188236, 1, 0, 0.5568628, 1,
1.39854, -1.233121, 3.679011, 1, 0, 0.5529412, 1,
1.402721, 1.685972, 1.589912, 1, 0, 0.5450981, 1,
1.4037, -1.430684, 1.68761, 1, 0, 0.5411765, 1,
1.414226, -0.4206816, 1.474249, 1, 0, 0.5333334, 1,
1.436249, -1.201252, 2.889094, 1, 0, 0.5294118, 1,
1.442276, 0.249751, 2.847411, 1, 0, 0.5215687, 1,
1.459791, 0.749484, 2.23097, 1, 0, 0.5176471, 1,
1.464611, 0.3526472, 1.989039, 1, 0, 0.509804, 1,
1.492616, 1.0979, -0.9860609, 1, 0, 0.5058824, 1,
1.520608, -0.6880074, 2.348728, 1, 0, 0.4980392, 1,
1.531062, -0.1487225, 0.1031482, 1, 0, 0.4901961, 1,
1.557483, -0.3514763, 3.111333, 1, 0, 0.4862745, 1,
1.564289, 2.511636, -1.585255, 1, 0, 0.4784314, 1,
1.565521, 0.348798, -0.0224102, 1, 0, 0.4745098, 1,
1.575382, -0.4133923, -0.2606492, 1, 0, 0.4666667, 1,
1.579469, 0.3779615, 1.941579, 1, 0, 0.4627451, 1,
1.580413, 1.304071, 1.527002, 1, 0, 0.454902, 1,
1.591956, -0.6271208, 2.068396, 1, 0, 0.4509804, 1,
1.592607, 0.7671685, 2.042456, 1, 0, 0.4431373, 1,
1.593767, 0.1596667, 1.939796, 1, 0, 0.4392157, 1,
1.594364, -0.3946747, 3.655746, 1, 0, 0.4313726, 1,
1.605322, -0.1214995, 1.069273, 1, 0, 0.427451, 1,
1.61334, 0.4082339, 2.04635, 1, 0, 0.4196078, 1,
1.623888, 1.085809, 2.118764, 1, 0, 0.4156863, 1,
1.624259, 0.7876034, 1.181006, 1, 0, 0.4078431, 1,
1.632373, -0.7301776, 2.495749, 1, 0, 0.4039216, 1,
1.637412, -1.269176, 4.262197, 1, 0, 0.3960784, 1,
1.642054, -0.2396004, 2.207875, 1, 0, 0.3882353, 1,
1.643676, 0.1658793, 2.847759, 1, 0, 0.3843137, 1,
1.663707, -0.5549701, 0.7851315, 1, 0, 0.3764706, 1,
1.672083, -0.8442301, 1.393178, 1, 0, 0.372549, 1,
1.689521, -0.3714392, 3.477386, 1, 0, 0.3647059, 1,
1.691399, -0.1500451, 2.586193, 1, 0, 0.3607843, 1,
1.692741, -0.6101174, 2.469754, 1, 0, 0.3529412, 1,
1.705697, 0.5275885, 3.058283, 1, 0, 0.3490196, 1,
1.72802, -2.046993, 3.305864, 1, 0, 0.3411765, 1,
1.752034, 0.1157428, 0.07724591, 1, 0, 0.3372549, 1,
1.7662, 0.9347318, 2.28587, 1, 0, 0.3294118, 1,
1.769371, -0.1650646, 1.330424, 1, 0, 0.3254902, 1,
1.77374, -0.33275, 1.965232, 1, 0, 0.3176471, 1,
1.781674, -0.4316643, 3.56099, 1, 0, 0.3137255, 1,
1.793833, 1.888974, 1.828864, 1, 0, 0.3058824, 1,
1.798071, -1.278446, 2.123634, 1, 0, 0.2980392, 1,
1.799863, 0.7273489, 2.369689, 1, 0, 0.2941177, 1,
1.80613, 1.430303, 3.324663, 1, 0, 0.2862745, 1,
1.808495, 0.5748328, 0.2988731, 1, 0, 0.282353, 1,
1.815454, -0.693754, 3.70783, 1, 0, 0.2745098, 1,
1.823122, -0.2359592, 0.7615029, 1, 0, 0.2705882, 1,
1.834447, 0.006187262, 1.241808, 1, 0, 0.2627451, 1,
1.836703, 0.2015046, 1.503515, 1, 0, 0.2588235, 1,
1.857445, -0.7627897, 1.914124, 1, 0, 0.2509804, 1,
1.86878, 0.8539352, 2.491337, 1, 0, 0.2470588, 1,
1.898519, 0.1969993, 0.6162511, 1, 0, 0.2392157, 1,
1.901353, 0.3153858, 0.6830251, 1, 0, 0.2352941, 1,
1.904025, 0.6609807, 2.359804, 1, 0, 0.227451, 1,
1.927706, -0.5434743, 1.092973, 1, 0, 0.2235294, 1,
1.944903, 0.1581549, 1.523806, 1, 0, 0.2156863, 1,
1.945397, 0.03676888, 2.532537, 1, 0, 0.2117647, 1,
1.956756, 0.620293, 0.4320953, 1, 0, 0.2039216, 1,
1.969094, 0.8307428, 0.4499411, 1, 0, 0.1960784, 1,
1.977901, 3.098479, 1.252128, 1, 0, 0.1921569, 1,
1.983801, -0.8056211, 2.732405, 1, 0, 0.1843137, 1,
1.984124, 1.858082, 1.40695, 1, 0, 0.1803922, 1,
1.993545, -2.401707, 1.160954, 1, 0, 0.172549, 1,
2.001805, -0.3003737, 0.752432, 1, 0, 0.1686275, 1,
2.009317, 0.07826478, 0.7815449, 1, 0, 0.1607843, 1,
2.020657, -1.038003, 2.981136, 1, 0, 0.1568628, 1,
2.025289, -0.1903736, 1.109399, 1, 0, 0.1490196, 1,
2.035074, -0.1014616, 1.301318, 1, 0, 0.145098, 1,
2.041378, 1.219995, 1.032609, 1, 0, 0.1372549, 1,
2.067033, 0.1172598, 0.4430099, 1, 0, 0.1333333, 1,
2.067048, 0.9340293, 0.3034343, 1, 0, 0.1254902, 1,
2.083689, -1.831336, 1.193012, 1, 0, 0.1215686, 1,
2.087417, -1.171165, 1.29332, 1, 0, 0.1137255, 1,
2.105495, -0.5435805, 1.769121, 1, 0, 0.1098039, 1,
2.124901, -0.489019, 5.064165, 1, 0, 0.1019608, 1,
2.164703, -1.356475, 2.467623, 1, 0, 0.09411765, 1,
2.179008, -0.1325687, 1.927178, 1, 0, 0.09019608, 1,
2.232172, -0.05474298, 1.397683, 1, 0, 0.08235294, 1,
2.293621, 1.317431, 0.6334385, 1, 0, 0.07843138, 1,
2.380323, 0.4816518, 0.7796574, 1, 0, 0.07058824, 1,
2.385937, 1.454478, 0.06740522, 1, 0, 0.06666667, 1,
2.506972, 2.210535, 0.4130263, 1, 0, 0.05882353, 1,
2.647121, 0.3544162, 2.449572, 1, 0, 0.05490196, 1,
2.666327, 1.595937, 2.901554, 1, 0, 0.04705882, 1,
2.686255, 0.8177882, -1.30929, 1, 0, 0.04313726, 1,
2.763783, -0.3440904, 1.201579, 1, 0, 0.03529412, 1,
2.791623, 1.344121, 2.566432, 1, 0, 0.03137255, 1,
2.799754, -0.2546461, 0.5497472, 1, 0, 0.02352941, 1,
2.963294, -0.07851494, 0.2356775, 1, 0, 0.01960784, 1,
2.990477, -1.150496, 1.118402, 1, 0, 0.01176471, 1,
3.207911, 1.536057, 0.7697436, 1, 0, 0.007843138, 1
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
0.05620289, -4.074628, -7.121103, 0, -0.5, 0.5, 0.5,
0.05620289, -4.074628, -7.121103, 1, -0.5, 0.5, 0.5,
0.05620289, -4.074628, -7.121103, 1, 1.5, 0.5, 0.5,
0.05620289, -4.074628, -7.121103, 0, 1.5, 0.5, 0.5
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
-4.163934, 0.3879577, -7.121103, 0, -0.5, 0.5, 0.5,
-4.163934, 0.3879577, -7.121103, 1, -0.5, 0.5, 0.5,
-4.163934, 0.3879577, -7.121103, 1, 1.5, 0.5, 0.5,
-4.163934, 0.3879577, -7.121103, 0, 1.5, 0.5, 0.5
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
-4.163934, -4.074628, 0.2831781, 0, -0.5, 0.5, 0.5,
-4.163934, -4.074628, 0.2831781, 1, -0.5, 0.5, 0.5,
-4.163934, -4.074628, 0.2831781, 1, 1.5, 0.5, 0.5,
-4.163934, -4.074628, 0.2831781, 0, 1.5, 0.5, 0.5
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
-3, -3.044801, -5.412423,
3, -3.044801, -5.412423,
-3, -3.044801, -5.412423,
-3, -3.216439, -5.697203,
-2, -3.044801, -5.412423,
-2, -3.216439, -5.697203,
-1, -3.044801, -5.412423,
-1, -3.216439, -5.697203,
0, -3.044801, -5.412423,
0, -3.216439, -5.697203,
1, -3.044801, -5.412423,
1, -3.216439, -5.697203,
2, -3.044801, -5.412423,
2, -3.216439, -5.697203,
3, -3.044801, -5.412423,
3, -3.216439, -5.697203
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -3.559714, -6.266763, 0, -0.5, 0.5, 0.5,
-3, -3.559714, -6.266763, 1, -0.5, 0.5, 0.5,
-3, -3.559714, -6.266763, 1, 1.5, 0.5, 0.5,
-3, -3.559714, -6.266763, 0, 1.5, 0.5, 0.5,
-2, -3.559714, -6.266763, 0, -0.5, 0.5, 0.5,
-2, -3.559714, -6.266763, 1, -0.5, 0.5, 0.5,
-2, -3.559714, -6.266763, 1, 1.5, 0.5, 0.5,
-2, -3.559714, -6.266763, 0, 1.5, 0.5, 0.5,
-1, -3.559714, -6.266763, 0, -0.5, 0.5, 0.5,
-1, -3.559714, -6.266763, 1, -0.5, 0.5, 0.5,
-1, -3.559714, -6.266763, 1, 1.5, 0.5, 0.5,
-1, -3.559714, -6.266763, 0, 1.5, 0.5, 0.5,
0, -3.559714, -6.266763, 0, -0.5, 0.5, 0.5,
0, -3.559714, -6.266763, 1, -0.5, 0.5, 0.5,
0, -3.559714, -6.266763, 1, 1.5, 0.5, 0.5,
0, -3.559714, -6.266763, 0, 1.5, 0.5, 0.5,
1, -3.559714, -6.266763, 0, -0.5, 0.5, 0.5,
1, -3.559714, -6.266763, 1, -0.5, 0.5, 0.5,
1, -3.559714, -6.266763, 1, 1.5, 0.5, 0.5,
1, -3.559714, -6.266763, 0, 1.5, 0.5, 0.5,
2, -3.559714, -6.266763, 0, -0.5, 0.5, 0.5,
2, -3.559714, -6.266763, 1, -0.5, 0.5, 0.5,
2, -3.559714, -6.266763, 1, 1.5, 0.5, 0.5,
2, -3.559714, -6.266763, 0, 1.5, 0.5, 0.5,
3, -3.559714, -6.266763, 0, -0.5, 0.5, 0.5,
3, -3.559714, -6.266763, 1, -0.5, 0.5, 0.5,
3, -3.559714, -6.266763, 1, 1.5, 0.5, 0.5,
3, -3.559714, -6.266763, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.190056, -2, -5.412423,
-3.190056, 3, -5.412423,
-3.190056, -2, -5.412423,
-3.352369, -2, -5.697203,
-3.190056, -1, -5.412423,
-3.352369, -1, -5.697203,
-3.190056, 0, -5.412423,
-3.352369, 0, -5.697203,
-3.190056, 1, -5.412423,
-3.352369, 1, -5.697203,
-3.190056, 2, -5.412423,
-3.352369, 2, -5.697203,
-3.190056, 3, -5.412423,
-3.352369, 3, -5.697203
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.676995, -2, -6.266763, 0, -0.5, 0.5, 0.5,
-3.676995, -2, -6.266763, 1, -0.5, 0.5, 0.5,
-3.676995, -2, -6.266763, 1, 1.5, 0.5, 0.5,
-3.676995, -2, -6.266763, 0, 1.5, 0.5, 0.5,
-3.676995, -1, -6.266763, 0, -0.5, 0.5, 0.5,
-3.676995, -1, -6.266763, 1, -0.5, 0.5, 0.5,
-3.676995, -1, -6.266763, 1, 1.5, 0.5, 0.5,
-3.676995, -1, -6.266763, 0, 1.5, 0.5, 0.5,
-3.676995, 0, -6.266763, 0, -0.5, 0.5, 0.5,
-3.676995, 0, -6.266763, 1, -0.5, 0.5, 0.5,
-3.676995, 0, -6.266763, 1, 1.5, 0.5, 0.5,
-3.676995, 0, -6.266763, 0, 1.5, 0.5, 0.5,
-3.676995, 1, -6.266763, 0, -0.5, 0.5, 0.5,
-3.676995, 1, -6.266763, 1, -0.5, 0.5, 0.5,
-3.676995, 1, -6.266763, 1, 1.5, 0.5, 0.5,
-3.676995, 1, -6.266763, 0, 1.5, 0.5, 0.5,
-3.676995, 2, -6.266763, 0, -0.5, 0.5, 0.5,
-3.676995, 2, -6.266763, 1, -0.5, 0.5, 0.5,
-3.676995, 2, -6.266763, 1, 1.5, 0.5, 0.5,
-3.676995, 2, -6.266763, 0, 1.5, 0.5, 0.5,
-3.676995, 3, -6.266763, 0, -0.5, 0.5, 0.5,
-3.676995, 3, -6.266763, 1, -0.5, 0.5, 0.5,
-3.676995, 3, -6.266763, 1, 1.5, 0.5, 0.5,
-3.676995, 3, -6.266763, 0, 1.5, 0.5, 0.5
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
-3.190056, -3.044801, -4,
-3.190056, -3.044801, 4,
-3.190056, -3.044801, -4,
-3.352369, -3.216439, -4,
-3.190056, -3.044801, -2,
-3.352369, -3.216439, -2,
-3.190056, -3.044801, 0,
-3.352369, -3.216439, 0,
-3.190056, -3.044801, 2,
-3.352369, -3.216439, 2,
-3.190056, -3.044801, 4,
-3.352369, -3.216439, 4
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
-3.676995, -3.559714, -4, 0, -0.5, 0.5, 0.5,
-3.676995, -3.559714, -4, 1, -0.5, 0.5, 0.5,
-3.676995, -3.559714, -4, 1, 1.5, 0.5, 0.5,
-3.676995, -3.559714, -4, 0, 1.5, 0.5, 0.5,
-3.676995, -3.559714, -2, 0, -0.5, 0.5, 0.5,
-3.676995, -3.559714, -2, 1, -0.5, 0.5, 0.5,
-3.676995, -3.559714, -2, 1, 1.5, 0.5, 0.5,
-3.676995, -3.559714, -2, 0, 1.5, 0.5, 0.5,
-3.676995, -3.559714, 0, 0, -0.5, 0.5, 0.5,
-3.676995, -3.559714, 0, 1, -0.5, 0.5, 0.5,
-3.676995, -3.559714, 0, 1, 1.5, 0.5, 0.5,
-3.676995, -3.559714, 0, 0, 1.5, 0.5, 0.5,
-3.676995, -3.559714, 2, 0, -0.5, 0.5, 0.5,
-3.676995, -3.559714, 2, 1, -0.5, 0.5, 0.5,
-3.676995, -3.559714, 2, 1, 1.5, 0.5, 0.5,
-3.676995, -3.559714, 2, 0, 1.5, 0.5, 0.5,
-3.676995, -3.559714, 4, 0, -0.5, 0.5, 0.5,
-3.676995, -3.559714, 4, 1, -0.5, 0.5, 0.5,
-3.676995, -3.559714, 4, 1, 1.5, 0.5, 0.5,
-3.676995, -3.559714, 4, 0, 1.5, 0.5, 0.5
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
-3.190056, -3.044801, -5.412423,
-3.190056, 3.820716, -5.412423,
-3.190056, -3.044801, 5.978779,
-3.190056, 3.820716, 5.978779,
-3.190056, -3.044801, -5.412423,
-3.190056, -3.044801, 5.978779,
-3.190056, 3.820716, -5.412423,
-3.190056, 3.820716, 5.978779,
-3.190056, -3.044801, -5.412423,
3.302462, -3.044801, -5.412423,
-3.190056, -3.044801, 5.978779,
3.302462, -3.044801, 5.978779,
-3.190056, 3.820716, -5.412423,
3.302462, 3.820716, -5.412423,
-3.190056, 3.820716, 5.978779,
3.302462, 3.820716, 5.978779,
3.302462, -3.044801, -5.412423,
3.302462, 3.820716, -5.412423,
3.302462, -3.044801, 5.978779,
3.302462, 3.820716, 5.978779,
3.302462, -3.044801, -5.412423,
3.302462, -3.044801, 5.978779,
3.302462, 3.820716, -5.412423,
3.302462, 3.820716, 5.978779
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
var radius = 7.903049;
var distance = 35.16156;
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
mvMatrix.translate( -0.05620289, -0.3879577, -0.2831781 );
mvMatrix.scale( 1.31612, 1.244616, 0.7501343 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.16156);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Methidathion<-read.table("Methidathion.xyz")
```

```
## Error in read.table("Methidathion.xyz"): no lines available in input
```

```r
x<-Methidathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
```

```r
y<-Methidathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
```

```r
z<-Methidathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methidathion' not found
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
-3.095505, -0.6537665, -2.8748, 0, 0, 1, 1, 1,
-3.070754, 0.8665901, -1.288602, 1, 0, 0, 1, 1,
-2.791578, -0.07519803, -1.165995, 1, 0, 0, 1, 1,
-2.597318, -1.478954, -1.927499, 1, 0, 0, 1, 1,
-2.555069, -0.7554534, -2.755627, 1, 0, 0, 1, 1,
-2.508024, -1.199352, -2.902625, 1, 0, 0, 1, 1,
-2.483681, -1.454732, -3.753989, 0, 0, 0, 1, 1,
-2.431617, 0.1560345, -2.446502, 0, 0, 0, 1, 1,
-2.377841, -1.119453, -1.994586, 0, 0, 0, 1, 1,
-2.358539, 1.178698, -0.795549, 0, 0, 0, 1, 1,
-2.355292, -0.6437763, -1.403246, 0, 0, 0, 1, 1,
-2.32116, -1.837901, 0.06315689, 0, 0, 0, 1, 1,
-2.211432, -1.239656, -1.512707, 0, 0, 0, 1, 1,
-2.183384, -0.5068469, -3.875519, 1, 1, 1, 1, 1,
-2.134538, 0.06684007, -1.015254, 1, 1, 1, 1, 1,
-2.063145, 0.2505287, -2.454354, 1, 1, 1, 1, 1,
-2.059931, 0.0173413, -0.5521966, 1, 1, 1, 1, 1,
-2.058425, -0.9269614, -2.132722, 1, 1, 1, 1, 1,
-2.02509, 2.09082, -1.001325, 1, 1, 1, 1, 1,
-2.024497, 0.016983, -1.607915, 1, 1, 1, 1, 1,
-2.02001, 0.5451284, -1.811186, 1, 1, 1, 1, 1,
-2.016892, -0.1448662, -1.492455, 1, 1, 1, 1, 1,
-2.007377, -0.2363897, -1.326203, 1, 1, 1, 1, 1,
-2.001487, -0.05235, -0.5233642, 1, 1, 1, 1, 1,
-1.992917, 0.1705766, -1.99871, 1, 1, 1, 1, 1,
-1.982472, 1.702369, 0.07996751, 1, 1, 1, 1, 1,
-1.974689, 1.709511, -1.92894, 1, 1, 1, 1, 1,
-1.958948, -0.6069559, 0.7421111, 1, 1, 1, 1, 1,
-1.9155, 0.337674, -1.001933, 0, 0, 1, 1, 1,
-1.908614, -2.070276, -1.978624, 1, 0, 0, 1, 1,
-1.897494, 0.556687, -2.749164, 1, 0, 0, 1, 1,
-1.893445, 0.1121986, -1.361111, 1, 0, 0, 1, 1,
-1.884372, 0.8329606, -1.605659, 1, 0, 0, 1, 1,
-1.87239, 0.02066451, 0.7948571, 1, 0, 0, 1, 1,
-1.853867, 0.8447373, -1.440369, 0, 0, 0, 1, 1,
-1.848645, 2.251658, -1.477614, 0, 0, 0, 1, 1,
-1.834996, -0.3589503, -3.009963, 0, 0, 0, 1, 1,
-1.826141, -0.0688249, -1.905967, 0, 0, 0, 1, 1,
-1.802188, -0.1739508, -0.6068134, 0, 0, 0, 1, 1,
-1.786922, 0.07236031, -0.7555972, 0, 0, 0, 1, 1,
-1.772111, 0.7235827, 0.2233009, 0, 0, 0, 1, 1,
-1.759378, 0.06840958, -1.271669, 1, 1, 1, 1, 1,
-1.753709, -0.1663642, -2.499006, 1, 1, 1, 1, 1,
-1.752725, 1.964229, 0.4295892, 1, 1, 1, 1, 1,
-1.743358, -0.0820714, -0.5004682, 1, 1, 1, 1, 1,
-1.733755, 1.451138, -0.300358, 1, 1, 1, 1, 1,
-1.726546, -0.1033821, -2.000777, 1, 1, 1, 1, 1,
-1.720742, 0.03530698, 0.134788, 1, 1, 1, 1, 1,
-1.696396, -2.400111, -3.619287, 1, 1, 1, 1, 1,
-1.696079, -1.802065, -0.673788, 1, 1, 1, 1, 1,
-1.686578, -0.3873444, 0.1003808, 1, 1, 1, 1, 1,
-1.685313, -0.6879416, 0.07556639, 1, 1, 1, 1, 1,
-1.682323, 1.119351, -0.9580867, 1, 1, 1, 1, 1,
-1.664912, 2.19442, -1.840958, 1, 1, 1, 1, 1,
-1.662936, 0.8942578, -1.069451, 1, 1, 1, 1, 1,
-1.656293, 0.5109215, -0.2611025, 1, 1, 1, 1, 1,
-1.649812, -0.2852849, -2.081863, 0, 0, 1, 1, 1,
-1.646726, -0.1538229, -2.483367, 1, 0, 0, 1, 1,
-1.643281, 2.405147, -1.732558, 1, 0, 0, 1, 1,
-1.637892, 1.486284, -2.270523, 1, 0, 0, 1, 1,
-1.610688, 0.2290953, -1.896789, 1, 0, 0, 1, 1,
-1.594417, -2.126599, -3.401089, 1, 0, 0, 1, 1,
-1.590713, -1.32715, -1.324185, 0, 0, 0, 1, 1,
-1.560095, 0.1375355, -0.03646284, 0, 0, 0, 1, 1,
-1.555849, -1.349062, -2.305718, 0, 0, 0, 1, 1,
-1.55354, 0.7279143, -0.2836478, 0, 0, 0, 1, 1,
-1.546849, 0.1124128, -0.9937487, 0, 0, 0, 1, 1,
-1.542466, -0.4708037, -2.880552, 0, 0, 0, 1, 1,
-1.531962, -0.01056656, -1.554515, 0, 0, 0, 1, 1,
-1.528358, 0.3076648, -1.410109, 1, 1, 1, 1, 1,
-1.51035, -0.4530382, -1.448698, 1, 1, 1, 1, 1,
-1.497431, -1.775919, -2.351245, 1, 1, 1, 1, 1,
-1.49631, 0.05456037, -1.436169, 1, 1, 1, 1, 1,
-1.49096, -1.113626, -0.8228495, 1, 1, 1, 1, 1,
-1.479262, -0.2557087, -1.040711, 1, 1, 1, 1, 1,
-1.478858, -0.7501418, -2.579613, 1, 1, 1, 1, 1,
-1.456244, -0.2121669, -3.206043, 1, 1, 1, 1, 1,
-1.451817, -1.068386, -3.482634, 1, 1, 1, 1, 1,
-1.44949, -1.554994, -1.356166, 1, 1, 1, 1, 1,
-1.448797, -0.2205687, -2.499538, 1, 1, 1, 1, 1,
-1.445944, 0.07841184, -2.914314, 1, 1, 1, 1, 1,
-1.435238, 1.608517, -1.726541, 1, 1, 1, 1, 1,
-1.43492, -0.2506391, -2.698947, 1, 1, 1, 1, 1,
-1.424013, 0.1810194, -1.577729, 1, 1, 1, 1, 1,
-1.423652, -0.6452059, -2.77227, 0, 0, 1, 1, 1,
-1.422555, -1.032342, -2.509229, 1, 0, 0, 1, 1,
-1.415319, -0.8551622, -2.809509, 1, 0, 0, 1, 1,
-1.393556, 0.5799405, -1.106907, 1, 0, 0, 1, 1,
-1.391582, 0.7691973, -2.362822, 1, 0, 0, 1, 1,
-1.389706, 0.5229756, -2.176693, 1, 0, 0, 1, 1,
-1.388372, -0.5796983, -2.125284, 0, 0, 0, 1, 1,
-1.384621, 0.8682306, -0.4751396, 0, 0, 0, 1, 1,
-1.373073, 0.4733126, -2.293031, 0, 0, 0, 1, 1,
-1.372207, 0.3394237, -1.160234, 0, 0, 0, 1, 1,
-1.368519, -1.062886, -2.35464, 0, 0, 0, 1, 1,
-1.366761, -0.5713599, -1.130198, 0, 0, 0, 1, 1,
-1.366431, -0.4727675, 0.195528, 0, 0, 0, 1, 1,
-1.356377, 2.369556, 0.3457468, 1, 1, 1, 1, 1,
-1.353762, 0.1798657, -0.8128054, 1, 1, 1, 1, 1,
-1.334563, -1.089749, -3.34206, 1, 1, 1, 1, 1,
-1.323173, 0.5078561, -0.971564, 1, 1, 1, 1, 1,
-1.315053, 0.587418, -0.2026757, 1, 1, 1, 1, 1,
-1.311333, 0.764911, -0.3330371, 1, 1, 1, 1, 1,
-1.300764, 2.891218, -0.02287215, 1, 1, 1, 1, 1,
-1.299112, 1.813117, 1.483367, 1, 1, 1, 1, 1,
-1.298311, 1.246085, -0.3150374, 1, 1, 1, 1, 1,
-1.291962, 1.105821, -1.734651, 1, 1, 1, 1, 1,
-1.287755, 1.314382, 0.9652671, 1, 1, 1, 1, 1,
-1.28512, -0.9394881, -1.492094, 1, 1, 1, 1, 1,
-1.281081, -1.743264, -1.614949, 1, 1, 1, 1, 1,
-1.279566, 0.01575532, -0.9980399, 1, 1, 1, 1, 1,
-1.264328, -1.144602, -2.906826, 1, 1, 1, 1, 1,
-1.260916, -1.382892, -2.07092, 0, 0, 1, 1, 1,
-1.260146, -0.2935288, -0.456466, 1, 0, 0, 1, 1,
-1.258739, 0.3634842, -2.044613, 1, 0, 0, 1, 1,
-1.257535, 2.773078, -0.7633, 1, 0, 0, 1, 1,
-1.250934, -0.3605143, -1.77664, 1, 0, 0, 1, 1,
-1.227418, -0.5659774, -2.273077, 1, 0, 0, 1, 1,
-1.224608, 1.116647, -1.424006, 0, 0, 0, 1, 1,
-1.21624, -2.34932, -2.941445, 0, 0, 0, 1, 1,
-1.216204, -0.3186818, -2.861449, 0, 0, 0, 1, 1,
-1.216196, -0.6599917, -1.549532, 0, 0, 0, 1, 1,
-1.210919, -0.5522112, -3.700248, 0, 0, 0, 1, 1,
-1.193031, 0.7264818, -0.5143695, 0, 0, 0, 1, 1,
-1.190112, 0.1311871, -1.7161, 0, 0, 0, 1, 1,
-1.18958, -0.1215525, -1.566416, 1, 1, 1, 1, 1,
-1.189324, 2.00295, -1.049551, 1, 1, 1, 1, 1,
-1.188623, 0.1852363, -1.088144, 1, 1, 1, 1, 1,
-1.187672, -0.7552599, -1.649709, 1, 1, 1, 1, 1,
-1.185985, -0.2340716, -2.281116, 1, 1, 1, 1, 1,
-1.183404, 0.9589672, -0.868222, 1, 1, 1, 1, 1,
-1.177242, 0.1080188, 0.53109, 1, 1, 1, 1, 1,
-1.170279, -0.5264638, -2.199807, 1, 1, 1, 1, 1,
-1.166769, -0.1974134, -1.272535, 1, 1, 1, 1, 1,
-1.155586, 0.4006869, -2.806074, 1, 1, 1, 1, 1,
-1.152852, 0.3809659, 1.508224, 1, 1, 1, 1, 1,
-1.150558, 1.311698, -1.040216, 1, 1, 1, 1, 1,
-1.150342, -0.8702529, -0.2865824, 1, 1, 1, 1, 1,
-1.143293, -0.5264714, -2.07869, 1, 1, 1, 1, 1,
-1.143284, 0.09655382, -1.376619, 1, 1, 1, 1, 1,
-1.140926, -1.188624, -2.510705, 0, 0, 1, 1, 1,
-1.134222, 2.622451, 0.5348881, 1, 0, 0, 1, 1,
-1.133815, -0.1488602, -1.534146, 1, 0, 0, 1, 1,
-1.133529, -0.05213153, -2.554871, 1, 0, 0, 1, 1,
-1.130114, -0.5008928, -1.682713, 1, 0, 0, 1, 1,
-1.116124, -0.5569811, -1.097917, 1, 0, 0, 1, 1,
-1.114163, -0.2399301, -1.73644, 0, 0, 0, 1, 1,
-1.114007, -0.4981143, -2.358316, 0, 0, 0, 1, 1,
-1.111457, 1.154738, -1.628444, 0, 0, 0, 1, 1,
-1.105978, 0.7164975, -2.252771, 0, 0, 0, 1, 1,
-1.103043, 0.4075102, -1.670529, 0, 0, 0, 1, 1,
-1.098092, -0.8673578, -3.017852, 0, 0, 0, 1, 1,
-1.096725, -2.467004, -2.801313, 0, 0, 0, 1, 1,
-1.090365, -0.3289607, -0.2887068, 1, 1, 1, 1, 1,
-1.082171, -1.310346, -1.544056, 1, 1, 1, 1, 1,
-1.078401, -0.140625, -1.710682, 1, 1, 1, 1, 1,
-1.075977, 0.9792275, -0.6766202, 1, 1, 1, 1, 1,
-1.074333, -0.01004193, -0.9885679, 1, 1, 1, 1, 1,
-1.066983, 1.785092, -1.656765, 1, 1, 1, 1, 1,
-1.04483, 0.1550255, -1.482269, 1, 1, 1, 1, 1,
-1.038948, 0.7289605, -2.423407, 1, 1, 1, 1, 1,
-1.038594, 0.1751177, -1.441403, 1, 1, 1, 1, 1,
-1.036397, -1.283135, -2.509055, 1, 1, 1, 1, 1,
-1.026054, 0.5942266, -0.920243, 1, 1, 1, 1, 1,
-1.025505, 0.2798362, -2.591934, 1, 1, 1, 1, 1,
-1.024114, -1.039511, -0.9556865, 1, 1, 1, 1, 1,
-1.015918, 0.01746795, 0.02037721, 1, 1, 1, 1, 1,
-1.01482, -0.07628727, -1.569975, 1, 1, 1, 1, 1,
-1.014806, 0.7268806, -2.044335, 0, 0, 1, 1, 1,
-1.008119, -0.8225357, -2.671169, 1, 0, 0, 1, 1,
-1.007186, 0.6505412, 0.1459038, 1, 0, 0, 1, 1,
-1.002265, -0.7815444, -2.78849, 1, 0, 0, 1, 1,
-0.9968961, 0.3187174, -0.05318585, 1, 0, 0, 1, 1,
-0.9952365, -0.2986241, -2.09344, 1, 0, 0, 1, 1,
-0.9937397, -1.31245, -2.779363, 0, 0, 0, 1, 1,
-0.9870407, -1.478711, -3.076404, 0, 0, 0, 1, 1,
-0.9739974, 1.140671, -0.4928544, 0, 0, 0, 1, 1,
-0.9716623, -1.577263, -4.068693, 0, 0, 0, 1, 1,
-0.9710925, -0.6016576, -3.043957, 0, 0, 0, 1, 1,
-0.9709487, -1.014326, -2.954288, 0, 0, 0, 1, 1,
-0.9688203, 0.7721491, -1.690842, 0, 0, 0, 1, 1,
-0.9648078, -1.275198, -4.462055, 1, 1, 1, 1, 1,
-0.962036, -0.4854746, -1.781438, 1, 1, 1, 1, 1,
-0.9525521, 0.8530151, -0.09016959, 1, 1, 1, 1, 1,
-0.9501352, -2.010958, -2.900772, 1, 1, 1, 1, 1,
-0.9445143, 0.6582584, 0.1175713, 1, 1, 1, 1, 1,
-0.9325712, 0.6755609, 1.248398, 1, 1, 1, 1, 1,
-0.9319703, -1.507873, -3.197941, 1, 1, 1, 1, 1,
-0.9301921, 0.2333416, -1.691515, 1, 1, 1, 1, 1,
-0.9285847, -1.294407, -3.231693, 1, 1, 1, 1, 1,
-0.9245085, -0.5986581, -0.3424162, 1, 1, 1, 1, 1,
-0.9224018, -0.8495952, -2.088182, 1, 1, 1, 1, 1,
-0.9100193, 1.268796, 1.526589, 1, 1, 1, 1, 1,
-0.9028434, -0.8706378, -3.803082, 1, 1, 1, 1, 1,
-0.9024761, -0.04165632, -2.111524, 1, 1, 1, 1, 1,
-0.9014899, -0.9772722, -5.246531, 1, 1, 1, 1, 1,
-0.8995644, 1.913009, -0.3322571, 0, 0, 1, 1, 1,
-0.8986284, 3.111368, -0.1639013, 1, 0, 0, 1, 1,
-0.8969769, 2.001717, 1.0934, 1, 0, 0, 1, 1,
-0.8925898, -1.089609, -2.330149, 1, 0, 0, 1, 1,
-0.8873904, -0.6252279, -2.667227, 1, 0, 0, 1, 1,
-0.8700955, 3.720733, -0.5152363, 1, 0, 0, 1, 1,
-0.8643924, -0.8340384, -1.303857, 0, 0, 0, 1, 1,
-0.863925, -0.846666, -3.983366, 0, 0, 0, 1, 1,
-0.8611795, -1.758139, -2.818258, 0, 0, 0, 1, 1,
-0.8458849, 0.05987282, -1.425631, 0, 0, 0, 1, 1,
-0.8385528, 0.1505188, -2.099944, 0, 0, 0, 1, 1,
-0.8244023, -0.902655, -3.369157, 0, 0, 0, 1, 1,
-0.8234554, -0.8142585, -1.144396, 0, 0, 0, 1, 1,
-0.8075954, -2.215921, -2.490073, 1, 1, 1, 1, 1,
-0.7957436, 0.9248415, -1.556689, 1, 1, 1, 1, 1,
-0.7902785, -1.529632, -2.747306, 1, 1, 1, 1, 1,
-0.7875658, -0.843522, -3.086027, 1, 1, 1, 1, 1,
-0.7839642, 0.05442845, -2.968253, 1, 1, 1, 1, 1,
-0.7835096, 0.2158154, -1.483702, 1, 1, 1, 1, 1,
-0.7830116, -0.2191578, 0.4758901, 1, 1, 1, 1, 1,
-0.7810282, 2.026617, 0.6852344, 1, 1, 1, 1, 1,
-0.7749969, -0.2328285, -0.3242373, 1, 1, 1, 1, 1,
-0.7743626, -0.6635799, -2.939291, 1, 1, 1, 1, 1,
-0.768358, 0.246962, -2.418266, 1, 1, 1, 1, 1,
-0.7670899, 0.3785034, -0.8009241, 1, 1, 1, 1, 1,
-0.7642827, -1.250044, -3.382501, 1, 1, 1, 1, 1,
-0.7552368, 1.014647, -0.739329, 1, 1, 1, 1, 1,
-0.7529191, 0.2971354, -1.634432, 1, 1, 1, 1, 1,
-0.7464454, 0.1135697, -3.485882, 0, 0, 1, 1, 1,
-0.7334567, 0.240359, -1.578199, 1, 0, 0, 1, 1,
-0.7306163, -1.404347, -2.865844, 1, 0, 0, 1, 1,
-0.7304164, 1.05973, -0.1841003, 1, 0, 0, 1, 1,
-0.7285465, -0.5649894, -4.897464, 1, 0, 0, 1, 1,
-0.7239518, -1.460342, -1.724382, 1, 0, 0, 1, 1,
-0.7184077, 0.1686558, -2.521819, 0, 0, 0, 1, 1,
-0.7159218, -0.7252271, -1.719246, 0, 0, 0, 1, 1,
-0.7113844, -1.642027, -1.845317, 0, 0, 0, 1, 1,
-0.7095583, -2.944817, -3.665938, 0, 0, 0, 1, 1,
-0.7089782, -1.320938, -1.837419, 0, 0, 0, 1, 1,
-0.7076282, 0.8250806, 0.2290767, 0, 0, 0, 1, 1,
-0.6986441, 0.4776937, -2.540104, 0, 0, 0, 1, 1,
-0.6981673, 0.2997722, -1.501484, 1, 1, 1, 1, 1,
-0.6934826, 0.7600273, -2.738409, 1, 1, 1, 1, 1,
-0.6912018, -1.581013, -3.802106, 1, 1, 1, 1, 1,
-0.6872678, 0.9389307, 1.570649, 1, 1, 1, 1, 1,
-0.6864138, -0.8095632, -1.68514, 1, 1, 1, 1, 1,
-0.6851935, -0.6181608, -2.795964, 1, 1, 1, 1, 1,
-0.6844105, 1.140684, -1.827876, 1, 1, 1, 1, 1,
-0.6731244, 0.388287, -2.748803, 1, 1, 1, 1, 1,
-0.6692801, 0.2938426, -1.864349, 1, 1, 1, 1, 1,
-0.6679443, -0.962024, -2.422139, 1, 1, 1, 1, 1,
-0.6653379, 0.05215801, -2.85806, 1, 1, 1, 1, 1,
-0.6652107, -0.6056485, -1.914991, 1, 1, 1, 1, 1,
-0.6602357, 0.9668452, 0.002962898, 1, 1, 1, 1, 1,
-0.6598201, 2.624284, 0.2733384, 1, 1, 1, 1, 1,
-0.6568158, 1.479699, -1.251829, 1, 1, 1, 1, 1,
-0.6532011, 1.597629, -0.8409489, 0, 0, 1, 1, 1,
-0.6520594, 0.656181, -2.198006, 1, 0, 0, 1, 1,
-0.6484585, -0.4202122, -2.274741, 1, 0, 0, 1, 1,
-0.6440532, 1.29068, -1.18561, 1, 0, 0, 1, 1,
-0.6396827, -0.6184535, -1.168779, 1, 0, 0, 1, 1,
-0.6391686, -1.308311, -3.561935, 1, 0, 0, 1, 1,
-0.6383445, -0.6125032, -1.033065, 0, 0, 0, 1, 1,
-0.6270778, -1.478423, -2.836735, 0, 0, 0, 1, 1,
-0.6251611, -0.2140853, -2.35516, 0, 0, 0, 1, 1,
-0.6251041, 0.0788624, -2.462185, 0, 0, 0, 1, 1,
-0.6189048, 0.4555408, -0.4291655, 0, 0, 0, 1, 1,
-0.6165169, 0.4719005, -1.026627, 0, 0, 0, 1, 1,
-0.6158124, 1.089193, -0.991102, 0, 0, 0, 1, 1,
-0.614318, -1.035501, -3.708132, 1, 1, 1, 1, 1,
-0.6106362, -0.6987716, -2.237047, 1, 1, 1, 1, 1,
-0.6044439, 0.1101312, -0.5014384, 1, 1, 1, 1, 1,
-0.5977539, 0.3512691, 0.050664, 1, 1, 1, 1, 1,
-0.5928551, -0.01612304, -1.778039, 1, 1, 1, 1, 1,
-0.5925851, 1.130533, -1.480705, 1, 1, 1, 1, 1,
-0.590775, -0.6525137, -2.53842, 1, 1, 1, 1, 1,
-0.5898393, -0.09372553, -1.06758, 1, 1, 1, 1, 1,
-0.5864523, -0.2529275, -1.868256, 1, 1, 1, 1, 1,
-0.5859469, 0.0129194, -3.064685, 1, 1, 1, 1, 1,
-0.5844956, -0.3640215, -1.288636, 1, 1, 1, 1, 1,
-0.5774252, -1.56305, -1.609107, 1, 1, 1, 1, 1,
-0.5695019, -0.1689278, -0.6139472, 1, 1, 1, 1, 1,
-0.5691959, 0.7574657, -1.354612, 1, 1, 1, 1, 1,
-0.5685869, -1.398756, -2.74441, 1, 1, 1, 1, 1,
-0.5662909, -0.1288408, -0.339439, 0, 0, 1, 1, 1,
-0.5660141, 1.245499, -0.3241903, 1, 0, 0, 1, 1,
-0.5646957, 0.2850478, -1.772572, 1, 0, 0, 1, 1,
-0.5633621, 1.688981, -1.314338, 1, 0, 0, 1, 1,
-0.5594865, -1.398141, -3.35585, 1, 0, 0, 1, 1,
-0.5583886, -0.5748619, -3.504878, 1, 0, 0, 1, 1,
-0.5545846, -2.043369, -2.938467, 0, 0, 0, 1, 1,
-0.5529032, 0.3090409, -2.960362, 0, 0, 0, 1, 1,
-0.5465103, 0.2797716, -2.167085, 0, 0, 0, 1, 1,
-0.5453021, 1.097448, -3.612741, 0, 0, 0, 1, 1,
-0.5417718, 0.02694692, -3.314006, 0, 0, 0, 1, 1,
-0.5383623, -0.5421798, -0.4303491, 0, 0, 0, 1, 1,
-0.5375503, -0.3025807, -1.963085, 0, 0, 0, 1, 1,
-0.5369558, -1.15828, -4.291574, 1, 1, 1, 1, 1,
-0.5299106, 0.7802564, -0.9917166, 1, 1, 1, 1, 1,
-0.5258685, 1.627858, 0.7545794, 1, 1, 1, 1, 1,
-0.5258051, -0.2973392, -2.265859, 1, 1, 1, 1, 1,
-0.5244123, -0.803396, -4.799154, 1, 1, 1, 1, 1,
-0.5173211, 0.180466, -2.190578, 1, 1, 1, 1, 1,
-0.5172094, -1.379105, -1.999004, 1, 1, 1, 1, 1,
-0.5156395, -1.14459, -2.24505, 1, 1, 1, 1, 1,
-0.5099934, -0.038781, -0.1519824, 1, 1, 1, 1, 1,
-0.5097296, -0.8328989, -1.691985, 1, 1, 1, 1, 1,
-0.5058724, -1.42182, -2.348161, 1, 1, 1, 1, 1,
-0.5032582, 0.5549828, -0.6921018, 1, 1, 1, 1, 1,
-0.5031666, 0.651939, 0.3962959, 1, 1, 1, 1, 1,
-0.5022343, -0.5530949, -1.973774, 1, 1, 1, 1, 1,
-0.4661295, 0.4377971, -1.494889, 1, 1, 1, 1, 1,
-0.4661261, -0.1753069, -1.806659, 0, 0, 1, 1, 1,
-0.4641233, -1.186668, -2.294859, 1, 0, 0, 1, 1,
-0.4608377, 1.917088, 0.01185171, 1, 0, 0, 1, 1,
-0.4604225, -0.4934002, -4.106984, 1, 0, 0, 1, 1,
-0.4545115, -0.112669, -1.92929, 1, 0, 0, 1, 1,
-0.4536452, -0.2097742, -2.706231, 1, 0, 0, 1, 1,
-0.4531822, 2.934684, -0.3837818, 0, 0, 0, 1, 1,
-0.45151, -1.491688, -3.323281, 0, 0, 0, 1, 1,
-0.4514943, 0.1632105, -0.2903755, 0, 0, 0, 1, 1,
-0.4486724, 0.800343, -0.6207097, 0, 0, 0, 1, 1,
-0.4470926, 0.2560715, -0.1989585, 0, 0, 0, 1, 1,
-0.445903, -1.17979, -3.090746, 0, 0, 0, 1, 1,
-0.4455507, -0.8425437, -1.253262, 0, 0, 0, 1, 1,
-0.4418965, 0.2003584, -1.795233, 1, 1, 1, 1, 1,
-0.4408996, -1.201785, -1.119086, 1, 1, 1, 1, 1,
-0.437351, -0.2833311, -0.8864653, 1, 1, 1, 1, 1,
-0.435157, -2.139889, -3.839255, 1, 1, 1, 1, 1,
-0.4342131, -1.809868, -1.300686, 1, 1, 1, 1, 1,
-0.4272492, 0.09878907, -0.2809083, 1, 1, 1, 1, 1,
-0.42662, -1.246525, -2.848395, 1, 1, 1, 1, 1,
-0.4226449, 1.016395, -0.9845294, 1, 1, 1, 1, 1,
-0.4210224, 0.5505639, -1.242595, 1, 1, 1, 1, 1,
-0.4193417, -1.931249, -4.023737, 1, 1, 1, 1, 1,
-0.4185927, -0.3528552, -2.125426, 1, 1, 1, 1, 1,
-0.4147422, 1.899111, 0.08122309, 1, 1, 1, 1, 1,
-0.4142947, 1.908831, 0.3424484, 1, 1, 1, 1, 1,
-0.4137764, -1.137227, -1.011938, 1, 1, 1, 1, 1,
-0.4136969, 1.198323, -1.151921, 1, 1, 1, 1, 1,
-0.4107823, -0.2531499, -1.269436, 0, 0, 1, 1, 1,
-0.4049833, 0.8287186, 0.004151805, 1, 0, 0, 1, 1,
-0.4024796, -0.5965574, -2.546654, 1, 0, 0, 1, 1,
-0.4020839, -0.225179, -1.700333, 1, 0, 0, 1, 1,
-0.4005446, -0.304279, -4.073752, 1, 0, 0, 1, 1,
-0.3987495, -0.4435727, -2.683502, 1, 0, 0, 1, 1,
-0.3833529, -0.7387397, -1.984557, 0, 0, 0, 1, 1,
-0.3828654, 0.2209557, -1.742283, 0, 0, 0, 1, 1,
-0.3740648, -0.2952394, -2.557583, 0, 0, 0, 1, 1,
-0.3717533, -0.5022022, -1.33224, 0, 0, 0, 1, 1,
-0.3672696, -0.8168283, -4.012919, 0, 0, 0, 1, 1,
-0.3653754, -0.2997973, -0.4813682, 0, 0, 0, 1, 1,
-0.365215, -0.1530225, -0.511512, 0, 0, 0, 1, 1,
-0.3607668, -0.3509314, -3.233372, 1, 1, 1, 1, 1,
-0.3605818, 0.4615697, -1.574231, 1, 1, 1, 1, 1,
-0.3600639, -1.412252, -1.419896, 1, 1, 1, 1, 1,
-0.3571453, 0.001255755, -1.941651, 1, 1, 1, 1, 1,
-0.3560557, 0.03131555, -0.6396655, 1, 1, 1, 1, 1,
-0.3478207, -0.3449433, -1.429562, 1, 1, 1, 1, 1,
-0.3466302, 0.5259942, -0.6918092, 1, 1, 1, 1, 1,
-0.3433012, -0.8480045, -2.355971, 1, 1, 1, 1, 1,
-0.3427729, 1.122558, 0.3188564, 1, 1, 1, 1, 1,
-0.3359983, 0.5094499, -0.6973606, 1, 1, 1, 1, 1,
-0.334349, -1.189527, -2.126142, 1, 1, 1, 1, 1,
-0.3330866, 1.379424, -0.617671, 1, 1, 1, 1, 1,
-0.3317055, 0.7164112, 0.7221684, 1, 1, 1, 1, 1,
-0.3211849, 0.3123944, -0.04966231, 1, 1, 1, 1, 1,
-0.3152906, -1.057019, -1.56404, 1, 1, 1, 1, 1,
-0.3136549, 0.06548969, -0.7397598, 0, 0, 1, 1, 1,
-0.3095402, -0.1200492, -2.698143, 1, 0, 0, 1, 1,
-0.3089729, -1.102292, -1.54197, 1, 0, 0, 1, 1,
-0.3083028, 0.31523, -1.970833, 1, 0, 0, 1, 1,
-0.3059604, -0.08373818, 0.3097239, 1, 0, 0, 1, 1,
-0.304728, -0.681667, -1.011234, 1, 0, 0, 1, 1,
-0.3026445, 0.8975508, 1.39873, 0, 0, 0, 1, 1,
-0.3005057, -0.5585806, -2.627508, 0, 0, 0, 1, 1,
-0.2999397, 1.402897, 0.02904148, 0, 0, 0, 1, 1,
-0.2953864, 0.4011837, -1.205972, 0, 0, 0, 1, 1,
-0.2940983, 1.949314, 0.3393165, 0, 0, 0, 1, 1,
-0.2936157, -0.8978432, -2.806074, 0, 0, 0, 1, 1,
-0.2923996, 0.3744974, -1.988385, 0, 0, 0, 1, 1,
-0.2917185, 2.315666, 2.203263, 1, 1, 1, 1, 1,
-0.2890463, -0.5892204, -2.296936, 1, 1, 1, 1, 1,
-0.2886109, 1.441835, 0.02202186, 1, 1, 1, 1, 1,
-0.2800726, 1.277995, -1.335957, 1, 1, 1, 1, 1,
-0.2783583, -0.002151036, -1.142667, 1, 1, 1, 1, 1,
-0.2764364, -2.132837, -3.955931, 1, 1, 1, 1, 1,
-0.2713618, -0.6475953, -1.941571, 1, 1, 1, 1, 1,
-0.2701846, -1.252585, -4.258735, 1, 1, 1, 1, 1,
-0.2684257, 0.9282701, -1.325667, 1, 1, 1, 1, 1,
-0.2580351, 0.4838947, 1.388415, 1, 1, 1, 1, 1,
-0.2469129, 0.1456479, -0.4918055, 1, 1, 1, 1, 1,
-0.2465798, -0.9716353, -3.383905, 1, 1, 1, 1, 1,
-0.245813, 0.08766857, -0.9409761, 1, 1, 1, 1, 1,
-0.2440552, -1.446469, -0.7572276, 1, 1, 1, 1, 1,
-0.2430788, 0.5230142, -1.183524, 1, 1, 1, 1, 1,
-0.2407504, 0.2378167, 0.1109999, 0, 0, 1, 1, 1,
-0.2403868, 0.3893914, -0.06308962, 1, 0, 0, 1, 1,
-0.2402831, 0.7681384, -0.08199012, 1, 0, 0, 1, 1,
-0.2357992, 0.8885811, -0.6946641, 1, 0, 0, 1, 1,
-0.2314191, 0.8636866, -0.4126169, 1, 0, 0, 1, 1,
-0.2199406, 1.145424, 0.4218151, 1, 0, 0, 1, 1,
-0.2163861, -0.1236999, -2.948924, 0, 0, 0, 1, 1,
-0.2152721, -0.1325998, -2.254316, 0, 0, 0, 1, 1,
-0.2112014, -0.6267546, -3.525199, 0, 0, 0, 1, 1,
-0.2089992, -0.266172, -3.958532, 0, 0, 0, 1, 1,
-0.2079171, -0.7707781, -3.615542, 0, 0, 0, 1, 1,
-0.2067292, 0.2662912, 0.4753138, 0, 0, 0, 1, 1,
-0.2047003, -1.785184, -0.865279, 0, 0, 0, 1, 1,
-0.2036858, -0.1862863, -2.791856, 1, 1, 1, 1, 1,
-0.2023353, -0.2390396, -1.650256, 1, 1, 1, 1, 1,
-0.2021642, -0.5608746, -3.824382, 1, 1, 1, 1, 1,
-0.2005318, 1.039313, -1.153809, 1, 1, 1, 1, 1,
-0.1990803, 0.2847153, -0.7024397, 1, 1, 1, 1, 1,
-0.1961111, -1.211694, -1.8923, 1, 1, 1, 1, 1,
-0.1961104, -0.6499371, -3.858914, 1, 1, 1, 1, 1,
-0.1943866, -1.339816, -5.04852, 1, 1, 1, 1, 1,
-0.1913393, 0.5022438, -0.5274076, 1, 1, 1, 1, 1,
-0.189296, -1.309245, -3.090534, 1, 1, 1, 1, 1,
-0.1880292, -0.3117608, -3.265913, 1, 1, 1, 1, 1,
-0.1859809, 0.05648325, -3.401894, 1, 1, 1, 1, 1,
-0.1794841, 1.661609, 0.8291024, 1, 1, 1, 1, 1,
-0.1791969, 0.8361479, -1.772029, 1, 1, 1, 1, 1,
-0.1779774, -0.2569974, -1.247409, 1, 1, 1, 1, 1,
-0.1755273, -0.1787724, -1.859633, 0, 0, 1, 1, 1,
-0.175279, -0.9795327, -3.516093, 1, 0, 0, 1, 1,
-0.1646938, 0.4262195, -0.6942911, 1, 0, 0, 1, 1,
-0.1565754, -0.03000928, -2.226782, 1, 0, 0, 1, 1,
-0.1463859, -0.2703744, -0.8815866, 1, 0, 0, 1, 1,
-0.145788, -0.7788166, -3.456187, 1, 0, 0, 1, 1,
-0.1442858, 2.012454, -1.583321, 0, 0, 0, 1, 1,
-0.1406898, 0.8571994, -0.03877009, 0, 0, 0, 1, 1,
-0.1353984, 0.7185714, 0.003617945, 0, 0, 0, 1, 1,
-0.1351782, 0.3774575, 0.5147886, 0, 0, 0, 1, 1,
-0.1319897, -0.7371902, -3.799172, 0, 0, 0, 1, 1,
-0.1312637, 0.6848242, -0.1522137, 0, 0, 0, 1, 1,
-0.1245447, 0.514502, 0.2113364, 0, 0, 0, 1, 1,
-0.1237964, -0.3535325, -3.753485, 1, 1, 1, 1, 1,
-0.1221624, -0.6929955, -2.919852, 1, 1, 1, 1, 1,
-0.120968, 1.376142, -0.5676641, 1, 1, 1, 1, 1,
-0.120779, -1.104847, -2.840098, 1, 1, 1, 1, 1,
-0.1172638, -0.4152361, -2.666096, 1, 1, 1, 1, 1,
-0.1160437, -1.111654, -3.12732, 1, 1, 1, 1, 1,
-0.1110129, 0.823288, -1.108211, 1, 1, 1, 1, 1,
-0.1059272, 0.3125566, -1.20516, 1, 1, 1, 1, 1,
-0.1009314, -0.6371595, -2.639811, 1, 1, 1, 1, 1,
-0.1001758, -0.8748757, -2.649282, 1, 1, 1, 1, 1,
-0.09863097, 1.133549, -0.1814276, 1, 1, 1, 1, 1,
-0.09573779, -0.1367983, -0.7419444, 1, 1, 1, 1, 1,
-0.09565839, 0.2238087, 0.3192788, 1, 1, 1, 1, 1,
-0.09452172, -0.02651164, -1.392694, 1, 1, 1, 1, 1,
-0.09184533, 0.8810028, 1.233125, 1, 1, 1, 1, 1,
-0.08972152, 0.1304865, -0.6576637, 0, 0, 1, 1, 1,
-0.08456069, 1.455687, -0.468832, 1, 0, 0, 1, 1,
-0.08396555, 0.2930088, -0.1840286, 1, 0, 0, 1, 1,
-0.08144639, 0.3895442, -1.265021, 1, 0, 0, 1, 1,
-0.0812843, -0.9224695, -4.078096, 1, 0, 0, 1, 1,
-0.07744525, -0.0183913, -1.379964, 1, 0, 0, 1, 1,
-0.07583198, -0.7787413, -1.958069, 0, 0, 0, 1, 1,
-0.0757165, -0.9826513, -3.587475, 0, 0, 0, 1, 1,
-0.07075982, -0.1628628, -2.547003, 0, 0, 0, 1, 1,
-0.07063093, -1.083019, -4.207409, 0, 0, 0, 1, 1,
-0.070608, 0.6355331, -1.585594, 0, 0, 0, 1, 1,
-0.06988645, -1.462457, -2.732632, 0, 0, 0, 1, 1,
-0.06791008, -1.13161, -3.124069, 0, 0, 0, 1, 1,
-0.06447355, -2.907086, -3.094683, 1, 1, 1, 1, 1,
-0.06110735, 0.7039661, -0.1603995, 1, 1, 1, 1, 1,
-0.06083646, 0.176822, -0.1954362, 1, 1, 1, 1, 1,
-0.05904677, -1.562439, -2.966679, 1, 1, 1, 1, 1,
-0.0589196, -0.2152966, -3.39463, 1, 1, 1, 1, 1,
-0.05277678, -0.5716064, -3.017572, 1, 1, 1, 1, 1,
-0.05169225, 0.1212547, 1.471777, 1, 1, 1, 1, 1,
-0.04936568, 0.3660381, 0.6353841, 1, 1, 1, 1, 1,
-0.04730104, -0.2330942, -2.372409, 1, 1, 1, 1, 1,
-0.03963221, 0.0004984046, -2.927525, 1, 1, 1, 1, 1,
-0.0349381, 1.70153, -0.07590403, 1, 1, 1, 1, 1,
-0.03485067, 0.5011985, 0.1868608, 1, 1, 1, 1, 1,
-0.03377151, 0.2653134, -0.03695871, 1, 1, 1, 1, 1,
-0.03208205, -1.670119, -2.87622, 1, 1, 1, 1, 1,
-0.03206707, 1.79337, -1.332918, 1, 1, 1, 1, 1,
-0.03149305, -0.04770466, -2.158529, 0, 0, 1, 1, 1,
-0.03135415, 0.9400309, -1.293351, 1, 0, 0, 1, 1,
-0.02978642, 0.08239845, -0.9313133, 1, 0, 0, 1, 1,
-0.02397009, 0.726366, -1.262762, 1, 0, 0, 1, 1,
-0.02358732, 0.04600861, -0.5683188, 1, 0, 0, 1, 1,
-0.02143514, -0.9381773, -2.166041, 1, 0, 0, 1, 1,
-0.01952841, 0.7112198, 1.165368, 0, 0, 0, 1, 1,
-0.01881297, 0.301377, 1.715381, 0, 0, 0, 1, 1,
-0.01827655, 2.490692, -0.005738186, 0, 0, 0, 1, 1,
-0.01197592, -0.3932253, -2.095903, 0, 0, 0, 1, 1,
-0.01093088, 0.02803238, -0.7500186, 0, 0, 0, 1, 1,
-0.01022063, 0.6278033, 0.6977339, 0, 0, 0, 1, 1,
-0.009845164, 1.728416, 0.3522414, 0, 0, 0, 1, 1,
-0.008056724, 0.1593833, 0.2149755, 1, 1, 1, 1, 1,
-0.002889082, 2.092131, -2.090732, 1, 1, 1, 1, 1,
-0.001907054, -0.1704312, -2.355938, 1, 1, 1, 1, 1,
0.00126382, -1.587767, 3.717507, 1, 1, 1, 1, 1,
0.001977741, 0.1661676, 0.2979195, 1, 1, 1, 1, 1,
0.003315801, -1.171425, 2.684283, 1, 1, 1, 1, 1,
0.004936479, -2.830976, 3.885702, 1, 1, 1, 1, 1,
0.008661231, 0.3608172, -0.2670402, 1, 1, 1, 1, 1,
0.012724, -0.9918603, 2.215856, 1, 1, 1, 1, 1,
0.01711803, -1.297689, 3.180759, 1, 1, 1, 1, 1,
0.01770902, -0.2778147, 3.729369, 1, 1, 1, 1, 1,
0.02927749, 0.8781136, -0.01461065, 1, 1, 1, 1, 1,
0.02966918, 0.5591267, -0.8370663, 1, 1, 1, 1, 1,
0.02991538, -0.7303216, 3.294284, 1, 1, 1, 1, 1,
0.03579838, -0.01793536, 1.575498, 1, 1, 1, 1, 1,
0.04149586, 0.8550884, 2.088767, 0, 0, 1, 1, 1,
0.04574183, -1.757969, 2.842809, 1, 0, 0, 1, 1,
0.04957934, -1.007777, 1.011693, 1, 0, 0, 1, 1,
0.04960831, -0.3655755, 3.242696, 1, 0, 0, 1, 1,
0.05190931, 0.1947486, -1.2141, 1, 0, 0, 1, 1,
0.05229133, -0.9189786, 4.384753, 1, 0, 0, 1, 1,
0.05240436, -0.8613797, 4.019341, 0, 0, 0, 1, 1,
0.05257154, 0.7331839, -1.2809, 0, 0, 0, 1, 1,
0.05494659, 0.5161047, -2.218298, 0, 0, 0, 1, 1,
0.05681054, 2.409011, 1.651736, 0, 0, 0, 1, 1,
0.05717712, -0.7147887, 5.596444, 0, 0, 0, 1, 1,
0.06003948, 0.9684705, -1.702522, 0, 0, 0, 1, 1,
0.06099005, 2.377716, 0.649699, 0, 0, 0, 1, 1,
0.06105567, -0.006355687, 2.587983, 1, 1, 1, 1, 1,
0.06115045, 1.32334, -0.6929125, 1, 1, 1, 1, 1,
0.07185508, -0.729457, 2.160423, 1, 1, 1, 1, 1,
0.07208479, -0.7110462, 5.479593, 1, 1, 1, 1, 1,
0.07437413, 1.513107, 0.6929566, 1, 1, 1, 1, 1,
0.0747282, 2.255441, 0.7152348, 1, 1, 1, 1, 1,
0.08320534, -0.6854495, 2.711039, 1, 1, 1, 1, 1,
0.09095715, 0.8761955, -0.0185321, 1, 1, 1, 1, 1,
0.09232816, 0.4269782, 0.2717745, 1, 1, 1, 1, 1,
0.09322668, -0.07372215, 1.023014, 1, 1, 1, 1, 1,
0.09528293, -2.049037, 3.590217, 1, 1, 1, 1, 1,
0.09884047, -0.02952825, 2.40013, 1, 1, 1, 1, 1,
0.1011029, -0.2809974, 0.8157177, 1, 1, 1, 1, 1,
0.1013053, 1.050415, -0.5621213, 1, 1, 1, 1, 1,
0.1017454, 0.7564498, 0.187627, 1, 1, 1, 1, 1,
0.1047554, 0.8173686, -1.138918, 0, 0, 1, 1, 1,
0.1054955, -0.1997177, 3.068739, 1, 0, 0, 1, 1,
0.1065121, -1.16845, 2.665144, 1, 0, 0, 1, 1,
0.1078344, -0.9936737, 4.301129, 1, 0, 0, 1, 1,
0.1082914, -0.8907338, 1.985559, 1, 0, 0, 1, 1,
0.1084161, -1.445259, 2.832143, 1, 0, 0, 1, 1,
0.1145052, -0.4104387, 1.403937, 0, 0, 0, 1, 1,
0.1172521, -0.4505691, 1.695903, 0, 0, 0, 1, 1,
0.118368, 0.264218, 0.7527593, 0, 0, 0, 1, 1,
0.121557, -0.4184881, 3.432423, 0, 0, 0, 1, 1,
0.1232878, -1.06634, 2.666622, 0, 0, 0, 1, 1,
0.1294613, -1.430506, 4.351763, 0, 0, 0, 1, 1,
0.1349597, -1.952037, 3.554636, 0, 0, 0, 1, 1,
0.1393958, 0.5909157, -1.082031, 1, 1, 1, 1, 1,
0.1434099, 1.139215, 0.6315679, 1, 1, 1, 1, 1,
0.1446037, 0.6667717, 0.6423628, 1, 1, 1, 1, 1,
0.1496592, 0.3580942, 1.532309, 1, 1, 1, 1, 1,
0.1499577, -1.413079, 3.662569, 1, 1, 1, 1, 1,
0.1573049, -1.402928, 3.248784, 1, 1, 1, 1, 1,
0.1589893, -1.227741, 3.646284, 1, 1, 1, 1, 1,
0.1609129, 0.04174201, 0.2261467, 1, 1, 1, 1, 1,
0.1676444, 0.1513551, 0.6188254, 1, 1, 1, 1, 1,
0.1751387, 0.2181147, 0.587701, 1, 1, 1, 1, 1,
0.1797993, -0.1269389, 1.18939, 1, 1, 1, 1, 1,
0.1856881, 0.860693, 2.75102, 1, 1, 1, 1, 1,
0.1865697, -0.6420932, 3.308421, 1, 1, 1, 1, 1,
0.1868403, -2.498749, 3.168018, 1, 1, 1, 1, 1,
0.1894522, 1.671123, -0.09051589, 1, 1, 1, 1, 1,
0.1957292, -0.3976147, 4.914006, 0, 0, 1, 1, 1,
0.196549, 0.0472279, 1.65943, 1, 0, 0, 1, 1,
0.1997862, 0.7314931, -0.6841782, 1, 0, 0, 1, 1,
0.2006782, -0.7296605, 5.812888, 1, 0, 0, 1, 1,
0.2045426, -0.3678119, 3.31913, 1, 0, 0, 1, 1,
0.2095185, -0.5951793, 5.388369, 1, 0, 0, 1, 1,
0.213403, 2.043241, -0.305353, 0, 0, 0, 1, 1,
0.2170572, 1.363316, -0.5922678, 0, 0, 0, 1, 1,
0.2181827, 0.2097654, 2.071749, 0, 0, 0, 1, 1,
0.2221333, 0.2484025, 1.266474, 0, 0, 0, 1, 1,
0.2221463, 1.270572, 1.870462, 0, 0, 0, 1, 1,
0.2235098, 0.357433, -1.738298, 0, 0, 0, 1, 1,
0.2268881, -1.129327, 3.904856, 0, 0, 0, 1, 1,
0.2273556, 0.3182177, 0.8159732, 1, 1, 1, 1, 1,
0.2277649, -1.518733, 1.472749, 1, 1, 1, 1, 1,
0.228469, -0.3629196, 3.096303, 1, 1, 1, 1, 1,
0.2289991, -1.325204, 2.656417, 1, 1, 1, 1, 1,
0.2300246, -0.2599343, 2.357236, 1, 1, 1, 1, 1,
0.2304408, 1.158935, -0.0474087, 1, 1, 1, 1, 1,
0.231811, 0.5432943, -1.527072, 1, 1, 1, 1, 1,
0.2417787, 1.489231, -0.3793748, 1, 1, 1, 1, 1,
0.2492741, 0.1585712, -0.8955085, 1, 1, 1, 1, 1,
0.2494354, -0.2871483, 2.128637, 1, 1, 1, 1, 1,
0.2499116, 0.4204703, -0.1401175, 1, 1, 1, 1, 1,
0.250538, 1.34339, 0.8916578, 1, 1, 1, 1, 1,
0.2516193, 0.8417624, -0.4868883, 1, 1, 1, 1, 1,
0.2538516, -1.077545, 3.785519, 1, 1, 1, 1, 1,
0.2541864, 1.256746, 1.262192, 1, 1, 1, 1, 1,
0.2585021, 0.3891152, -0.8572106, 0, 0, 1, 1, 1,
0.2635479, 0.4074237, -0.1431261, 1, 0, 0, 1, 1,
0.265206, 1.004051, -2.022845, 1, 0, 0, 1, 1,
0.2682858, 0.1459766, 0.9762353, 1, 0, 0, 1, 1,
0.2729405, 0.549967, 0.5140641, 1, 0, 0, 1, 1,
0.2762044, -0.6548998, 2.800696, 1, 0, 0, 1, 1,
0.2778501, -0.1254102, 2.728415, 0, 0, 0, 1, 1,
0.2805298, -0.9962716, 3.291394, 0, 0, 0, 1, 1,
0.2815967, -0.9648744, 1.694131, 0, 0, 0, 1, 1,
0.2849633, -0.1078411, 1.971589, 0, 0, 0, 1, 1,
0.289029, 0.6326235, 1.19846, 0, 0, 0, 1, 1,
0.295079, 0.551043, -0.7880183, 0, 0, 0, 1, 1,
0.2951992, -1.912638, 2.560988, 0, 0, 0, 1, 1,
0.2977225, -1.883047, 1.978042, 1, 1, 1, 1, 1,
0.2990647, 0.2146233, 0.8909004, 1, 1, 1, 1, 1,
0.3138679, 1.498389, 0.2093145, 1, 1, 1, 1, 1,
0.3188208, 1.555939, 1.166824, 1, 1, 1, 1, 1,
0.3240395, 0.70079, 1.476301, 1, 1, 1, 1, 1,
0.3249776, 2.057109, -0.4020979, 1, 1, 1, 1, 1,
0.3271495, 0.9470148, 1.969925, 1, 1, 1, 1, 1,
0.33033, -0.8004572, 3.060789, 1, 1, 1, 1, 1,
0.3310713, -0.7785975, 3.724857, 1, 1, 1, 1, 1,
0.3338383, 0.7082413, 1.508618, 1, 1, 1, 1, 1,
0.3410363, -0.4244677, 4.260328, 1, 1, 1, 1, 1,
0.3416693, 0.1155269, 1.70823, 1, 1, 1, 1, 1,
0.3442757, 0.3555259, 0.3420612, 1, 1, 1, 1, 1,
0.3447241, 0.8784897, -1.26066, 1, 1, 1, 1, 1,
0.3478785, 0.8417014, 2.27138, 1, 1, 1, 1, 1,
0.3557468, 1.75291, 2.454799, 0, 0, 1, 1, 1,
0.3579229, -0.2256903, 3.501905, 1, 0, 0, 1, 1,
0.3582157, 0.6376013, -0.5432689, 1, 0, 0, 1, 1,
0.3607418, -0.1194131, 2.034607, 1, 0, 0, 1, 1,
0.3641796, -0.931549, 3.549702, 1, 0, 0, 1, 1,
0.3664529, 0.1766561, 1.414413, 1, 0, 0, 1, 1,
0.3696515, -1.078111, 2.459605, 0, 0, 0, 1, 1,
0.3698321, 0.0678477, 1.002234, 0, 0, 0, 1, 1,
0.3700503, -0.7262596, 1.875198, 0, 0, 0, 1, 1,
0.37085, 2.036508, 0.2886846, 0, 0, 0, 1, 1,
0.3755193, 0.9288393, 0.6493272, 0, 0, 0, 1, 1,
0.3759352, -0.8778277, 5.050086, 0, 0, 0, 1, 1,
0.3785922, 0.2891497, 1.062822, 0, 0, 0, 1, 1,
0.3810017, 0.927747, -0.493827, 1, 1, 1, 1, 1,
0.3812712, -1.654939, 1.31953, 1, 1, 1, 1, 1,
0.3865106, 1.75651, 1.771001, 1, 1, 1, 1, 1,
0.3998258, -0.6910883, 3.301458, 1, 1, 1, 1, 1,
0.401014, -0.3625267, 2.055435, 1, 1, 1, 1, 1,
0.403172, -0.6712719, 3.68195, 1, 1, 1, 1, 1,
0.4132282, -1.47711, 2.67253, 1, 1, 1, 1, 1,
0.4169029, 1.440466, 1.368231, 1, 1, 1, 1, 1,
0.4175383, -0.9773487, 1.956635, 1, 1, 1, 1, 1,
0.4198314, 0.06392694, 0.9410403, 1, 1, 1, 1, 1,
0.4206893, 1.626549, 0.5192283, 1, 1, 1, 1, 1,
0.4216691, 0.8507078, 0.8242539, 1, 1, 1, 1, 1,
0.4217157, -0.7359861, 2.16031, 1, 1, 1, 1, 1,
0.4236307, -1.326198, 1.751057, 1, 1, 1, 1, 1,
0.4271597, 1.507153, 0.7397619, 1, 1, 1, 1, 1,
0.4311837, 0.6989065, 0.8331937, 0, 0, 1, 1, 1,
0.4314409, -0.2138592, 2.755681, 1, 0, 0, 1, 1,
0.4352607, 0.813408, 0.4949565, 1, 0, 0, 1, 1,
0.4401036, 0.9117438, 0.7217292, 1, 0, 0, 1, 1,
0.4418591, -0.01767485, 1.383825, 1, 0, 0, 1, 1,
0.44224, 0.6735904, 2.700851, 1, 0, 0, 1, 1,
0.4438361, 0.7034049, 1.017877, 0, 0, 0, 1, 1,
0.4439667, 0.269816, 1.136425, 0, 0, 0, 1, 1,
0.4448119, -0.1551452, 2.754011, 0, 0, 0, 1, 1,
0.4476154, 0.5613983, 2.169344, 0, 0, 0, 1, 1,
0.4478101, -1.080314, 1.198056, 0, 0, 0, 1, 1,
0.4506896, -1.966277, 0.06426336, 0, 0, 0, 1, 1,
0.450847, 0.6469377, -0.7986181, 0, 0, 0, 1, 1,
0.4516684, -1.582787, 2.002209, 1, 1, 1, 1, 1,
0.4550918, 0.3645389, 0.7701607, 1, 1, 1, 1, 1,
0.4584899, 0.5159931, 0.0363603, 1, 1, 1, 1, 1,
0.4612696, 0.2749497, -1.236644, 1, 1, 1, 1, 1,
0.4614791, -2.549777, 3.372071, 1, 1, 1, 1, 1,
0.4645626, 1.370737, 0.5734203, 1, 1, 1, 1, 1,
0.464661, 1.865634, 0.965149, 1, 1, 1, 1, 1,
0.4668102, 0.1481988, 0.5218392, 1, 1, 1, 1, 1,
0.475722, -1.265687, 2.714182, 1, 1, 1, 1, 1,
0.4758725, -0.9289947, 2.280876, 1, 1, 1, 1, 1,
0.4759237, 1.430726, -1.045615, 1, 1, 1, 1, 1,
0.4763879, -0.5130205, 1.46937, 1, 1, 1, 1, 1,
0.4784425, -0.05642675, 1.971476, 1, 1, 1, 1, 1,
0.4784625, -0.6152402, 2.601856, 1, 1, 1, 1, 1,
0.48016, 0.6117807, 2.179527, 1, 1, 1, 1, 1,
0.4803339, 0.7025533, -0.1498634, 0, 0, 1, 1, 1,
0.4821543, 1.175917, 1.002608, 1, 0, 0, 1, 1,
0.4856725, 0.829381, -0.02653956, 1, 0, 0, 1, 1,
0.4905268, 0.3363248, 1.806878, 1, 0, 0, 1, 1,
0.4919218, -0.5537502, 2.321724, 1, 0, 0, 1, 1,
0.4934051, -0.07871328, 0.686824, 1, 0, 0, 1, 1,
0.5017443, 0.2384897, 0.7985229, 0, 0, 0, 1, 1,
0.5063147, 1.12769, -0.6800124, 0, 0, 0, 1, 1,
0.508065, 0.245375, 2.051271, 0, 0, 0, 1, 1,
0.5086306, -0.6965999, 3.071419, 0, 0, 0, 1, 1,
0.5090457, 0.5218925, 2.585256, 0, 0, 0, 1, 1,
0.5127347, -0.8391531, 2.452058, 0, 0, 0, 1, 1,
0.5203906, -0.4705308, 1.444821, 0, 0, 0, 1, 1,
0.5232881, 0.1549061, 3.274427, 1, 1, 1, 1, 1,
0.5238345, -0.8890212, 2.465887, 1, 1, 1, 1, 1,
0.5292604, 0.5077835, 0.1595716, 1, 1, 1, 1, 1,
0.5300319, -0.5516972, 2.028907, 1, 1, 1, 1, 1,
0.5321708, 0.379534, 0.4185275, 1, 1, 1, 1, 1,
0.5360425, -0.7318257, 2.043293, 1, 1, 1, 1, 1,
0.5376043, 0.7603252, -0.2815215, 1, 1, 1, 1, 1,
0.5385204, -1.981515, 2.005407, 1, 1, 1, 1, 1,
0.5428911, 0.6583762, 0.4243461, 1, 1, 1, 1, 1,
0.5456809, 0.2337806, 1.728288, 1, 1, 1, 1, 1,
0.5469111, -0.3521297, 2.023415, 1, 1, 1, 1, 1,
0.5485196, -0.08815102, 2.399649, 1, 1, 1, 1, 1,
0.5528316, 0.7800962, -0.338697, 1, 1, 1, 1, 1,
0.5542948, -0.197938, 2.750572, 1, 1, 1, 1, 1,
0.5578703, 0.7556018, 2.095942, 1, 1, 1, 1, 1,
0.5586008, -0.3157145, 2.518228, 0, 0, 1, 1, 1,
0.5617353, -0.3077098, 2.040475, 1, 0, 0, 1, 1,
0.5662285, -0.3222301, 1.127568, 1, 0, 0, 1, 1,
0.5672628, 0.189168, 1.655659, 1, 0, 0, 1, 1,
0.5706194, -0.7085438, 4.318241, 1, 0, 0, 1, 1,
0.5724302, 1.262543, -0.362851, 1, 0, 0, 1, 1,
0.57267, -0.5949208, 0.666578, 0, 0, 0, 1, 1,
0.5735515, 1.370841, 0.6737622, 0, 0, 0, 1, 1,
0.5752507, -0.5540901, -0.02429164, 0, 0, 0, 1, 1,
0.5770348, 1.770091, 1.778115, 0, 0, 0, 1, 1,
0.5773577, -1.051945, 2.334969, 0, 0, 0, 1, 1,
0.5867892, 0.3120872, -0.387094, 0, 0, 0, 1, 1,
0.5886247, -0.09579781, 1.719073, 0, 0, 0, 1, 1,
0.5953364, -0.8207818, 3.846206, 1, 1, 1, 1, 1,
0.5984328, 2.144817, 1.305597, 1, 1, 1, 1, 1,
0.6017531, -1.93125, 3.087316, 1, 1, 1, 1, 1,
0.6033527, -0.319987, 2.479575, 1, 1, 1, 1, 1,
0.6069546, -0.6087384, 2.577491, 1, 1, 1, 1, 1,
0.6100636, 0.1342568, 0.4881722, 1, 1, 1, 1, 1,
0.6119732, -0.6060079, 3.386858, 1, 1, 1, 1, 1,
0.6149943, 0.1072549, 1.920936, 1, 1, 1, 1, 1,
0.6157035, 1.363165, 1.431949, 1, 1, 1, 1, 1,
0.6158855, -0.2123381, 1.136394, 1, 1, 1, 1, 1,
0.6245025, -0.3105067, 0.6208512, 1, 1, 1, 1, 1,
0.6255107, 0.5039497, 1.381843, 1, 1, 1, 1, 1,
0.625513, 0.4524387, 1.121209, 1, 1, 1, 1, 1,
0.6301779, 0.7559029, 0.7772914, 1, 1, 1, 1, 1,
0.6307835, 0.3907196, 0.03092153, 1, 1, 1, 1, 1,
0.6309724, 1.907476, -2.193117, 0, 0, 1, 1, 1,
0.6369195, -0.3165757, 1.989772, 1, 0, 0, 1, 1,
0.6397253, 0.3121533, 1.330074, 1, 0, 0, 1, 1,
0.6414823, 0.2214035, 2.484944, 1, 0, 0, 1, 1,
0.642932, -0.8313903, 2.981651, 1, 0, 0, 1, 1,
0.647454, 0.8907702, 1.807466, 1, 0, 0, 1, 1,
0.6494934, -0.1709434, 3.124527, 0, 0, 0, 1, 1,
0.6502628, 0.6268749, 1.696486, 0, 0, 0, 1, 1,
0.653156, -0.07706352, 1.489447, 0, 0, 0, 1, 1,
0.6562911, -1.275094, 2.440331, 0, 0, 0, 1, 1,
0.6676618, -1.058843, 3.020001, 0, 0, 0, 1, 1,
0.6692818, -1.418839, 3.385783, 0, 0, 0, 1, 1,
0.6694988, 0.1662593, 1.449077, 0, 0, 0, 1, 1,
0.6708866, -0.4242329, 1.614581, 1, 1, 1, 1, 1,
0.6873155, 0.7536992, -0.3585917, 1, 1, 1, 1, 1,
0.6894136, 0.2870776, 1.64214, 1, 1, 1, 1, 1,
0.7031034, -0.335576, 0.7865161, 1, 1, 1, 1, 1,
0.7063551, 0.5682523, 0.1747805, 1, 1, 1, 1, 1,
0.7076922, -1.254305, 2.884624, 1, 1, 1, 1, 1,
0.710009, -0.3409126, 1.436167, 1, 1, 1, 1, 1,
0.712303, -0.211701, 1.542898, 1, 1, 1, 1, 1,
0.7329386, -1.172601, 1.041609, 1, 1, 1, 1, 1,
0.7330144, 0.06263305, 2.239555, 1, 1, 1, 1, 1,
0.7361644, 0.7207562, -1.340644, 1, 1, 1, 1, 1,
0.7363397, 1.010165, 0.3739888, 1, 1, 1, 1, 1,
0.737593, 0.8298491, 0.2692396, 1, 1, 1, 1, 1,
0.7388725, 1.386784, 0.1380424, 1, 1, 1, 1, 1,
0.7485307, 0.2761348, 0.9282313, 1, 1, 1, 1, 1,
0.7539077, 0.7898712, -0.03431747, 0, 0, 1, 1, 1,
0.7603689, 1.423988, 1.976148, 1, 0, 0, 1, 1,
0.7645394, 0.2661345, 3.254525, 1, 0, 0, 1, 1,
0.7672753, 0.6917374, 1.023904, 1, 0, 0, 1, 1,
0.7674044, 0.3967252, 0.7619194, 1, 0, 0, 1, 1,
0.7684889, 0.9159911, 0.7538192, 1, 0, 0, 1, 1,
0.773825, 1.006999, 0.4605834, 0, 0, 0, 1, 1,
0.7752059, 0.6865357, -0.14817, 0, 0, 0, 1, 1,
0.7752567, -2.003281, 2.186717, 0, 0, 0, 1, 1,
0.7777871, -1.079166, 2.968364, 0, 0, 0, 1, 1,
0.7833117, -1.140731, 1.825723, 0, 0, 0, 1, 1,
0.7891964, 1.527835, 0.5648403, 0, 0, 0, 1, 1,
0.7903051, -0.1158239, 1.927554, 0, 0, 0, 1, 1,
0.7918697, 0.4064313, 0.476439, 1, 1, 1, 1, 1,
0.7924892, 1.119752, 0.5730497, 1, 1, 1, 1, 1,
0.7939232, 0.3739956, 2.489153, 1, 1, 1, 1, 1,
0.8003214, -0.3888836, 2.811453, 1, 1, 1, 1, 1,
0.8034443, -0.1137639, 1.372554, 1, 1, 1, 1, 1,
0.8053364, 1.152061, 0.5898177, 1, 1, 1, 1, 1,
0.8186153, 1.77598, 1.572274, 1, 1, 1, 1, 1,
0.8227434, -0.3398795, 1.590449, 1, 1, 1, 1, 1,
0.8245478, 1.646976, -0.7010023, 1, 1, 1, 1, 1,
0.8267747, 1.508232, -0.5723906, 1, 1, 1, 1, 1,
0.8275312, 1.668389, -0.6192977, 1, 1, 1, 1, 1,
0.8284748, 1.080817, 0.8881772, 1, 1, 1, 1, 1,
0.8314142, 0.7670307, 0.2457311, 1, 1, 1, 1, 1,
0.8337095, 0.6907632, 1.020615, 1, 1, 1, 1, 1,
0.8344082, -0.5809983, 1.128269, 1, 1, 1, 1, 1,
0.8402265, 0.6136197, 0.7600893, 0, 0, 1, 1, 1,
0.8498451, -1.144393, 2.742332, 1, 0, 0, 1, 1,
0.8529248, 0.8003898, 0.9615611, 1, 0, 0, 1, 1,
0.8574386, 1.366298, -0.08445737, 1, 0, 0, 1, 1,
0.8600999, -0.410039, 0.5175099, 1, 0, 0, 1, 1,
0.8617992, -0.1727627, 2.510471, 1, 0, 0, 1, 1,
0.8701713, 0.4642186, 1.259376, 0, 0, 0, 1, 1,
0.87252, 0.05995633, 1.195564, 0, 0, 0, 1, 1,
0.8743759, -0.4339451, 3.317994, 0, 0, 0, 1, 1,
0.875446, 0.8496861, 2.05668, 0, 0, 0, 1, 1,
0.875484, -0.5088225, 0.8684697, 0, 0, 0, 1, 1,
0.8785013, 0.1205162, 0.717362, 0, 0, 0, 1, 1,
0.880002, 1.373578, -0.7608961, 0, 0, 0, 1, 1,
0.8806469, 0.0737858, 3.006085, 1, 1, 1, 1, 1,
0.8830543, 0.6704514, 0.9485634, 1, 1, 1, 1, 1,
0.8972046, 0.2957889, 0.3952373, 1, 1, 1, 1, 1,
0.8984382, 3.259162, 0.8690925, 1, 1, 1, 1, 1,
0.8991669, 0.1008418, 1.548169, 1, 1, 1, 1, 1,
0.9065512, 0.1402582, 0.8766738, 1, 1, 1, 1, 1,
0.9076741, -0.2769196, 1.734488, 1, 1, 1, 1, 1,
0.9129556, 0.8259861, 1.038192, 1, 1, 1, 1, 1,
0.9138139, -1.06285, 2.932433, 1, 1, 1, 1, 1,
0.9202143, -0.7543995, 3.585656, 1, 1, 1, 1, 1,
0.9228876, -0.6354151, 0.6102106, 1, 1, 1, 1, 1,
0.9251176, -0.464609, 2.689819, 1, 1, 1, 1, 1,
0.9310294, 0.6413785, 1.056176, 1, 1, 1, 1, 1,
0.9331703, 0.3605009, 0.3188032, 1, 1, 1, 1, 1,
0.9406358, 0.9452822, 2.370961, 1, 1, 1, 1, 1,
0.9456834, -0.8853382, 2.902562, 0, 0, 1, 1, 1,
0.9474161, -0.2870093, 1.835235, 1, 0, 0, 1, 1,
0.9500687, 0.1905525, 1.252228, 1, 0, 0, 1, 1,
0.9588982, -0.6547288, 4.063824, 1, 0, 0, 1, 1,
0.9667739, 0.3392739, 1.269101, 1, 0, 0, 1, 1,
0.9673707, 0.256669, 1.448944, 1, 0, 0, 1, 1,
0.9740885, 1.515835, 1.197016, 0, 0, 0, 1, 1,
0.9750608, -2.510432, 3.205598, 0, 0, 0, 1, 1,
0.9764446, -0.2979397, 0.9863957, 0, 0, 0, 1, 1,
0.9812487, 1.323139, 0.4645437, 0, 0, 0, 1, 1,
0.9828955, -1.178487, 3.684233, 0, 0, 0, 1, 1,
0.9840668, 0.677963, 1.963048, 0, 0, 0, 1, 1,
0.9947717, -1.695592, 1.648244, 0, 0, 0, 1, 1,
0.9981201, 0.8128259, 1.004732, 1, 1, 1, 1, 1,
0.9983172, 0.005671979, 1.92221, 1, 1, 1, 1, 1,
1.000439, -0.4960774, 2.49673, 1, 1, 1, 1, 1,
1.00149, 1.044321, 0.5355017, 1, 1, 1, 1, 1,
1.008991, -0.02697321, 1.388631, 1, 1, 1, 1, 1,
1.015491, -1.216092, 3.298139, 1, 1, 1, 1, 1,
1.016863, 0.6629002, 1.401162, 1, 1, 1, 1, 1,
1.018283, -0.1390186, 0.6986061, 1, 1, 1, 1, 1,
1.022095, 0.9141908, 0.9681777, 1, 1, 1, 1, 1,
1.023126, 0.3882057, 0.1174602, 1, 1, 1, 1, 1,
1.024187, 1.289696, 0.4358315, 1, 1, 1, 1, 1,
1.033062, 1.297839, 3.49577, 1, 1, 1, 1, 1,
1.036911, -0.2514684, 1.111081, 1, 1, 1, 1, 1,
1.041186, -2.015377, 2.352631, 1, 1, 1, 1, 1,
1.045413, 0.9111799, 1.196074, 1, 1, 1, 1, 1,
1.048209, 1.693894, 3.711283, 0, 0, 1, 1, 1,
1.054618, 1.305769, 1.934365, 1, 0, 0, 1, 1,
1.059345, -2.362069, 0.9302214, 1, 0, 0, 1, 1,
1.061571, -0.3995244, 0.9478857, 1, 0, 0, 1, 1,
1.062579, -1.948251, 1.875916, 1, 0, 0, 1, 1,
1.065048, -1.682508, 0.5111933, 1, 0, 0, 1, 1,
1.08481, 0.9535616, 1.167344, 0, 0, 0, 1, 1,
1.094151, -0.4156703, 1.919805, 0, 0, 0, 1, 1,
1.09516, 0.3699659, 1.597422, 0, 0, 0, 1, 1,
1.098292, -0.2692748, 1.456118, 0, 0, 0, 1, 1,
1.100817, -0.2559949, 0.126848, 0, 0, 0, 1, 1,
1.102911, 1.736236, 0.09857203, 0, 0, 0, 1, 1,
1.105358, -0.182081, 1.392904, 0, 0, 0, 1, 1,
1.108601, -0.04154566, 0.9835357, 1, 1, 1, 1, 1,
1.112672, -0.3194865, 2.385012, 1, 1, 1, 1, 1,
1.116598, 0.6479899, 2.359912, 1, 1, 1, 1, 1,
1.120755, -0.683707, 0.8600062, 1, 1, 1, 1, 1,
1.130155, -1.38324, 3.354003, 1, 1, 1, 1, 1,
1.130597, -0.03961972, 0.5522636, 1, 1, 1, 1, 1,
1.136627, 2.798795, 0.2256717, 1, 1, 1, 1, 1,
1.136696, 0.5150931, -1.382808, 1, 1, 1, 1, 1,
1.144291, -1.028383, 0.6266885, 1, 1, 1, 1, 1,
1.14678, 1.749932, 0.6081845, 1, 1, 1, 1, 1,
1.147243, 0.5269359, 0.2119648, 1, 1, 1, 1, 1,
1.148956, 0.8932495, 2.024881, 1, 1, 1, 1, 1,
1.155202, 0.6021849, 1.598614, 1, 1, 1, 1, 1,
1.159318, -0.8538207, 2.75355, 1, 1, 1, 1, 1,
1.160038, -0.6832399, 1.114805, 1, 1, 1, 1, 1,
1.170294, 0.7309145, 0.4169796, 0, 0, 1, 1, 1,
1.171536, -0.2982371, 0.04989742, 1, 0, 0, 1, 1,
1.177734, -2.300184, 2.079269, 1, 0, 0, 1, 1,
1.183885, -1.876967, 3.266095, 1, 0, 0, 1, 1,
1.185429, 0.04326126, 2.923376, 1, 0, 0, 1, 1,
1.189865, -0.7525387, 2.013386, 1, 0, 0, 1, 1,
1.194856, 0.06227997, 0.5334639, 0, 0, 0, 1, 1,
1.199346, 0.2641609, 1.542171, 0, 0, 0, 1, 1,
1.238918, -0.9116941, -0.1192403, 0, 0, 0, 1, 1,
1.23955, -1.110961, 2.5301, 0, 0, 0, 1, 1,
1.240345, 0.9597824, 0.4996226, 0, 0, 0, 1, 1,
1.243636, -1.200558, 0.4464743, 0, 0, 0, 1, 1,
1.244209, -0.3071909, 3.261108, 0, 0, 0, 1, 1,
1.24591, 0.5415258, 0.1908156, 1, 1, 1, 1, 1,
1.246031, 0.9399117, 1.093828, 1, 1, 1, 1, 1,
1.251573, 1.13186, 0.3592074, 1, 1, 1, 1, 1,
1.251914, -1.544154, 2.168002, 1, 1, 1, 1, 1,
1.258157, -1.30238, 1.923322, 1, 1, 1, 1, 1,
1.263573, 1.509958, 2.008795, 1, 1, 1, 1, 1,
1.269175, -0.1248093, 1.596809, 1, 1, 1, 1, 1,
1.277529, -1.511399, 2.933426, 1, 1, 1, 1, 1,
1.285138, 0.1984009, 0.449376, 1, 1, 1, 1, 1,
1.292782, -0.1831438, 3.361955, 1, 1, 1, 1, 1,
1.293261, 0.8710449, -0.747724, 1, 1, 1, 1, 1,
1.300324, 3.168801, -0.2807147, 1, 1, 1, 1, 1,
1.305538, -0.7817863, 2.621721, 1, 1, 1, 1, 1,
1.308578, -2.125867, 3.523662, 1, 1, 1, 1, 1,
1.308661, -0.7904583, 2.726263, 1, 1, 1, 1, 1,
1.313286, 0.5627512, 0.5217285, 0, 0, 1, 1, 1,
1.314145, -0.529213, 1.401222, 1, 0, 0, 1, 1,
1.318544, 0.4709568, 2.537473, 1, 0, 0, 1, 1,
1.329182, -2.259384, 4.467266, 1, 0, 0, 1, 1,
1.337938, -0.4568487, -0.03364725, 1, 0, 0, 1, 1,
1.339673, 0.2018475, 1.700246, 1, 0, 0, 1, 1,
1.339808, 0.01187752, 1.349437, 0, 0, 0, 1, 1,
1.344034, -0.6719544, 1.645171, 0, 0, 0, 1, 1,
1.350751, 0.4044321, 0.3416874, 0, 0, 0, 1, 1,
1.35528, 0.6504018, 0.4412698, 0, 0, 0, 1, 1,
1.360062, -0.8935128, 0.8917699, 0, 0, 0, 1, 1,
1.376294, 1.894884, -0.8188236, 0, 0, 0, 1, 1,
1.39854, -1.233121, 3.679011, 0, 0, 0, 1, 1,
1.402721, 1.685972, 1.589912, 1, 1, 1, 1, 1,
1.4037, -1.430684, 1.68761, 1, 1, 1, 1, 1,
1.414226, -0.4206816, 1.474249, 1, 1, 1, 1, 1,
1.436249, -1.201252, 2.889094, 1, 1, 1, 1, 1,
1.442276, 0.249751, 2.847411, 1, 1, 1, 1, 1,
1.459791, 0.749484, 2.23097, 1, 1, 1, 1, 1,
1.464611, 0.3526472, 1.989039, 1, 1, 1, 1, 1,
1.492616, 1.0979, -0.9860609, 1, 1, 1, 1, 1,
1.520608, -0.6880074, 2.348728, 1, 1, 1, 1, 1,
1.531062, -0.1487225, 0.1031482, 1, 1, 1, 1, 1,
1.557483, -0.3514763, 3.111333, 1, 1, 1, 1, 1,
1.564289, 2.511636, -1.585255, 1, 1, 1, 1, 1,
1.565521, 0.348798, -0.0224102, 1, 1, 1, 1, 1,
1.575382, -0.4133923, -0.2606492, 1, 1, 1, 1, 1,
1.579469, 0.3779615, 1.941579, 1, 1, 1, 1, 1,
1.580413, 1.304071, 1.527002, 0, 0, 1, 1, 1,
1.591956, -0.6271208, 2.068396, 1, 0, 0, 1, 1,
1.592607, 0.7671685, 2.042456, 1, 0, 0, 1, 1,
1.593767, 0.1596667, 1.939796, 1, 0, 0, 1, 1,
1.594364, -0.3946747, 3.655746, 1, 0, 0, 1, 1,
1.605322, -0.1214995, 1.069273, 1, 0, 0, 1, 1,
1.61334, 0.4082339, 2.04635, 0, 0, 0, 1, 1,
1.623888, 1.085809, 2.118764, 0, 0, 0, 1, 1,
1.624259, 0.7876034, 1.181006, 0, 0, 0, 1, 1,
1.632373, -0.7301776, 2.495749, 0, 0, 0, 1, 1,
1.637412, -1.269176, 4.262197, 0, 0, 0, 1, 1,
1.642054, -0.2396004, 2.207875, 0, 0, 0, 1, 1,
1.643676, 0.1658793, 2.847759, 0, 0, 0, 1, 1,
1.663707, -0.5549701, 0.7851315, 1, 1, 1, 1, 1,
1.672083, -0.8442301, 1.393178, 1, 1, 1, 1, 1,
1.689521, -0.3714392, 3.477386, 1, 1, 1, 1, 1,
1.691399, -0.1500451, 2.586193, 1, 1, 1, 1, 1,
1.692741, -0.6101174, 2.469754, 1, 1, 1, 1, 1,
1.705697, 0.5275885, 3.058283, 1, 1, 1, 1, 1,
1.72802, -2.046993, 3.305864, 1, 1, 1, 1, 1,
1.752034, 0.1157428, 0.07724591, 1, 1, 1, 1, 1,
1.7662, 0.9347318, 2.28587, 1, 1, 1, 1, 1,
1.769371, -0.1650646, 1.330424, 1, 1, 1, 1, 1,
1.77374, -0.33275, 1.965232, 1, 1, 1, 1, 1,
1.781674, -0.4316643, 3.56099, 1, 1, 1, 1, 1,
1.793833, 1.888974, 1.828864, 1, 1, 1, 1, 1,
1.798071, -1.278446, 2.123634, 1, 1, 1, 1, 1,
1.799863, 0.7273489, 2.369689, 1, 1, 1, 1, 1,
1.80613, 1.430303, 3.324663, 0, 0, 1, 1, 1,
1.808495, 0.5748328, 0.2988731, 1, 0, 0, 1, 1,
1.815454, -0.693754, 3.70783, 1, 0, 0, 1, 1,
1.823122, -0.2359592, 0.7615029, 1, 0, 0, 1, 1,
1.834447, 0.006187262, 1.241808, 1, 0, 0, 1, 1,
1.836703, 0.2015046, 1.503515, 1, 0, 0, 1, 1,
1.857445, -0.7627897, 1.914124, 0, 0, 0, 1, 1,
1.86878, 0.8539352, 2.491337, 0, 0, 0, 1, 1,
1.898519, 0.1969993, 0.6162511, 0, 0, 0, 1, 1,
1.901353, 0.3153858, 0.6830251, 0, 0, 0, 1, 1,
1.904025, 0.6609807, 2.359804, 0, 0, 0, 1, 1,
1.927706, -0.5434743, 1.092973, 0, 0, 0, 1, 1,
1.944903, 0.1581549, 1.523806, 0, 0, 0, 1, 1,
1.945397, 0.03676888, 2.532537, 1, 1, 1, 1, 1,
1.956756, 0.620293, 0.4320953, 1, 1, 1, 1, 1,
1.969094, 0.8307428, 0.4499411, 1, 1, 1, 1, 1,
1.977901, 3.098479, 1.252128, 1, 1, 1, 1, 1,
1.983801, -0.8056211, 2.732405, 1, 1, 1, 1, 1,
1.984124, 1.858082, 1.40695, 1, 1, 1, 1, 1,
1.993545, -2.401707, 1.160954, 1, 1, 1, 1, 1,
2.001805, -0.3003737, 0.752432, 1, 1, 1, 1, 1,
2.009317, 0.07826478, 0.7815449, 1, 1, 1, 1, 1,
2.020657, -1.038003, 2.981136, 1, 1, 1, 1, 1,
2.025289, -0.1903736, 1.109399, 1, 1, 1, 1, 1,
2.035074, -0.1014616, 1.301318, 1, 1, 1, 1, 1,
2.041378, 1.219995, 1.032609, 1, 1, 1, 1, 1,
2.067033, 0.1172598, 0.4430099, 1, 1, 1, 1, 1,
2.067048, 0.9340293, 0.3034343, 1, 1, 1, 1, 1,
2.083689, -1.831336, 1.193012, 0, 0, 1, 1, 1,
2.087417, -1.171165, 1.29332, 1, 0, 0, 1, 1,
2.105495, -0.5435805, 1.769121, 1, 0, 0, 1, 1,
2.124901, -0.489019, 5.064165, 1, 0, 0, 1, 1,
2.164703, -1.356475, 2.467623, 1, 0, 0, 1, 1,
2.179008, -0.1325687, 1.927178, 1, 0, 0, 1, 1,
2.232172, -0.05474298, 1.397683, 0, 0, 0, 1, 1,
2.293621, 1.317431, 0.6334385, 0, 0, 0, 1, 1,
2.380323, 0.4816518, 0.7796574, 0, 0, 0, 1, 1,
2.385937, 1.454478, 0.06740522, 0, 0, 0, 1, 1,
2.506972, 2.210535, 0.4130263, 0, 0, 0, 1, 1,
2.647121, 0.3544162, 2.449572, 0, 0, 0, 1, 1,
2.666327, 1.595937, 2.901554, 0, 0, 0, 1, 1,
2.686255, 0.8177882, -1.30929, 1, 1, 1, 1, 1,
2.763783, -0.3440904, 1.201579, 1, 1, 1, 1, 1,
2.791623, 1.344121, 2.566432, 1, 1, 1, 1, 1,
2.799754, -0.2546461, 0.5497472, 1, 1, 1, 1, 1,
2.963294, -0.07851494, 0.2356775, 1, 1, 1, 1, 1,
2.990477, -1.150496, 1.118402, 1, 1, 1, 1, 1,
3.207911, 1.536057, 0.7697436, 1, 1, 1, 1, 1
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
var radius = 9.755129;
var distance = 34.26448;
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
mvMatrix.translate( -0.05620289, -0.3879577, -0.2831781 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.26448);
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
