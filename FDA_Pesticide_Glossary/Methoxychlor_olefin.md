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
-3.059228, -0.8136525, -1.989833, 1, 0, 0, 1,
-2.64521, -0.7817751, -0.9274574, 1, 0.007843138, 0, 1,
-2.51441, 0.4095428, -1.012088, 1, 0.01176471, 0, 1,
-2.472471, -0.008076151, 0.2897578, 1, 0.01960784, 0, 1,
-2.428941, 0.8324389, -2.271515, 1, 0.02352941, 0, 1,
-2.40272, -0.8671629, -1.666853, 1, 0.03137255, 0, 1,
-2.38993, 0.6643942, -1.137298, 1, 0.03529412, 0, 1,
-2.380017, 0.7261326, 0.3822177, 1, 0.04313726, 0, 1,
-2.301062, -0.964034, -0.5718698, 1, 0.04705882, 0, 1,
-2.284167, 0.57945, -0.9785799, 1, 0.05490196, 0, 1,
-2.265392, -0.3929414, -2.578415, 1, 0.05882353, 0, 1,
-2.250202, -1.155323, -3.544575, 1, 0.06666667, 0, 1,
-2.244292, -0.5989853, -1.670792, 1, 0.07058824, 0, 1,
-2.172323, 1.784912, 0.2622954, 1, 0.07843138, 0, 1,
-2.148129, 0.3943099, 0.4174149, 1, 0.08235294, 0, 1,
-2.125789, 0.7984167, -0.4480787, 1, 0.09019608, 0, 1,
-2.091368, -1.619361, -1.975703, 1, 0.09411765, 0, 1,
-2.086897, 0.9509342, -2.128798, 1, 0.1019608, 0, 1,
-2.086337, -0.4859212, -2.851112, 1, 0.1098039, 0, 1,
-2.077822, 1.330615, -1.871925, 1, 0.1137255, 0, 1,
-2.05732, 0.5782657, -0.275868, 1, 0.1215686, 0, 1,
-2.039486, 0.3605852, -2.021907, 1, 0.1254902, 0, 1,
-2.03047, -1.030184, -1.880639, 1, 0.1333333, 0, 1,
-1.975558, -0.0156822, -1.517606, 1, 0.1372549, 0, 1,
-1.9298, -1.003482, -1.368705, 1, 0.145098, 0, 1,
-1.927826, 1.961098e-05, -0.6957191, 1, 0.1490196, 0, 1,
-1.886201, -0.5116361, -1.90366, 1, 0.1568628, 0, 1,
-1.886047, -0.3300192, -2.814173, 1, 0.1607843, 0, 1,
-1.873283, -0.5755998, -1.812832, 1, 0.1686275, 0, 1,
-1.827656, 0.9598142, -1.050126, 1, 0.172549, 0, 1,
-1.825502, -1.211063, -3.104702, 1, 0.1803922, 0, 1,
-1.823479, -0.3478526, -2.887612, 1, 0.1843137, 0, 1,
-1.819693, 0.206964, -3.716708, 1, 0.1921569, 0, 1,
-1.803871, -0.4149132, -1.905447, 1, 0.1960784, 0, 1,
-1.793675, 0.270025, -1.926935, 1, 0.2039216, 0, 1,
-1.792995, -0.169643, 0.01258908, 1, 0.2117647, 0, 1,
-1.777816, 0.007176784, -0.5664083, 1, 0.2156863, 0, 1,
-1.769965, -1.426665, -2.220665, 1, 0.2235294, 0, 1,
-1.767421, -0.6404808, -3.368729, 1, 0.227451, 0, 1,
-1.732419, 0.1053232, -4.079317, 1, 0.2352941, 0, 1,
-1.732118, -1.038352, -1.480217, 1, 0.2392157, 0, 1,
-1.711836, -1.618473, -2.912367, 1, 0.2470588, 0, 1,
-1.709676, 0.4122536, -2.180918, 1, 0.2509804, 0, 1,
-1.702351, 0.4796336, -1.836608, 1, 0.2588235, 0, 1,
-1.688874, 0.8571042, -1.408039, 1, 0.2627451, 0, 1,
-1.678927, -0.3528085, -2.464952, 1, 0.2705882, 0, 1,
-1.669185, -1.804733, -1.539359, 1, 0.2745098, 0, 1,
-1.658953, 1.36812, 0.5885773, 1, 0.282353, 0, 1,
-1.649161, 0.6818238, 1.908934, 1, 0.2862745, 0, 1,
-1.638604, 0.005893869, -1.526342, 1, 0.2941177, 0, 1,
-1.629248, -0.236108, -2.386512, 1, 0.3019608, 0, 1,
-1.628129, 1.347932, -0.9501097, 1, 0.3058824, 0, 1,
-1.626071, -0.06808038, -2.330479, 1, 0.3137255, 0, 1,
-1.623683, -2.005744, -1.230656, 1, 0.3176471, 0, 1,
-1.617767, -0.8248468, -1.782135, 1, 0.3254902, 0, 1,
-1.611694, -0.1819454, -1.531055, 1, 0.3294118, 0, 1,
-1.611262, -0.4165324, -1.185116, 1, 0.3372549, 0, 1,
-1.605643, -1.262413, -2.120792, 1, 0.3411765, 0, 1,
-1.591324, 1.512738, 0.3155656, 1, 0.3490196, 0, 1,
-1.586812, 0.8935229, -4.479709, 1, 0.3529412, 0, 1,
-1.566782, -0.633087, -1.428346, 1, 0.3607843, 0, 1,
-1.548178, -0.4867319, -2.799882, 1, 0.3647059, 0, 1,
-1.534581, 0.6227445, -0.6525196, 1, 0.372549, 0, 1,
-1.529613, 0.2004533, -1.475216, 1, 0.3764706, 0, 1,
-1.516458, 0.7797189, -0.4124927, 1, 0.3843137, 0, 1,
-1.512536, 1.604572, -0.9483238, 1, 0.3882353, 0, 1,
-1.511714, -0.9191583, -4.033654, 1, 0.3960784, 0, 1,
-1.505032, 0.3845774, -0.6724524, 1, 0.4039216, 0, 1,
-1.504421, -1.104038, -1.987802, 1, 0.4078431, 0, 1,
-1.502254, -0.9070091, -2.337142, 1, 0.4156863, 0, 1,
-1.491049, 0.327791, -1.849256, 1, 0.4196078, 0, 1,
-1.489932, -0.4646737, -1.609662, 1, 0.427451, 0, 1,
-1.486605, 2.446045, -1.403953, 1, 0.4313726, 0, 1,
-1.47585, 0.1641777, -2.585475, 1, 0.4392157, 0, 1,
-1.472433, 1.324879, -0.1338484, 1, 0.4431373, 0, 1,
-1.452828, -1.523097, -2.045928, 1, 0.4509804, 0, 1,
-1.448583, -0.6941558, 0.4629442, 1, 0.454902, 0, 1,
-1.433402, -0.4688937, -2.492324, 1, 0.4627451, 0, 1,
-1.430573, 1.22615, 0.6531121, 1, 0.4666667, 0, 1,
-1.430543, 0.9532018, -0.399596, 1, 0.4745098, 0, 1,
-1.414504, 0.4003017, -3.477328, 1, 0.4784314, 0, 1,
-1.412455, 0.0869939, -1.680462, 1, 0.4862745, 0, 1,
-1.411852, 1.311057, -2.796353, 1, 0.4901961, 0, 1,
-1.411428, 1.373943, -0.06483276, 1, 0.4980392, 0, 1,
-1.409904, 0.6232316, -0.5503413, 1, 0.5058824, 0, 1,
-1.4029, -0.008996973, -0.5566087, 1, 0.509804, 0, 1,
-1.40194, -0.2764045, -2.486662, 1, 0.5176471, 0, 1,
-1.398029, 0.9544287, -2.251607, 1, 0.5215687, 0, 1,
-1.394388, 0.3727587, -0.02990554, 1, 0.5294118, 0, 1,
-1.393186, 0.5876021, -1.563711, 1, 0.5333334, 0, 1,
-1.382842, 0.07834781, -0.9188263, 1, 0.5411765, 0, 1,
-1.378036, -1.550158, -1.254113, 1, 0.5450981, 0, 1,
-1.377425, -0.03496275, -2.878931, 1, 0.5529412, 0, 1,
-1.351888, -1.411606, 0.05452386, 1, 0.5568628, 0, 1,
-1.351616, -0.4130328, -0.7390263, 1, 0.5647059, 0, 1,
-1.34664, -0.7479305, -1.475814, 1, 0.5686275, 0, 1,
-1.346328, 1.900473, -2.70855, 1, 0.5764706, 0, 1,
-1.344814, -1.481292, -2.271939, 1, 0.5803922, 0, 1,
-1.340958, -0.5526127, -2.072838, 1, 0.5882353, 0, 1,
-1.338084, 1.087529, -1.214481, 1, 0.5921569, 0, 1,
-1.331199, -0.7031522, -2.780325, 1, 0.6, 0, 1,
-1.330465, 1.527764, 1.608355, 1, 0.6078432, 0, 1,
-1.327525, 0.002098948, -0.8607187, 1, 0.6117647, 0, 1,
-1.319165, 1.00611, -1.443203, 1, 0.6196079, 0, 1,
-1.313337, 1.117512, -1.75431, 1, 0.6235294, 0, 1,
-1.309384, -0.6665699, -1.621088, 1, 0.6313726, 0, 1,
-1.307182, -0.08653005, -1.594411, 1, 0.6352941, 0, 1,
-1.306661, 2.754712, -1.183407, 1, 0.6431373, 0, 1,
-1.306651, -0.1572576, -2.294612, 1, 0.6470588, 0, 1,
-1.30434, -0.4080772, -2.771124, 1, 0.654902, 0, 1,
-1.2998, -0.4352814, -3.915485, 1, 0.6588235, 0, 1,
-1.296371, -0.7447451, -2.544137, 1, 0.6666667, 0, 1,
-1.292052, 0.9731113, -1.222601, 1, 0.6705883, 0, 1,
-1.289818, -1.938534, -0.5973676, 1, 0.6784314, 0, 1,
-1.287838, 1.403947, -0.2004591, 1, 0.682353, 0, 1,
-1.278089, -0.1387926, -2.542834, 1, 0.6901961, 0, 1,
-1.275945, -0.04571576, -2.813264, 1, 0.6941177, 0, 1,
-1.273339, 1.114881, -1.392718, 1, 0.7019608, 0, 1,
-1.272571, 1.540035, -1.31034, 1, 0.7098039, 0, 1,
-1.270073, -1.45914, -4.633724, 1, 0.7137255, 0, 1,
-1.265847, 1.437981, 0.4828188, 1, 0.7215686, 0, 1,
-1.248544, -0.1650316, -2.353104, 1, 0.7254902, 0, 1,
-1.235353, -0.31265, -0.4945762, 1, 0.7333333, 0, 1,
-1.231906, -0.5052232, -1.099055, 1, 0.7372549, 0, 1,
-1.231642, 0.4196903, -0.2354359, 1, 0.7450981, 0, 1,
-1.231024, 2.538418, -0.3066208, 1, 0.7490196, 0, 1,
-1.230563, -0.3732247, -0.8584267, 1, 0.7568628, 0, 1,
-1.227695, 0.1015824, -1.221801, 1, 0.7607843, 0, 1,
-1.227653, 0.9617741, -1.079586, 1, 0.7686275, 0, 1,
-1.227398, -0.415504, -2.064733, 1, 0.772549, 0, 1,
-1.221918, -0.2653646, -1.822671, 1, 0.7803922, 0, 1,
-1.221847, 0.6084314, -1.685607, 1, 0.7843137, 0, 1,
-1.216698, 0.5253251, -0.8078519, 1, 0.7921569, 0, 1,
-1.204683, 0.2119253, -3.010844, 1, 0.7960784, 0, 1,
-1.204019, -0.2302803, -0.03582133, 1, 0.8039216, 0, 1,
-1.20258, 0.7155042, -1.106681, 1, 0.8117647, 0, 1,
-1.200369, 2.552707, 0.8231548, 1, 0.8156863, 0, 1,
-1.194379, 2.10438, 0.1191522, 1, 0.8235294, 0, 1,
-1.19273, -0.8982182, -2.942666, 1, 0.827451, 0, 1,
-1.186673, 0.9389465, -0.8117535, 1, 0.8352941, 0, 1,
-1.17978, 0.4396067, 0.001122964, 1, 0.8392157, 0, 1,
-1.179193, 0.1404607, -1.743712, 1, 0.8470588, 0, 1,
-1.174752, -2.484676, -4.498983, 1, 0.8509804, 0, 1,
-1.173143, -0.4930336, -1.660479, 1, 0.8588235, 0, 1,
-1.171419, 0.6210546, -1.326789, 1, 0.8627451, 0, 1,
-1.167269, 0.1220959, -1.01014, 1, 0.8705882, 0, 1,
-1.165058, 0.2571474, -2.14871, 1, 0.8745098, 0, 1,
-1.162382, -0.8576249, -2.594117, 1, 0.8823529, 0, 1,
-1.146144, 1.86842, 0.9993209, 1, 0.8862745, 0, 1,
-1.14446, 0.2196843, 0.08511893, 1, 0.8941177, 0, 1,
-1.144408, 0.4995228, -2.071569, 1, 0.8980392, 0, 1,
-1.141455, -0.8367679, -0.389484, 1, 0.9058824, 0, 1,
-1.137999, -1.231098, -2.504888, 1, 0.9137255, 0, 1,
-1.136163, -0.3181942, -2.182136, 1, 0.9176471, 0, 1,
-1.134474, -0.06887019, -1.715498, 1, 0.9254902, 0, 1,
-1.129973, 1.0696, -1.57398, 1, 0.9294118, 0, 1,
-1.126728, 0.4069209, -1.02274, 1, 0.9372549, 0, 1,
-1.124654, -1.093858, -3.798661, 1, 0.9411765, 0, 1,
-1.124429, -0.4667035, -3.193842, 1, 0.9490196, 0, 1,
-1.121161, -0.5383542, 0.02868727, 1, 0.9529412, 0, 1,
-1.117042, -0.8837951, -3.739959, 1, 0.9607843, 0, 1,
-1.117038, 0.3729939, -0.4622228, 1, 0.9647059, 0, 1,
-1.10918, 0.02099883, -1.679868, 1, 0.972549, 0, 1,
-1.107774, 0.6462461, -0.6313677, 1, 0.9764706, 0, 1,
-1.107772, 0.1395019, -1.716138, 1, 0.9843137, 0, 1,
-1.105505, 0.203503, -0.2019724, 1, 0.9882353, 0, 1,
-1.10232, -2.542022, -2.452541, 1, 0.9960784, 0, 1,
-1.100986, 2.307187, -0.9269301, 0.9960784, 1, 0, 1,
-1.096909, 1.169923, -0.4666881, 0.9921569, 1, 0, 1,
-1.094626, 0.4495545, -3.032349, 0.9843137, 1, 0, 1,
-1.092805, -0.6939835, -2.963064, 0.9803922, 1, 0, 1,
-1.092503, -1.472156, -3.119745, 0.972549, 1, 0, 1,
-1.088926, 1.033204, -0.4900634, 0.9686275, 1, 0, 1,
-1.085845, 0.4266481, -0.09433521, 0.9607843, 1, 0, 1,
-1.085605, -1.561272, -2.748938, 0.9568627, 1, 0, 1,
-1.08324, -1.905145, -2.602335, 0.9490196, 1, 0, 1,
-1.078549, -0.8019484, -2.479859, 0.945098, 1, 0, 1,
-1.067329, 0.9870167, 0.3779315, 0.9372549, 1, 0, 1,
-1.065865, -0.1041807, -1.394692, 0.9333333, 1, 0, 1,
-1.06484, 1.475567, -1.742453, 0.9254902, 1, 0, 1,
-1.064377, 0.3967556, -0.4724771, 0.9215686, 1, 0, 1,
-1.062795, 0.0949902, -1.604932, 0.9137255, 1, 0, 1,
-1.062778, -0.04272406, -1.020213, 0.9098039, 1, 0, 1,
-1.061206, 0.4428709, 0.3391544, 0.9019608, 1, 0, 1,
-1.05734, -1.123222, -2.463308, 0.8941177, 1, 0, 1,
-1.056773, -0.1031866, -2.809553, 0.8901961, 1, 0, 1,
-1.056542, 0.4106281, -0.6028034, 0.8823529, 1, 0, 1,
-1.054377, -0.900661, -2.02323, 0.8784314, 1, 0, 1,
-1.053303, 2.03881, -0.5987617, 0.8705882, 1, 0, 1,
-1.052989, -3.400223, -2.233146, 0.8666667, 1, 0, 1,
-1.048915, -0.6874254, -3.861299, 0.8588235, 1, 0, 1,
-1.043485, -0.6533132, -0.7803527, 0.854902, 1, 0, 1,
-1.043204, 0.2453565, -0.1949447, 0.8470588, 1, 0, 1,
-1.039299, -0.377459, -1.443178, 0.8431373, 1, 0, 1,
-1.038193, 0.7711837, -2.225424, 0.8352941, 1, 0, 1,
-1.024192, -0.5452487, -1.80757, 0.8313726, 1, 0, 1,
-1.021508, 0.8132264, -0.04506035, 0.8235294, 1, 0, 1,
-1.013002, -0.5915732, -2.864809, 0.8196079, 1, 0, 1,
-1.008538, 0.8858627, -0.9667873, 0.8117647, 1, 0, 1,
-1.007074, -0.9343821, -2.010919, 0.8078431, 1, 0, 1,
-0.9963745, -0.4406145, -1.983459, 0.8, 1, 0, 1,
-0.9958956, -0.06836558, -1.22116, 0.7921569, 1, 0, 1,
-0.9940919, -0.8743774, -4.053116, 0.7882353, 1, 0, 1,
-0.9928699, 1.474925, -0.8614776, 0.7803922, 1, 0, 1,
-0.9871415, 0.8450691, -0.4272535, 0.7764706, 1, 0, 1,
-0.9860783, -0.7515953, -2.538254, 0.7686275, 1, 0, 1,
-0.9787942, -0.02918365, 0.1401274, 0.7647059, 1, 0, 1,
-0.9781696, 2.653664, 0.2162511, 0.7568628, 1, 0, 1,
-0.9761692, 2.515409, 0.01229249, 0.7529412, 1, 0, 1,
-0.97588, -0.2218057, -3.91512, 0.7450981, 1, 0, 1,
-0.9741138, -0.4119714, -1.93405, 0.7411765, 1, 0, 1,
-0.9732178, -0.2682489, -0.145512, 0.7333333, 1, 0, 1,
-0.9701859, 0.8297155, -0.1203352, 0.7294118, 1, 0, 1,
-0.966081, 0.4229667, -2.53099, 0.7215686, 1, 0, 1,
-0.9648947, 0.3729847, -2.810819, 0.7176471, 1, 0, 1,
-0.9629568, 2.176135, -0.1804015, 0.7098039, 1, 0, 1,
-0.9614365, -1.576174, -3.646875, 0.7058824, 1, 0, 1,
-0.9579175, 0.3779784, -2.413391, 0.6980392, 1, 0, 1,
-0.9575325, -0.04455424, -1.788604, 0.6901961, 1, 0, 1,
-0.953575, 0.5174133, 0.04505295, 0.6862745, 1, 0, 1,
-0.9523868, -1.949191, -2.594299, 0.6784314, 1, 0, 1,
-0.9505104, 0.08336733, -2.86157, 0.6745098, 1, 0, 1,
-0.9485969, -1.564498, -1.075487, 0.6666667, 1, 0, 1,
-0.9436087, 0.7642148, -1.316952, 0.6627451, 1, 0, 1,
-0.9419031, 0.05618602, -2.954287, 0.654902, 1, 0, 1,
-0.9382205, 0.3920844, -0.5838913, 0.6509804, 1, 0, 1,
-0.9367008, 0.8113483, 1.002484, 0.6431373, 1, 0, 1,
-0.9306974, 0.5306737, -1.608406, 0.6392157, 1, 0, 1,
-0.9305265, 0.2783327, -0.779466, 0.6313726, 1, 0, 1,
-0.9302973, 0.009913259, -1.872887, 0.627451, 1, 0, 1,
-0.9257423, -1.339522, -2.553646, 0.6196079, 1, 0, 1,
-0.9256395, -1.196799, -1.99162, 0.6156863, 1, 0, 1,
-0.9228135, -1.179265, -3.36685, 0.6078432, 1, 0, 1,
-0.9193562, 0.9595834, -1.164799, 0.6039216, 1, 0, 1,
-0.9172437, -0.3209736, -2.933049, 0.5960785, 1, 0, 1,
-0.9161995, 0.6752395, -1.980219, 0.5882353, 1, 0, 1,
-0.9126961, 0.6996318, -0.2183399, 0.5843138, 1, 0, 1,
-0.9036186, -1.991562, -2.105739, 0.5764706, 1, 0, 1,
-0.9018362, 1.068732, -2.310102, 0.572549, 1, 0, 1,
-0.8996139, 0.24571, -2.075909, 0.5647059, 1, 0, 1,
-0.89617, 1.333389, -1.580643, 0.5607843, 1, 0, 1,
-0.8940691, 0.2322366, -1.14046, 0.5529412, 1, 0, 1,
-0.8917201, -1.089257, -2.75246, 0.5490196, 1, 0, 1,
-0.8899848, 0.97629, -0.5549535, 0.5411765, 1, 0, 1,
-0.8893176, 0.1806325, -1.925302, 0.5372549, 1, 0, 1,
-0.8808838, 1.006485, -0.5952433, 0.5294118, 1, 0, 1,
-0.8710902, 0.2394268, -1.877501, 0.5254902, 1, 0, 1,
-0.8674844, 2.392776, -1.200158, 0.5176471, 1, 0, 1,
-0.8665053, 0.7142822, -1.152492, 0.5137255, 1, 0, 1,
-0.8651716, 0.4910381, -0.107077, 0.5058824, 1, 0, 1,
-0.8589404, -0.1198743, -1.133707, 0.5019608, 1, 0, 1,
-0.8573268, 0.08659022, -2.684634, 0.4941176, 1, 0, 1,
-0.8544161, -1.111439, -3.616812, 0.4862745, 1, 0, 1,
-0.8522818, 0.3534507, -2.267488, 0.4823529, 1, 0, 1,
-0.8522097, 1.567116, 0.7680366, 0.4745098, 1, 0, 1,
-0.8492625, -0.1836457, -0.9667751, 0.4705882, 1, 0, 1,
-0.8392323, 0.3316807, -0.5171821, 0.4627451, 1, 0, 1,
-0.8384886, -0.01491042, -3.531861, 0.4588235, 1, 0, 1,
-0.8380186, -0.5922607, -1.409225, 0.4509804, 1, 0, 1,
-0.8315312, -0.1746463, -1.860007, 0.4470588, 1, 0, 1,
-0.8275898, 0.3202521, 0.6312491, 0.4392157, 1, 0, 1,
-0.8230557, 0.07983343, 0.2521583, 0.4352941, 1, 0, 1,
-0.8204286, -0.5678484, -2.605731, 0.427451, 1, 0, 1,
-0.8199406, 1.5759, -0.1951282, 0.4235294, 1, 0, 1,
-0.8184222, 0.4164319, -0.8105223, 0.4156863, 1, 0, 1,
-0.8177713, 1.987329, 0.1926177, 0.4117647, 1, 0, 1,
-0.8169665, 0.5537229, -1.398268, 0.4039216, 1, 0, 1,
-0.8156006, -1.167097, -2.694307, 0.3960784, 1, 0, 1,
-0.8123473, -0.8495663, -3.973977, 0.3921569, 1, 0, 1,
-0.8102459, 0.4074694, -0.3175213, 0.3843137, 1, 0, 1,
-0.808611, -1.69121, -1.048478, 0.3803922, 1, 0, 1,
-0.8076221, 0.04365145, -0.791174, 0.372549, 1, 0, 1,
-0.8064874, 0.697975, -1.073119, 0.3686275, 1, 0, 1,
-0.7953403, -2.003598, -2.638311, 0.3607843, 1, 0, 1,
-0.7891374, -0.8877242, -1.59883, 0.3568628, 1, 0, 1,
-0.7863739, -2.742771, -2.618814, 0.3490196, 1, 0, 1,
-0.786033, -0.5134361, -2.55558, 0.345098, 1, 0, 1,
-0.7825972, -0.1035982, -2.081452, 0.3372549, 1, 0, 1,
-0.7816057, 0.6828151, -2.904748, 0.3333333, 1, 0, 1,
-0.7803518, 1.528296, -1.04466, 0.3254902, 1, 0, 1,
-0.7763869, -0.4918024, -0.7013913, 0.3215686, 1, 0, 1,
-0.7723814, -0.8549957, -2.765513, 0.3137255, 1, 0, 1,
-0.7695608, 0.00818077, -2.869987, 0.3098039, 1, 0, 1,
-0.7622979, 0.8346073, -0.7142227, 0.3019608, 1, 0, 1,
-0.7590432, -1.703806, -2.587934, 0.2941177, 1, 0, 1,
-0.7424915, -0.8007741, -0.3371398, 0.2901961, 1, 0, 1,
-0.7338632, -1.621474, -2.244709, 0.282353, 1, 0, 1,
-0.7320244, -0.8491271, -3.330713, 0.2784314, 1, 0, 1,
-0.7295627, 0.9847707, -0.8720862, 0.2705882, 1, 0, 1,
-0.728669, -0.4609112, -1.921863, 0.2666667, 1, 0, 1,
-0.7262802, 2.231813, -1.182649, 0.2588235, 1, 0, 1,
-0.7174291, 1.593423, -0.6322758, 0.254902, 1, 0, 1,
-0.7118166, -0.7130988, -2.735962, 0.2470588, 1, 0, 1,
-0.7042717, -1.490683, -3.116802, 0.2431373, 1, 0, 1,
-0.7028649, 1.16843, -1.594924, 0.2352941, 1, 0, 1,
-0.6855502, -1.352528, -2.229762, 0.2313726, 1, 0, 1,
-0.6848541, 1.102015, -0.3110878, 0.2235294, 1, 0, 1,
-0.6840217, 0.7186865, 0.02339561, 0.2196078, 1, 0, 1,
-0.683157, -1.250969, -4.188332, 0.2117647, 1, 0, 1,
-0.6806038, 0.4327033, -1.463345, 0.2078431, 1, 0, 1,
-0.6745672, -0.1657696, -0.06359587, 0.2, 1, 0, 1,
-0.6712227, 1.415394, -0.8655465, 0.1921569, 1, 0, 1,
-0.6703326, -0.8224655, -2.124647, 0.1882353, 1, 0, 1,
-0.6681352, -0.517497, -1.612719, 0.1803922, 1, 0, 1,
-0.6678696, -1.455382, -2.542124, 0.1764706, 1, 0, 1,
-0.6551218, 0.3320753, -0.2725576, 0.1686275, 1, 0, 1,
-0.6540187, 0.2185814, -2.149894, 0.1647059, 1, 0, 1,
-0.6474714, 0.5215837, -0.1330123, 0.1568628, 1, 0, 1,
-0.643564, 1.757158, -0.2444804, 0.1529412, 1, 0, 1,
-0.6350814, 1.197311, -2.068826, 0.145098, 1, 0, 1,
-0.6342051, 0.6389213, -0.572086, 0.1411765, 1, 0, 1,
-0.6318572, 2.537804, -0.08682995, 0.1333333, 1, 0, 1,
-0.6308733, -0.08585635, -0.2045394, 0.1294118, 1, 0, 1,
-0.6280512, -1.12068, -1.22596, 0.1215686, 1, 0, 1,
-0.6269647, -0.5356522, -3.044285, 0.1176471, 1, 0, 1,
-0.6244782, -0.1354644, -3.395013, 0.1098039, 1, 0, 1,
-0.6220844, 0.3601431, -1.165107, 0.1058824, 1, 0, 1,
-0.6216482, 0.717553, -0.20575, 0.09803922, 1, 0, 1,
-0.6208383, -0.1692257, -1.379276, 0.09019608, 1, 0, 1,
-0.6176274, 1.789114, -1.157483, 0.08627451, 1, 0, 1,
-0.6114246, -1.312699, -3.019051, 0.07843138, 1, 0, 1,
-0.6090729, 0.8494485, -1.807017, 0.07450981, 1, 0, 1,
-0.6018956, 1.030354, -0.7857621, 0.06666667, 1, 0, 1,
-0.5990664, -0.7991071, -2.356, 0.0627451, 1, 0, 1,
-0.593409, 1.304625, -0.06242149, 0.05490196, 1, 0, 1,
-0.5922565, -0.3834054, -1.439295, 0.05098039, 1, 0, 1,
-0.5915564, -0.07737506, -3.530547, 0.04313726, 1, 0, 1,
-0.585595, -0.2578258, -2.113838, 0.03921569, 1, 0, 1,
-0.5799257, 1.092415, 0.7432884, 0.03137255, 1, 0, 1,
-0.5713483, 0.3291733, -0.8803011, 0.02745098, 1, 0, 1,
-0.5698556, 0.08129144, -3.627952, 0.01960784, 1, 0, 1,
-0.5684153, 0.6846843, -3.208889, 0.01568628, 1, 0, 1,
-0.5665658, -0.9298832, -1.360086, 0.007843138, 1, 0, 1,
-0.5659212, 0.02060418, -3.412777, 0.003921569, 1, 0, 1,
-0.5653885, -0.4549716, -2.0141, 0, 1, 0.003921569, 1,
-0.5608702, 0.5514228, 0.1651716, 0, 1, 0.01176471, 1,
-0.5596218, -1.699187, -2.593309, 0, 1, 0.01568628, 1,
-0.5587967, -1.052901, -3.765264, 0, 1, 0.02352941, 1,
-0.5574672, -0.3915767, -1.833151, 0, 1, 0.02745098, 1,
-0.5559512, -1.285763, -3.379941, 0, 1, 0.03529412, 1,
-0.5543883, 1.506059, -1.218418, 0, 1, 0.03921569, 1,
-0.5450811, 0.07601094, -1.778657, 0, 1, 0.04705882, 1,
-0.5437952, 0.7676548, 0.002024698, 0, 1, 0.05098039, 1,
-0.5415336, 0.1724281, -0.03310111, 0, 1, 0.05882353, 1,
-0.5411381, 1.178867, -1.210037, 0, 1, 0.0627451, 1,
-0.5220522, 0.2622273, -1.325176, 0, 1, 0.07058824, 1,
-0.5217488, -0.8263888, -2.525375, 0, 1, 0.07450981, 1,
-0.5199603, -0.09750491, -1.26429, 0, 1, 0.08235294, 1,
-0.5176161, -0.06784956, -1.416149, 0, 1, 0.08627451, 1,
-0.5155518, 0.9841278, -1.346064, 0, 1, 0.09411765, 1,
-0.5152581, 0.6671553, -1.2259, 0, 1, 0.1019608, 1,
-0.5063741, -0.4389344, -2.216861, 0, 1, 0.1058824, 1,
-0.5061668, 0.7191173, 0.04712351, 0, 1, 0.1137255, 1,
-0.4990001, -1.281096, -2.07057, 0, 1, 0.1176471, 1,
-0.4989693, -0.6492648, -4.07017, 0, 1, 0.1254902, 1,
-0.4970348, 0.552123, -1.258636, 0, 1, 0.1294118, 1,
-0.4796876, -0.1947811, -1.291831, 0, 1, 0.1372549, 1,
-0.4761817, 1.661041, 0.5794418, 0, 1, 0.1411765, 1,
-0.4759912, 0.2017454, -2.134394, 0, 1, 0.1490196, 1,
-0.4723673, 0.6237857, 0.5031347, 0, 1, 0.1529412, 1,
-0.4692529, 0.6114843, -0.1040429, 0, 1, 0.1607843, 1,
-0.4660137, -0.3043829, -1.720785, 0, 1, 0.1647059, 1,
-0.4649453, 0.06908044, -1.878506, 0, 1, 0.172549, 1,
-0.4630405, -0.981718, -0.3093748, 0, 1, 0.1764706, 1,
-0.4609933, 1.435623, 0.02159448, 0, 1, 0.1843137, 1,
-0.4608195, -0.2643515, -1.625553, 0, 1, 0.1882353, 1,
-0.4605654, 0.3366019, -0.9887357, 0, 1, 0.1960784, 1,
-0.4596398, -2.006818, -5.277576, 0, 1, 0.2039216, 1,
-0.4596338, -0.9218774, -1.232554, 0, 1, 0.2078431, 1,
-0.4570309, 0.816917, -1.490226, 0, 1, 0.2156863, 1,
-0.4550758, -1.328626, -1.984223, 0, 1, 0.2196078, 1,
-0.4513654, 1.544279, -1.523972, 0, 1, 0.227451, 1,
-0.4498036, 1.292813, -0.8660872, 0, 1, 0.2313726, 1,
-0.4494841, -1.87789, -3.417225, 0, 1, 0.2392157, 1,
-0.4488944, -0.6223399, -3.591378, 0, 1, 0.2431373, 1,
-0.4407915, 0.1034486, -0.8305004, 0, 1, 0.2509804, 1,
-0.4385885, -1.08132, -2.948973, 0, 1, 0.254902, 1,
-0.434511, -0.936803, -2.515211, 0, 1, 0.2627451, 1,
-0.4333124, 0.4043376, -1.75774, 0, 1, 0.2666667, 1,
-0.4320565, -1.008274, -3.707418, 0, 1, 0.2745098, 1,
-0.4281844, -0.05978196, -3.224393, 0, 1, 0.2784314, 1,
-0.4271005, -0.6697032, -2.540041, 0, 1, 0.2862745, 1,
-0.4194351, 0.4118525, -0.1894466, 0, 1, 0.2901961, 1,
-0.4182984, -1.23183, -1.968524, 0, 1, 0.2980392, 1,
-0.407695, -0.1198097, -0.04140614, 0, 1, 0.3058824, 1,
-0.4070172, -0.5359241, -2.669683, 0, 1, 0.3098039, 1,
-0.4063098, 2.413333, 1.277161, 0, 1, 0.3176471, 1,
-0.4059488, -0.04219358, -0.538448, 0, 1, 0.3215686, 1,
-0.4032417, 0.006877025, -1.582286, 0, 1, 0.3294118, 1,
-0.3999343, -1.157615, -2.385255, 0, 1, 0.3333333, 1,
-0.3847957, 2.405279, -0.03270035, 0, 1, 0.3411765, 1,
-0.3817022, 0.2225704, -0.8900734, 0, 1, 0.345098, 1,
-0.3743792, 0.8518254, -0.7702586, 0, 1, 0.3529412, 1,
-0.3735169, 0.3986946, 0.1723051, 0, 1, 0.3568628, 1,
-0.3702791, 0.3160262, -0.4971492, 0, 1, 0.3647059, 1,
-0.3689628, -0.8392023, -1.912289, 0, 1, 0.3686275, 1,
-0.3681546, 0.9170591, -0.9588554, 0, 1, 0.3764706, 1,
-0.3664255, -0.02938207, -1.103041, 0, 1, 0.3803922, 1,
-0.3643014, -0.1695492, -0.8823072, 0, 1, 0.3882353, 1,
-0.3638722, 0.6399553, -0.1314607, 0, 1, 0.3921569, 1,
-0.3637469, 1.183607, -1.421625, 0, 1, 0.4, 1,
-0.3599448, 0.01725896, -2.864674, 0, 1, 0.4078431, 1,
-0.3568231, -0.1274466, -1.687655, 0, 1, 0.4117647, 1,
-0.3557978, 1.415445, 0.1562228, 0, 1, 0.4196078, 1,
-0.3545929, 0.0997845, -0.06885802, 0, 1, 0.4235294, 1,
-0.3526596, 0.5132861, -1.57905, 0, 1, 0.4313726, 1,
-0.352343, -0.9534194, -3.662698, 0, 1, 0.4352941, 1,
-0.3511686, 0.3586915, 0.4880913, 0, 1, 0.4431373, 1,
-0.350777, -0.08478101, -1.625404, 0, 1, 0.4470588, 1,
-0.3493496, -0.4981039, -4.647048, 0, 1, 0.454902, 1,
-0.3420676, 0.3164163, -0.5763876, 0, 1, 0.4588235, 1,
-0.339921, -0.1422036, -2.287421, 0, 1, 0.4666667, 1,
-0.338583, -1.150972, -4.276271, 0, 1, 0.4705882, 1,
-0.3321555, 1.221969, -0.158326, 0, 1, 0.4784314, 1,
-0.3302519, -0.7523195, -2.386564, 0, 1, 0.4823529, 1,
-0.3286101, -2.474684, -2.164577, 0, 1, 0.4901961, 1,
-0.3282212, 1.388022, -0.533991, 0, 1, 0.4941176, 1,
-0.3233649, -1.023454, -4.601344, 0, 1, 0.5019608, 1,
-0.3209195, 0.2772399, -1.086058, 0, 1, 0.509804, 1,
-0.3130411, -0.02040293, -1.795451, 0, 1, 0.5137255, 1,
-0.311806, 0.4290733, 0.6238567, 0, 1, 0.5215687, 1,
-0.3049658, 1.328557, 0.6543505, 0, 1, 0.5254902, 1,
-0.3035208, 0.8022035, -1.367014, 0, 1, 0.5333334, 1,
-0.2941523, 0.9304724, -0.4233095, 0, 1, 0.5372549, 1,
-0.2920973, 0.2984922, -0.8325655, 0, 1, 0.5450981, 1,
-0.291708, 0.7411877, 1.723376, 0, 1, 0.5490196, 1,
-0.2894846, 1.403158, 0.4456418, 0, 1, 0.5568628, 1,
-0.2872363, -0.3917466, -1.779651, 0, 1, 0.5607843, 1,
-0.2847818, -0.5422642, -2.513126, 0, 1, 0.5686275, 1,
-0.2845564, 0.4261766, 1.226532, 0, 1, 0.572549, 1,
-0.283963, 0.128934, -2.08623, 0, 1, 0.5803922, 1,
-0.2820148, 0.5169033, -1.479171, 0, 1, 0.5843138, 1,
-0.2796778, 2.067189, 1.107502, 0, 1, 0.5921569, 1,
-0.2782943, 0.3938618, 0.6708544, 0, 1, 0.5960785, 1,
-0.2693401, 0.5558848, 0.3654327, 0, 1, 0.6039216, 1,
-0.2689384, -0.1563855, -1.053557, 0, 1, 0.6117647, 1,
-0.2664746, 1.083435, 0.8584492, 0, 1, 0.6156863, 1,
-0.2641605, 0.1619011, 0.5814996, 0, 1, 0.6235294, 1,
-0.2563273, 0.2403153, -0.7356477, 0, 1, 0.627451, 1,
-0.2535437, 0.7884517, -0.840948, 0, 1, 0.6352941, 1,
-0.2529864, 1.171216, -1.22003, 0, 1, 0.6392157, 1,
-0.2522802, -0.3980266, -3.752995, 0, 1, 0.6470588, 1,
-0.2488212, -1.811469, -3.248266, 0, 1, 0.6509804, 1,
-0.247318, -0.7730001, -2.60443, 0, 1, 0.6588235, 1,
-0.247245, -2.039037, -1.810853, 0, 1, 0.6627451, 1,
-0.2445484, -1.503103, -4.120456, 0, 1, 0.6705883, 1,
-0.2400163, -0.589947, -4.105101, 0, 1, 0.6745098, 1,
-0.2379919, -0.4116913, -4.837605, 0, 1, 0.682353, 1,
-0.23414, -0.895512, -2.45964, 0, 1, 0.6862745, 1,
-0.2273599, 0.5106232, -0.7024322, 0, 1, 0.6941177, 1,
-0.2262839, -0.9212289, -3.588102, 0, 1, 0.7019608, 1,
-0.2169335, 0.2455373, 1.424186, 0, 1, 0.7058824, 1,
-0.2154838, -0.598102, -2.191258, 0, 1, 0.7137255, 1,
-0.2145004, -0.3735881, -2.788125, 0, 1, 0.7176471, 1,
-0.2117897, -0.62675, -3.985639, 0, 1, 0.7254902, 1,
-0.2109718, -1.316242, -5.309001, 0, 1, 0.7294118, 1,
-0.2098433, -0.4833791, -2.09278, 0, 1, 0.7372549, 1,
-0.2092338, 1.366197, -0.3673477, 0, 1, 0.7411765, 1,
-0.2092333, -0.005300933, -0.7037529, 0, 1, 0.7490196, 1,
-0.2085019, -0.4601124, -3.524361, 0, 1, 0.7529412, 1,
-0.2084908, -0.6282887, -2.182952, 0, 1, 0.7607843, 1,
-0.2043169, 0.3184804, -0.7458065, 0, 1, 0.7647059, 1,
-0.2032437, 0.6077054, -0.8708317, 0, 1, 0.772549, 1,
-0.1966017, -0.8375645, -4.062046, 0, 1, 0.7764706, 1,
-0.1941481, -1.127987, -1.589441, 0, 1, 0.7843137, 1,
-0.1882763, 0.9827753, -0.8400438, 0, 1, 0.7882353, 1,
-0.1876443, 0.4245227, -0.1357291, 0, 1, 0.7960784, 1,
-0.1862539, 0.2127298, -1.460164, 0, 1, 0.8039216, 1,
-0.1848236, -1.832936, -4.765075, 0, 1, 0.8078431, 1,
-0.184469, 0.3124669, -0.3541291, 0, 1, 0.8156863, 1,
-0.1841279, -0.4331283, -2.582438, 0, 1, 0.8196079, 1,
-0.1828823, 0.6084087, -0.1680785, 0, 1, 0.827451, 1,
-0.1822797, 0.9658055, 1.36069, 0, 1, 0.8313726, 1,
-0.1814344, 0.8967552, -0.2286, 0, 1, 0.8392157, 1,
-0.1809188, 0.9317185, 0.6415211, 0, 1, 0.8431373, 1,
-0.1735883, -0.01456815, -0.6360217, 0, 1, 0.8509804, 1,
-0.1654003, 1.432606, -1.02262, 0, 1, 0.854902, 1,
-0.1627697, 0.3399236, -3.416965, 0, 1, 0.8627451, 1,
-0.1593232, -0.9503369, -2.38556, 0, 1, 0.8666667, 1,
-0.1583471, -0.6500697, -1.806937, 0, 1, 0.8745098, 1,
-0.1575468, 1.017807, 2.196243, 0, 1, 0.8784314, 1,
-0.154281, -0.5822766, -2.355208, 0, 1, 0.8862745, 1,
-0.1510919, 0.1057593, -0.8875992, 0, 1, 0.8901961, 1,
-0.1500041, -0.5520437, -2.343021, 0, 1, 0.8980392, 1,
-0.1403296, -0.6332027, -1.990256, 0, 1, 0.9058824, 1,
-0.1401854, -0.2137858, -3.797422, 0, 1, 0.9098039, 1,
-0.1305955, 1.529446, -0.197171, 0, 1, 0.9176471, 1,
-0.124404, 1.427969, -0.3668062, 0, 1, 0.9215686, 1,
-0.1231496, 0.7654349, 0.8991188, 0, 1, 0.9294118, 1,
-0.1217372, -1.451942, -4.398562, 0, 1, 0.9333333, 1,
-0.1200845, 0.6515416, 0.516561, 0, 1, 0.9411765, 1,
-0.1157755, -1.061752, -3.704297, 0, 1, 0.945098, 1,
-0.1139665, -0.07407208, -2.044107, 0, 1, 0.9529412, 1,
-0.1104289, -0.1025641, -1.983572, 0, 1, 0.9568627, 1,
-0.1097893, -0.2311348, -1.833694, 0, 1, 0.9647059, 1,
-0.1065473, -0.4523682, -4.807807, 0, 1, 0.9686275, 1,
-0.09113702, 0.1790076, -2.116125, 0, 1, 0.9764706, 1,
-0.09019475, 0.9000851, -0.4887625, 0, 1, 0.9803922, 1,
-0.08839167, -0.8381494, -4.026183, 0, 1, 0.9882353, 1,
-0.08568792, 0.1703298, -1.176002, 0, 1, 0.9921569, 1,
-0.08535586, -0.01085829, -3.206019, 0, 1, 1, 1,
-0.08510763, 0.2501087, -0.7528144, 0, 0.9921569, 1, 1,
-0.07576232, 0.9000843, -0.6095079, 0, 0.9882353, 1, 1,
-0.07254834, -1.070957, -4.022671, 0, 0.9803922, 1, 1,
-0.06896433, 0.3118666, 0.5622312, 0, 0.9764706, 1, 1,
-0.0686217, -0.1639339, -3.366591, 0, 0.9686275, 1, 1,
-0.06557046, 1.757217, -0.4894601, 0, 0.9647059, 1, 1,
-0.06232996, 1.693177, 0.7844974, 0, 0.9568627, 1, 1,
-0.05469661, 0.5980846, -0.2314758, 0, 0.9529412, 1, 1,
-0.05339138, 0.4735774, -0.5364124, 0, 0.945098, 1, 1,
-0.05336869, 0.7807354, -1.092131, 0, 0.9411765, 1, 1,
-0.04066585, 0.7092643, 0.814198, 0, 0.9333333, 1, 1,
-0.04030208, 0.5515131, 0.6002943, 0, 0.9294118, 1, 1,
-0.03910628, -1.861077, -1.475283, 0, 0.9215686, 1, 1,
-0.03861866, -0.869575, -3.026321, 0, 0.9176471, 1, 1,
-0.03711939, -1.608351, -4.316057, 0, 0.9098039, 1, 1,
-0.03640028, 0.04717182, 0.5971775, 0, 0.9058824, 1, 1,
-0.03356572, 0.2059264, 0.1239646, 0, 0.8980392, 1, 1,
-0.03301482, 0.2445267, -0.8881916, 0, 0.8901961, 1, 1,
-0.032824, -1.733418, -2.970662, 0, 0.8862745, 1, 1,
-0.03108039, 0.4345167, -0.5272564, 0, 0.8784314, 1, 1,
-0.02858323, 1.621657, 0.06010989, 0, 0.8745098, 1, 1,
-0.0279596, 2.513482, 0.9223862, 0, 0.8666667, 1, 1,
-0.01850809, 0.8033878, -0.1749891, 0, 0.8627451, 1, 1,
-0.01660303, 0.2148004, 1.039517, 0, 0.854902, 1, 1,
-0.01446265, -0.4340116, -4.097571, 0, 0.8509804, 1, 1,
-0.0130967, -1.680478, -2.192206, 0, 0.8431373, 1, 1,
-0.009883801, 0.5540897, 1.259536, 0, 0.8392157, 1, 1,
-0.00128932, -0.4278602, -4.657466, 0, 0.8313726, 1, 1,
0.001275498, -0.7881078, 3.164066, 0, 0.827451, 1, 1,
0.002220595, 0.2023586, 0.4432772, 0, 0.8196079, 1, 1,
0.004240212, 0.03113647, -1.368137, 0, 0.8156863, 1, 1,
0.007387703, -0.1623455, 2.143461, 0, 0.8078431, 1, 1,
0.009685122, -1.788961, 2.143099, 0, 0.8039216, 1, 1,
0.01135564, 0.8451308, 0.7177715, 0, 0.7960784, 1, 1,
0.01216636, -0.3474016, 2.823483, 0, 0.7882353, 1, 1,
0.01547741, -1.381533, 2.471052, 0, 0.7843137, 1, 1,
0.01647545, 0.4750531, 1.381693, 0, 0.7764706, 1, 1,
0.01696445, -0.6111971, 5.147322, 0, 0.772549, 1, 1,
0.02032397, -0.5413794, 1.666265, 0, 0.7647059, 1, 1,
0.02802708, -0.7318194, 0.6639342, 0, 0.7607843, 1, 1,
0.03295914, 1.437278, -0.6112587, 0, 0.7529412, 1, 1,
0.03551573, 0.1495714, 0.6955587, 0, 0.7490196, 1, 1,
0.03577384, 0.9729682, -0.736491, 0, 0.7411765, 1, 1,
0.04909012, -0.6050639, 1.650768, 0, 0.7372549, 1, 1,
0.05222315, 0.8847983, 0.5048689, 0, 0.7294118, 1, 1,
0.0534179, 0.8514205, -0.5726293, 0, 0.7254902, 1, 1,
0.05359483, 0.001145898, 2.284757, 0, 0.7176471, 1, 1,
0.0540502, -1.87007, 5.23278, 0, 0.7137255, 1, 1,
0.05757987, -1.035718, 3.71443, 0, 0.7058824, 1, 1,
0.05960671, 0.3631205, 1.293925, 0, 0.6980392, 1, 1,
0.06306981, -0.1615321, 1.685293, 0, 0.6941177, 1, 1,
0.06510168, -1.701339, 2.487491, 0, 0.6862745, 1, 1,
0.06575904, -1.374223, 3.288192, 0, 0.682353, 1, 1,
0.06592377, 1.094047, 0.8289696, 0, 0.6745098, 1, 1,
0.06648684, -1.143786, 3.674197, 0, 0.6705883, 1, 1,
0.06809932, 0.2466054, -0.5821792, 0, 0.6627451, 1, 1,
0.06966362, 1.881186, 1.855496, 0, 0.6588235, 1, 1,
0.08533991, 0.02687167, 0.8176606, 0, 0.6509804, 1, 1,
0.086159, -0.7857823, 2.124844, 0, 0.6470588, 1, 1,
0.09099562, -0.3931772, 2.55783, 0, 0.6392157, 1, 1,
0.09492065, -0.6167314, 4.24442, 0, 0.6352941, 1, 1,
0.09828192, -0.8541772, 4.170449, 0, 0.627451, 1, 1,
0.1043276, 0.5964618, 0.2483563, 0, 0.6235294, 1, 1,
0.1053691, 0.4142199, -1.001271, 0, 0.6156863, 1, 1,
0.1055954, -1.788362, 2.893191, 0, 0.6117647, 1, 1,
0.1068135, -0.2206228, 2.954943, 0, 0.6039216, 1, 1,
0.1141573, -0.4815877, 1.440547, 0, 0.5960785, 1, 1,
0.1144371, 1.18497, -0.1666109, 0, 0.5921569, 1, 1,
0.1159936, -0.230594, 1.883436, 0, 0.5843138, 1, 1,
0.1211632, -0.5331426, 4.212327, 0, 0.5803922, 1, 1,
0.1235088, -1.702513, 4.429659, 0, 0.572549, 1, 1,
0.1289591, -0.2652931, 5.113019, 0, 0.5686275, 1, 1,
0.1373737, -0.693396, 2.056255, 0, 0.5607843, 1, 1,
0.1380288, 0.6596913, 0.01266209, 0, 0.5568628, 1, 1,
0.1383741, -0.03938774, 2.210962, 0, 0.5490196, 1, 1,
0.1400247, 1.877631, 1.421828, 0, 0.5450981, 1, 1,
0.1412702, -1.62618, 4.028748, 0, 0.5372549, 1, 1,
0.1425825, 0.02756636, 2.202443, 0, 0.5333334, 1, 1,
0.1436039, 0.625053, 0.731609, 0, 0.5254902, 1, 1,
0.1492673, -0.7634451, 2.021517, 0, 0.5215687, 1, 1,
0.1523515, 0.4456762, -0.2250666, 0, 0.5137255, 1, 1,
0.1608194, 0.9002613, 0.6564892, 0, 0.509804, 1, 1,
0.1628133, -0.2786692, 0.571768, 0, 0.5019608, 1, 1,
0.1635152, -0.9097388, 2.438613, 0, 0.4941176, 1, 1,
0.1646412, -0.6501883, 2.981584, 0, 0.4901961, 1, 1,
0.1654308, -0.3596147, 1.906183, 0, 0.4823529, 1, 1,
0.1673705, 0.3164846, 1.844961, 0, 0.4784314, 1, 1,
0.1681685, 0.3230604, 2.106131, 0, 0.4705882, 1, 1,
0.1729302, -0.8418145, 2.44117, 0, 0.4666667, 1, 1,
0.1752695, -1.010716, 2.826549, 0, 0.4588235, 1, 1,
0.1801441, 0.7554291, 0.604636, 0, 0.454902, 1, 1,
0.1848583, 0.5171232, 0.7081686, 0, 0.4470588, 1, 1,
0.1869123, -0.2975204, 2.035402, 0, 0.4431373, 1, 1,
0.1990815, -1.257452, 3.630646, 0, 0.4352941, 1, 1,
0.2009972, -1.64367, 1.42508, 0, 0.4313726, 1, 1,
0.203156, -0.7479048, 1.495479, 0, 0.4235294, 1, 1,
0.2045787, 1.959549, 1.096916, 0, 0.4196078, 1, 1,
0.2054921, -0.7259105, 3.069172, 0, 0.4117647, 1, 1,
0.2082401, -0.7148728, 3.27441, 0, 0.4078431, 1, 1,
0.208606, -0.007814541, 2.039227, 0, 0.4, 1, 1,
0.2092594, -1.375519, 4.955679, 0, 0.3921569, 1, 1,
0.2098306, 0.8919247, -0.2347233, 0, 0.3882353, 1, 1,
0.2104413, -2.041468, 2.01116, 0, 0.3803922, 1, 1,
0.2116355, -0.1139788, 3.228673, 0, 0.3764706, 1, 1,
0.2211323, -0.5438157, 2.777264, 0, 0.3686275, 1, 1,
0.2215191, -0.0379515, 0.6433321, 0, 0.3647059, 1, 1,
0.2218683, -1.438928, 2.938198, 0, 0.3568628, 1, 1,
0.2233261, 0.5558342, 0.9225336, 0, 0.3529412, 1, 1,
0.2235494, 1.267554, 0.2965853, 0, 0.345098, 1, 1,
0.2280917, 2.117889, -0.3395244, 0, 0.3411765, 1, 1,
0.2291464, -1.392222, 2.179339, 0, 0.3333333, 1, 1,
0.2305204, -0.2075242, 2.807562, 0, 0.3294118, 1, 1,
0.2328247, 0.7381313, 2.267128, 0, 0.3215686, 1, 1,
0.237697, -1.929876, 4.895803, 0, 0.3176471, 1, 1,
0.2440888, 0.117736, 0.6872512, 0, 0.3098039, 1, 1,
0.2457039, -0.1736056, -0.08991149, 0, 0.3058824, 1, 1,
0.2469412, -0.01663394, 0.657782, 0, 0.2980392, 1, 1,
0.2509162, 0.7205599, -0.5811478, 0, 0.2901961, 1, 1,
0.2547003, -0.1507958, 2.293508, 0, 0.2862745, 1, 1,
0.2547022, 0.8596573, 1.467124, 0, 0.2784314, 1, 1,
0.2550829, -0.3117559, 2.274728, 0, 0.2745098, 1, 1,
0.2593038, 0.7623931, -1.198663, 0, 0.2666667, 1, 1,
0.2606876, -0.6702933, 2.949383, 0, 0.2627451, 1, 1,
0.2607736, 0.3401901, 1.181001, 0, 0.254902, 1, 1,
0.2614606, 0.3949552, 1.066833, 0, 0.2509804, 1, 1,
0.2648748, 0.4168297, 1.644492, 0, 0.2431373, 1, 1,
0.2659121, 0.3100556, 1.846342, 0, 0.2392157, 1, 1,
0.266752, 1.999919, 1.659131, 0, 0.2313726, 1, 1,
0.2675218, 1.308906, 0.1841003, 0, 0.227451, 1, 1,
0.2758661, 1.864048, 1.14342, 0, 0.2196078, 1, 1,
0.2779892, 0.4844759, 0.3932091, 0, 0.2156863, 1, 1,
0.278464, 1.096935, 1.851779, 0, 0.2078431, 1, 1,
0.2790304, 0.5980297, -0.001660606, 0, 0.2039216, 1, 1,
0.2805646, -1.064596, 3.547534, 0, 0.1960784, 1, 1,
0.2830619, -0.0681923, 0.7145213, 0, 0.1882353, 1, 1,
0.2862555, -0.8401015, 3.829058, 0, 0.1843137, 1, 1,
0.2862632, 2.877087, 0.2589476, 0, 0.1764706, 1, 1,
0.2884783, 0.6450825, -0.98362, 0, 0.172549, 1, 1,
0.291128, 0.602121, -0.8759881, 0, 0.1647059, 1, 1,
0.2919583, -0.9677155, 4.016659, 0, 0.1607843, 1, 1,
0.293193, -0.6809332, 1.37813, 0, 0.1529412, 1, 1,
0.2948138, 1.312408, 1.534461, 0, 0.1490196, 1, 1,
0.3003238, -0.6090153, 1.490921, 0, 0.1411765, 1, 1,
0.3016737, -1.080763, 2.79109, 0, 0.1372549, 1, 1,
0.3080304, -0.4161682, 2.359712, 0, 0.1294118, 1, 1,
0.310075, 0.3962303, 1.676438, 0, 0.1254902, 1, 1,
0.3113351, 1.264749, 0.8689519, 0, 0.1176471, 1, 1,
0.3182278, 1.831154, 1.822339, 0, 0.1137255, 1, 1,
0.3226553, 1.738166, -2.223029, 0, 0.1058824, 1, 1,
0.3229601, 0.495692, 1.305208, 0, 0.09803922, 1, 1,
0.3243423, -0.4618915, 1.645908, 0, 0.09411765, 1, 1,
0.325854, 1.406966, 2.265828, 0, 0.08627451, 1, 1,
0.3261, 0.1113771, 2.137938, 0, 0.08235294, 1, 1,
0.3278941, 1.642717, 0.8697035, 0, 0.07450981, 1, 1,
0.3285698, 1.265338, 0.2168984, 0, 0.07058824, 1, 1,
0.3295041, 1.215146, 2.162148, 0, 0.0627451, 1, 1,
0.3328153, 0.07088763, 0.5307068, 0, 0.05882353, 1, 1,
0.3378181, -0.3548662, 1.896782, 0, 0.05098039, 1, 1,
0.3435259, 0.148861, 0.7350951, 0, 0.04705882, 1, 1,
0.3439816, 1.289281, 0.4994498, 0, 0.03921569, 1, 1,
0.3474705, -0.4174869, 1.548826, 0, 0.03529412, 1, 1,
0.3495672, -0.3087921, 2.282425, 0, 0.02745098, 1, 1,
0.3630793, -0.1795601, 1.002864, 0, 0.02352941, 1, 1,
0.3669325, -3.31017, 3.649585, 0, 0.01568628, 1, 1,
0.376038, 0.3864777, -0.05248861, 0, 0.01176471, 1, 1,
0.3792292, 0.149292, 3.411454, 0, 0.003921569, 1, 1,
0.3821538, 1.190691, 0.4316615, 0.003921569, 0, 1, 1,
0.3851815, 0.07688306, 2.619503, 0.007843138, 0, 1, 1,
0.3877691, 1.114426, 0.8431764, 0.01568628, 0, 1, 1,
0.3880547, -0.2962082, 2.523749, 0.01960784, 0, 1, 1,
0.3896313, -0.3894673, 3.333548, 0.02745098, 0, 1, 1,
0.3899973, -0.02792887, 0.01805462, 0.03137255, 0, 1, 1,
0.3910798, -1.313277, 2.466926, 0.03921569, 0, 1, 1,
0.3936118, -0.633215, 2.337593, 0.04313726, 0, 1, 1,
0.4002591, 0.8115475, 1.854379, 0.05098039, 0, 1, 1,
0.4114996, 1.191592, 0.3343992, 0.05490196, 0, 1, 1,
0.4162351, -1.672845, 2.989304, 0.0627451, 0, 1, 1,
0.4176477, 1.646254, 1.29734, 0.06666667, 0, 1, 1,
0.4186243, 1.848903, 0.376151, 0.07450981, 0, 1, 1,
0.4195372, -0.5608822, 2.504327, 0.07843138, 0, 1, 1,
0.4266496, -0.9336623, 4.005953, 0.08627451, 0, 1, 1,
0.4275415, -1.273288, 4.405593, 0.09019608, 0, 1, 1,
0.4291051, 0.4899876, 0.4864202, 0.09803922, 0, 1, 1,
0.43156, 0.9941743, 1.562649, 0.1058824, 0, 1, 1,
0.4315991, -0.5163078, 1.939902, 0.1098039, 0, 1, 1,
0.4420833, 0.5288789, 1.13059, 0.1176471, 0, 1, 1,
0.44394, 1.581526, 1.050818, 0.1215686, 0, 1, 1,
0.4492265, 0.6476125, 0.3534411, 0.1294118, 0, 1, 1,
0.4507541, 1.66911, 1.641859, 0.1333333, 0, 1, 1,
0.4538022, -0.4220062, 1.896124, 0.1411765, 0, 1, 1,
0.4558446, -0.6036738, 1.336319, 0.145098, 0, 1, 1,
0.4616261, -0.0660354, 3.000633, 0.1529412, 0, 1, 1,
0.4649653, 0.4996133, 1.334865, 0.1568628, 0, 1, 1,
0.4707824, 1.129974, -1.996846, 0.1647059, 0, 1, 1,
0.4735286, -0.1308196, 3.148324, 0.1686275, 0, 1, 1,
0.4739949, -0.9446363, 2.357406, 0.1764706, 0, 1, 1,
0.4822073, -0.5213432, 1.007241, 0.1803922, 0, 1, 1,
0.4846864, 0.9934791, 1.78974, 0.1882353, 0, 1, 1,
0.4861914, 0.6776384, 0.3835221, 0.1921569, 0, 1, 1,
0.4867062, 0.9819886, -0.09283674, 0.2, 0, 1, 1,
0.4873398, -2.302823, 2.210453, 0.2078431, 0, 1, 1,
0.4879774, 0.09704003, 2.476099, 0.2117647, 0, 1, 1,
0.4917532, -0.103964, 1.108368, 0.2196078, 0, 1, 1,
0.4943813, -1.880805, 3.748787, 0.2235294, 0, 1, 1,
0.503772, 0.1711919, 0.6014771, 0.2313726, 0, 1, 1,
0.5056426, 0.5091407, 0.5128615, 0.2352941, 0, 1, 1,
0.5060225, -0.7398407, 2.109886, 0.2431373, 0, 1, 1,
0.5189629, -0.01386746, 0.8213184, 0.2470588, 0, 1, 1,
0.5200295, -0.8142798, 1.661018, 0.254902, 0, 1, 1,
0.5223621, 0.1533122, 1.726782, 0.2588235, 0, 1, 1,
0.5267494, 0.7615083, 0.9920514, 0.2666667, 0, 1, 1,
0.5334919, -0.719244, 1.936908, 0.2705882, 0, 1, 1,
0.5379621, 0.00382216, 1.543564, 0.2784314, 0, 1, 1,
0.5388946, -0.2792792, 2.415116, 0.282353, 0, 1, 1,
0.5398526, 0.4978099, 2.557667, 0.2901961, 0, 1, 1,
0.5399802, -1.1405, 3.12477, 0.2941177, 0, 1, 1,
0.5412828, -0.6331764, 1.746253, 0.3019608, 0, 1, 1,
0.5465317, -0.31745, 1.628211, 0.3098039, 0, 1, 1,
0.5483978, -1.14634, 2.150819, 0.3137255, 0, 1, 1,
0.5528757, 0.7575266, 2.724766, 0.3215686, 0, 1, 1,
0.5563808, -0.3785903, 1.988028, 0.3254902, 0, 1, 1,
0.5570078, -1.159291, 2.71974, 0.3333333, 0, 1, 1,
0.5613869, -0.01181752, 1.429458, 0.3372549, 0, 1, 1,
0.5686883, 0.8089071, 1.975407, 0.345098, 0, 1, 1,
0.5715451, -1.351302, 3.059249, 0.3490196, 0, 1, 1,
0.572506, 0.4109429, 2.737369, 0.3568628, 0, 1, 1,
0.5751166, -0.1513059, 0.9976143, 0.3607843, 0, 1, 1,
0.5765607, 0.2974464, 1.045797, 0.3686275, 0, 1, 1,
0.581076, 0.88594, -0.4202231, 0.372549, 0, 1, 1,
0.5827519, -1.684389, 2.390221, 0.3803922, 0, 1, 1,
0.5851661, -0.9156753, 4.467093, 0.3843137, 0, 1, 1,
0.5888239, -0.3668254, 1.841127, 0.3921569, 0, 1, 1,
0.5894464, -0.3294066, 2.441636, 0.3960784, 0, 1, 1,
0.5927365, -0.9577694, 2.170859, 0.4039216, 0, 1, 1,
0.5974555, 0.1043578, 1.426596, 0.4117647, 0, 1, 1,
0.609082, 0.1685245, 0.4789926, 0.4156863, 0, 1, 1,
0.6100668, -0.7165231, 2.294715, 0.4235294, 0, 1, 1,
0.610217, 0.2692349, 2.293691, 0.427451, 0, 1, 1,
0.6159548, -0.6872958, 1.649762, 0.4352941, 0, 1, 1,
0.6172197, -1.41532, 2.943407, 0.4392157, 0, 1, 1,
0.6180266, 0.1602058, 0.4542448, 0.4470588, 0, 1, 1,
0.6205801, -0.3122719, 1.548304, 0.4509804, 0, 1, 1,
0.6290933, 1.265177, 0.6932366, 0.4588235, 0, 1, 1,
0.6324007, 1.939293, -2.363752, 0.4627451, 0, 1, 1,
0.6348586, -1.115534, 2.294084, 0.4705882, 0, 1, 1,
0.6354979, 0.2414108, 1.775752, 0.4745098, 0, 1, 1,
0.6389642, 0.5721905, 1.73859, 0.4823529, 0, 1, 1,
0.6426331, -0.9001895, 4.955596, 0.4862745, 0, 1, 1,
0.6438759, 0.5620248, 1.433595, 0.4941176, 0, 1, 1,
0.6467645, 0.2368387, 2.674376, 0.5019608, 0, 1, 1,
0.6483003, -1.013434, 3.187182, 0.5058824, 0, 1, 1,
0.6512117, 0.3812231, 2.770589, 0.5137255, 0, 1, 1,
0.6674125, -0.1064204, 1.691075, 0.5176471, 0, 1, 1,
0.6734447, 0.7845294, 0.2937245, 0.5254902, 0, 1, 1,
0.6741543, -0.1210844, 0.9273134, 0.5294118, 0, 1, 1,
0.6754945, 0.5116639, 2.990344, 0.5372549, 0, 1, 1,
0.675674, 1.302298, 1.465757, 0.5411765, 0, 1, 1,
0.6780671, -0.1739522, 1.313221, 0.5490196, 0, 1, 1,
0.6815315, -0.01444014, 1.976751, 0.5529412, 0, 1, 1,
0.685497, -0.2570867, 1.27554, 0.5607843, 0, 1, 1,
0.6862481, 0.2737255, -0.5683927, 0.5647059, 0, 1, 1,
0.6863486, 1.787158, 0.1363028, 0.572549, 0, 1, 1,
0.6867508, -0.6769335, 2.506032, 0.5764706, 0, 1, 1,
0.6873028, 1.556848, 2.752329, 0.5843138, 0, 1, 1,
0.6910536, -0.4095623, 1.880764, 0.5882353, 0, 1, 1,
0.6913437, 0.9273547, 0.3695727, 0.5960785, 0, 1, 1,
0.6950553, -0.3411262, -1.109223, 0.6039216, 0, 1, 1,
0.6985078, 0.3095316, 1.845614, 0.6078432, 0, 1, 1,
0.6993693, 1.911734, -0.80612, 0.6156863, 0, 1, 1,
0.7031885, -0.1498842, 2.453319, 0.6196079, 0, 1, 1,
0.7033347, 0.7855477, 0.5245463, 0.627451, 0, 1, 1,
0.7105573, 0.4072106, 0.1132301, 0.6313726, 0, 1, 1,
0.7106442, 0.4134696, 1.705538, 0.6392157, 0, 1, 1,
0.7115876, 0.1896653, 0.7056036, 0.6431373, 0, 1, 1,
0.7116966, 0.09364942, 2.224052, 0.6509804, 0, 1, 1,
0.7134851, -1.267493, 2.787699, 0.654902, 0, 1, 1,
0.7135962, 0.2032886, -0.1987845, 0.6627451, 0, 1, 1,
0.7139412, 0.3904418, 1.711868, 0.6666667, 0, 1, 1,
0.7238945, -1.397721, 2.627457, 0.6745098, 0, 1, 1,
0.7299047, 0.4388518, 1.239026, 0.6784314, 0, 1, 1,
0.7300977, -1.333095, 3.563058, 0.6862745, 0, 1, 1,
0.7315477, -0.8575353, 2.650801, 0.6901961, 0, 1, 1,
0.738166, -0.7959509, 4.003336, 0.6980392, 0, 1, 1,
0.7402945, -0.2587062, 2.008393, 0.7058824, 0, 1, 1,
0.7439731, -0.07045756, 2.72234, 0.7098039, 0, 1, 1,
0.7443003, -1.111204, 1.564458, 0.7176471, 0, 1, 1,
0.7466993, -0.009097366, 1.840513, 0.7215686, 0, 1, 1,
0.7484074, -0.8023976, 2.276087, 0.7294118, 0, 1, 1,
0.7488264, 0.3812866, 0.2622083, 0.7333333, 0, 1, 1,
0.7516446, -1.460585, 2.819578, 0.7411765, 0, 1, 1,
0.7530274, -0.6756878, 3.395729, 0.7450981, 0, 1, 1,
0.759409, -0.4943533, 3.615903, 0.7529412, 0, 1, 1,
0.7647914, -1.187427, 4.563467, 0.7568628, 0, 1, 1,
0.7651926, -1.571119, 2.969824, 0.7647059, 0, 1, 1,
0.766302, -2.611671, 2.893216, 0.7686275, 0, 1, 1,
0.766929, 0.4572803, 3.620032, 0.7764706, 0, 1, 1,
0.7673652, 0.1083999, 3.367014, 0.7803922, 0, 1, 1,
0.7697839, 1.830885, 1.410548, 0.7882353, 0, 1, 1,
0.7754311, 0.01978781, 1.318129, 0.7921569, 0, 1, 1,
0.7798558, -1.475875, 3.374981, 0.8, 0, 1, 1,
0.785891, 0.1136141, 0.477786, 0.8078431, 0, 1, 1,
0.7904385, -1.159228, 2.895163, 0.8117647, 0, 1, 1,
0.801057, 0.5595362, 0.9079497, 0.8196079, 0, 1, 1,
0.8037802, -0.1957729, 2.380578, 0.8235294, 0, 1, 1,
0.805172, -1.844177, 1.537698, 0.8313726, 0, 1, 1,
0.8082133, 1.092746, 0.5969025, 0.8352941, 0, 1, 1,
0.809782, -0.7712431, 1.763516, 0.8431373, 0, 1, 1,
0.8100967, 0.4261024, 1.20631, 0.8470588, 0, 1, 1,
0.8102923, 0.2489617, 0.07541899, 0.854902, 0, 1, 1,
0.8121917, -0.2253494, 0.004074403, 0.8588235, 0, 1, 1,
0.8142239, -0.6142814, 2.231748, 0.8666667, 0, 1, 1,
0.8182968, 0.5805963, 0.670424, 0.8705882, 0, 1, 1,
0.8240262, -0.09554882, 2.435283, 0.8784314, 0, 1, 1,
0.8250887, 0.0254632, 3.486366, 0.8823529, 0, 1, 1,
0.8339981, -0.8031604, 2.514363, 0.8901961, 0, 1, 1,
0.839183, 1.325681, 0.8937491, 0.8941177, 0, 1, 1,
0.8418983, 0.3048339, 0.4876997, 0.9019608, 0, 1, 1,
0.8507338, -0.6541354, 1.421047, 0.9098039, 0, 1, 1,
0.8516504, 0.7749174, -1.312286, 0.9137255, 0, 1, 1,
0.8567518, -1.661628, 2.62205, 0.9215686, 0, 1, 1,
0.8686087, -0.05915346, 0.9279587, 0.9254902, 0, 1, 1,
0.8693989, 1.066992, 0.325078, 0.9333333, 0, 1, 1,
0.8746989, 1.186514, 0.1820976, 0.9372549, 0, 1, 1,
0.8749034, -0.4728959, 2.241246, 0.945098, 0, 1, 1,
0.8783574, -0.6123961, 3.532794, 0.9490196, 0, 1, 1,
0.882324, -0.4010894, 0.728336, 0.9568627, 0, 1, 1,
0.8849097, 1.384213, -0.9431167, 0.9607843, 0, 1, 1,
0.8860757, -0.05215025, 2.755767, 0.9686275, 0, 1, 1,
0.8860804, 0.2051497, 0.4927005, 0.972549, 0, 1, 1,
0.8916314, -0.1816791, 2.010765, 0.9803922, 0, 1, 1,
0.8951099, 0.3902733, 1.185853, 0.9843137, 0, 1, 1,
0.8974256, -0.9194183, 2.239091, 0.9921569, 0, 1, 1,
0.8989265, 0.4203817, 2.263927, 0.9960784, 0, 1, 1,
0.9002925, -0.5577337, 2.323276, 1, 0, 0.9960784, 1,
0.9025983, 0.5669812, 1.378061, 1, 0, 0.9882353, 1,
0.9038713, 1.078518, -0.6353461, 1, 0, 0.9843137, 1,
0.9055197, 0.01952951, 4.114913, 1, 0, 0.9764706, 1,
0.9069209, 0.582029, -0.05322449, 1, 0, 0.972549, 1,
0.9097038, 0.977909, 0.8583311, 1, 0, 0.9647059, 1,
0.9103709, -0.4596849, 2.587465, 1, 0, 0.9607843, 1,
0.9126636, 2.294466, -0.1154073, 1, 0, 0.9529412, 1,
0.9150845, -1.862134, 2.059112, 1, 0, 0.9490196, 1,
0.9216512, 1.902355, 0.5848227, 1, 0, 0.9411765, 1,
0.9258042, -0.2033226, 0.7441607, 1, 0, 0.9372549, 1,
0.9283234, -0.4670167, 3.836158, 1, 0, 0.9294118, 1,
0.9302656, -0.5990989, 1.594404, 1, 0, 0.9254902, 1,
0.9375381, 0.5960608, 2.556973, 1, 0, 0.9176471, 1,
0.9400606, -1.221899, 2.652862, 1, 0, 0.9137255, 1,
0.9451061, 1.079242, 0.7164545, 1, 0, 0.9058824, 1,
0.9546174, -0.9842145, 2.728007, 1, 0, 0.9019608, 1,
0.9549458, -0.4809416, 1.341792, 1, 0, 0.8941177, 1,
0.9566421, 1.235322, 1.755281, 1, 0, 0.8862745, 1,
0.960869, 0.7341385, 3.334041, 1, 0, 0.8823529, 1,
0.9628518, -0.7531272, 2.831786, 1, 0, 0.8745098, 1,
0.9702979, -0.280776, 3.431997, 1, 0, 0.8705882, 1,
0.9735231, -0.2701921, 2.524211, 1, 0, 0.8627451, 1,
0.9779655, -1.654945, 1.734862, 1, 0, 0.8588235, 1,
0.9791107, -0.5404969, 1.514665, 1, 0, 0.8509804, 1,
0.9822192, -0.01867486, 2.041525, 1, 0, 0.8470588, 1,
0.987738, 0.7556608, 1.424337, 1, 0, 0.8392157, 1,
0.9883353, -0.286869, 0.5156549, 1, 0, 0.8352941, 1,
0.9972525, -1.131657, 1.551256, 1, 0, 0.827451, 1,
0.9987779, 0.01293254, 1.782151, 1, 0, 0.8235294, 1,
0.9990749, 1.249345, 0.865152, 1, 0, 0.8156863, 1,
1.004085, 1.04822, -0.603226, 1, 0, 0.8117647, 1,
1.005041, -0.0248238, 2.102899, 1, 0, 0.8039216, 1,
1.005549, 0.1316528, 1.493557, 1, 0, 0.7960784, 1,
1.018326, -1.006811, 4.430239, 1, 0, 0.7921569, 1,
1.022934, -0.2379454, 1.286496, 1, 0, 0.7843137, 1,
1.037462, 0.1051063, 1.490505, 1, 0, 0.7803922, 1,
1.042453, 0.4700556, 0.665922, 1, 0, 0.772549, 1,
1.059704, -0.2584279, 2.266906, 1, 0, 0.7686275, 1,
1.066441, 1.376726, 0.2801322, 1, 0, 0.7607843, 1,
1.071292, 0.4570828, 0.4979221, 1, 0, 0.7568628, 1,
1.072427, -1.405644, 2.586574, 1, 0, 0.7490196, 1,
1.081829, 0.7656103, -1.081272, 1, 0, 0.7450981, 1,
1.083784, -1.504156, 3.343262, 1, 0, 0.7372549, 1,
1.084125, 0.1554673, 1.319585, 1, 0, 0.7333333, 1,
1.084999, 1.523703, 0.53858, 1, 0, 0.7254902, 1,
1.086544, -0.3575181, 2.150561, 1, 0, 0.7215686, 1,
1.088845, 0.3657106, 1.076675, 1, 0, 0.7137255, 1,
1.091304, -1.348556, 3.517199, 1, 0, 0.7098039, 1,
1.091636, -0.269058, 2.766768, 1, 0, 0.7019608, 1,
1.109077, -0.5341644, 2.121911, 1, 0, 0.6941177, 1,
1.110594, -1.260793, 1.55793, 1, 0, 0.6901961, 1,
1.125642, -1.030293, 3.426278, 1, 0, 0.682353, 1,
1.131182, -0.4943614, 2.810243, 1, 0, 0.6784314, 1,
1.133775, -0.7280362, 3.114768, 1, 0, 0.6705883, 1,
1.137108, -1.571096, 1.068705, 1, 0, 0.6666667, 1,
1.146194, 1.376369, 0.9028118, 1, 0, 0.6588235, 1,
1.147868, -0.2796532, 1.597063, 1, 0, 0.654902, 1,
1.153743, 0.6172257, 2.551016, 1, 0, 0.6470588, 1,
1.162726, -0.8078877, 1.694193, 1, 0, 0.6431373, 1,
1.164463, -2.664862, 3.243429, 1, 0, 0.6352941, 1,
1.172395, -0.007247384, 2.58197, 1, 0, 0.6313726, 1,
1.178132, -2.752356, 3.686513, 1, 0, 0.6235294, 1,
1.181583, 0.6975093, 0.9706762, 1, 0, 0.6196079, 1,
1.186132, 0.1626188, -0.05530903, 1, 0, 0.6117647, 1,
1.189079, 0.4374133, 2.349407, 1, 0, 0.6078432, 1,
1.192443, -0.9350603, 3.50423, 1, 0, 0.6, 1,
1.195937, 0.05693338, 1.702376, 1, 0, 0.5921569, 1,
1.197818, -0.06310119, 1.382314, 1, 0, 0.5882353, 1,
1.198512, -0.1023735, 0.6699641, 1, 0, 0.5803922, 1,
1.199708, 0.2984526, 0.3925842, 1, 0, 0.5764706, 1,
1.206609, -1.209106, 2.800972, 1, 0, 0.5686275, 1,
1.214449, -0.0709471, 0.6803862, 1, 0, 0.5647059, 1,
1.239075, 0.1101457, 3.588565, 1, 0, 0.5568628, 1,
1.239284, -0.5459754, 2.756765, 1, 0, 0.5529412, 1,
1.245527, 1.153001, 0.5838249, 1, 0, 0.5450981, 1,
1.246398, 0.8024834, 1.012629, 1, 0, 0.5411765, 1,
1.251478, -0.2726052, 3.804152, 1, 0, 0.5333334, 1,
1.25619, -0.6867285, 1.114041, 1, 0, 0.5294118, 1,
1.293666, -1.096462, 1.595863, 1, 0, 0.5215687, 1,
1.29686, -0.3640623, 2.563051, 1, 0, 0.5176471, 1,
1.298264, 1.038625, 0.506538, 1, 0, 0.509804, 1,
1.298373, -0.4879379, 2.666423, 1, 0, 0.5058824, 1,
1.303899, 1.336205, 1.053173, 1, 0, 0.4980392, 1,
1.309445, 0.06423657, 2.584991, 1, 0, 0.4901961, 1,
1.324635, -1.899703, 2.700045, 1, 0, 0.4862745, 1,
1.325027, -0.08372437, 0.7604135, 1, 0, 0.4784314, 1,
1.337003, 0.4673111, -0.01390002, 1, 0, 0.4745098, 1,
1.360712, -0.7580792, 0.6635072, 1, 0, 0.4666667, 1,
1.36102, -0.02454123, 1.284981, 1, 0, 0.4627451, 1,
1.375199, -0.2019567, 3.276519, 1, 0, 0.454902, 1,
1.382372, -0.1588899, 1.703973, 1, 0, 0.4509804, 1,
1.383114, 0.833285, 1.684613, 1, 0, 0.4431373, 1,
1.401486, -0.6636443, 2.362267, 1, 0, 0.4392157, 1,
1.425141, -2.092514, 4.687156, 1, 0, 0.4313726, 1,
1.444113, -0.9615867, 1.921283, 1, 0, 0.427451, 1,
1.455143, -1.037719, 3.588269, 1, 0, 0.4196078, 1,
1.461476, -1.327094, 1.773479, 1, 0, 0.4156863, 1,
1.468328, -0.2985416, 1.018637, 1, 0, 0.4078431, 1,
1.471197, -0.9725901, 4.101695, 1, 0, 0.4039216, 1,
1.486583, -0.7600903, 2.592091, 1, 0, 0.3960784, 1,
1.496259, 0.5079075, 0.3431066, 1, 0, 0.3882353, 1,
1.50342, -0.9521635, 0.2154281, 1, 0, 0.3843137, 1,
1.505615, 0.6179481, 2.12469, 1, 0, 0.3764706, 1,
1.514172, -2.616274, 2.61986, 1, 0, 0.372549, 1,
1.521022, -0.8337197, 2.601047, 1, 0, 0.3647059, 1,
1.541287, -0.6448507, 2.266512, 1, 0, 0.3607843, 1,
1.544632, 0.157031, 1.375112, 1, 0, 0.3529412, 1,
1.551547, 2.935168, 1.223938, 1, 0, 0.3490196, 1,
1.597604, -0.01845608, 0.01929979, 1, 0, 0.3411765, 1,
1.615782, -0.05762922, 1.22723, 1, 0, 0.3372549, 1,
1.635142, 1.442359, 1.095198, 1, 0, 0.3294118, 1,
1.636947, 1.750564, -0.8948025, 1, 0, 0.3254902, 1,
1.6386, -1.863418, 2.328349, 1, 0, 0.3176471, 1,
1.645554, 1.304149, 0.4894981, 1, 0, 0.3137255, 1,
1.660187, 1.943259, 0.1365172, 1, 0, 0.3058824, 1,
1.673147, -0.6020563, 0.9088601, 1, 0, 0.2980392, 1,
1.673241, -0.6372132, 2.582359, 1, 0, 0.2941177, 1,
1.679497, 1.013558, 1.826756, 1, 0, 0.2862745, 1,
1.700969, -0.3539329, -0.0441502, 1, 0, 0.282353, 1,
1.720705, 1.340164, 1.00655, 1, 0, 0.2745098, 1,
1.729764, -0.6065404, 0.1460804, 1, 0, 0.2705882, 1,
1.753409, 0.2410495, -0.1865865, 1, 0, 0.2627451, 1,
1.769397, 1.772373, -0.12228, 1, 0, 0.2588235, 1,
1.781388, 0.4407186, 1.938591, 1, 0, 0.2509804, 1,
1.787235, 0.7720798, 2.012976, 1, 0, 0.2470588, 1,
1.791464, 0.6940746, -0.6354734, 1, 0, 0.2392157, 1,
1.812416, -0.3086008, 1.561254, 1, 0, 0.2352941, 1,
1.818809, -3.429575, 3.411417, 1, 0, 0.227451, 1,
1.834804, 0.1157645, 2.475755, 1, 0, 0.2235294, 1,
1.850532, 1.078046, 1.594646, 1, 0, 0.2156863, 1,
1.85115, 0.4538615, -0.4421361, 1, 0, 0.2117647, 1,
1.875135, -0.6081185, 2.501273, 1, 0, 0.2039216, 1,
1.877535, -1.172531, 2.064817, 1, 0, 0.1960784, 1,
1.890593, 0.178682, 1.14736, 1, 0, 0.1921569, 1,
1.89101, -0.5185664, 2.359872, 1, 0, 0.1843137, 1,
1.901502, 1.102085, 0.06561399, 1, 0, 0.1803922, 1,
1.919191, 0.24717, 0.3357073, 1, 0, 0.172549, 1,
1.932725, 0.06367898, 1.261621, 1, 0, 0.1686275, 1,
1.949622, 0.6809438, -0.6152372, 1, 0, 0.1607843, 1,
1.96459, 0.826746, -0.8980263, 1, 0, 0.1568628, 1,
1.966099, -0.1519758, 1.014243, 1, 0, 0.1490196, 1,
1.966703, -0.5722288, 1.271953, 1, 0, 0.145098, 1,
1.967519, 0.3413768, -0.2634652, 1, 0, 0.1372549, 1,
2.029219, 1.23122, 0.1292612, 1, 0, 0.1333333, 1,
2.059894, -0.2193505, 2.399181, 1, 0, 0.1254902, 1,
2.109133, -1.989826, 2.672756, 1, 0, 0.1215686, 1,
2.114291, -0.4423868, 2.811639, 1, 0, 0.1137255, 1,
2.153174, -0.1733489, 3.212724, 1, 0, 0.1098039, 1,
2.168581, -0.4883266, 0.9344944, 1, 0, 0.1019608, 1,
2.205454, -1.047144, 3.360862, 1, 0, 0.09411765, 1,
2.218238, -0.2991928, 3.195133, 1, 0, 0.09019608, 1,
2.242026, -0.775561, 2.123514, 1, 0, 0.08235294, 1,
2.247208, 0.3206476, 0.2603491, 1, 0, 0.07843138, 1,
2.268617, 1.234596, 0.6223444, 1, 0, 0.07058824, 1,
2.273239, -0.8549796, 2.346041, 1, 0, 0.06666667, 1,
2.2961, -1.639879, 2.345804, 1, 0, 0.05882353, 1,
2.314749, -2.200262, 2.041852, 1, 0, 0.05490196, 1,
2.330263, 0.8043599, -0.6928447, 1, 0, 0.04705882, 1,
2.357325, 1.326935, -0.4678027, 1, 0, 0.04313726, 1,
2.431365, 1.075673, 1.853549, 1, 0, 0.03529412, 1,
2.438451, -1.275277, 3.504051, 1, 0, 0.03137255, 1,
2.495178, -0.4662448, 4.344829, 1, 0, 0.02352941, 1,
2.591872, -0.4924956, 4.116406, 1, 0, 0.01960784, 1,
2.734362, -1.426027, 1.426046, 1, 0, 0.01176471, 1,
3.43699, 0.06122195, 1.444208, 1, 0, 0.007843138, 1
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
0.1888807, -4.508399, -7.095833, 0, -0.5, 0.5, 0.5,
0.1888807, -4.508399, -7.095833, 1, -0.5, 0.5, 0.5,
0.1888807, -4.508399, -7.095833, 1, 1.5, 0.5, 0.5,
0.1888807, -4.508399, -7.095833, 0, 1.5, 0.5, 0.5
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
-4.160337, -0.2472036, -7.095833, 0, -0.5, 0.5, 0.5,
-4.160337, -0.2472036, -7.095833, 1, -0.5, 0.5, 0.5,
-4.160337, -0.2472036, -7.095833, 1, 1.5, 0.5, 0.5,
-4.160337, -0.2472036, -7.095833, 0, 1.5, 0.5, 0.5
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
-4.160337, -4.508399, -0.03811073, 0, -0.5, 0.5, 0.5,
-4.160337, -4.508399, -0.03811073, 1, -0.5, 0.5, 0.5,
-4.160337, -4.508399, -0.03811073, 1, 1.5, 0.5, 0.5,
-4.160337, -4.508399, -0.03811073, 0, 1.5, 0.5, 0.5
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
-3, -3.525046, -5.467128,
3, -3.525046, -5.467128,
-3, -3.525046, -5.467128,
-3, -3.688938, -5.738578,
-2, -3.525046, -5.467128,
-2, -3.688938, -5.738578,
-1, -3.525046, -5.467128,
-1, -3.688938, -5.738578,
0, -3.525046, -5.467128,
0, -3.688938, -5.738578,
1, -3.525046, -5.467128,
1, -3.688938, -5.738578,
2, -3.525046, -5.467128,
2, -3.688938, -5.738578,
3, -3.525046, -5.467128,
3, -3.688938, -5.738578
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
-3, -4.016722, -6.28148, 0, -0.5, 0.5, 0.5,
-3, -4.016722, -6.28148, 1, -0.5, 0.5, 0.5,
-3, -4.016722, -6.28148, 1, 1.5, 0.5, 0.5,
-3, -4.016722, -6.28148, 0, 1.5, 0.5, 0.5,
-2, -4.016722, -6.28148, 0, -0.5, 0.5, 0.5,
-2, -4.016722, -6.28148, 1, -0.5, 0.5, 0.5,
-2, -4.016722, -6.28148, 1, 1.5, 0.5, 0.5,
-2, -4.016722, -6.28148, 0, 1.5, 0.5, 0.5,
-1, -4.016722, -6.28148, 0, -0.5, 0.5, 0.5,
-1, -4.016722, -6.28148, 1, -0.5, 0.5, 0.5,
-1, -4.016722, -6.28148, 1, 1.5, 0.5, 0.5,
-1, -4.016722, -6.28148, 0, 1.5, 0.5, 0.5,
0, -4.016722, -6.28148, 0, -0.5, 0.5, 0.5,
0, -4.016722, -6.28148, 1, -0.5, 0.5, 0.5,
0, -4.016722, -6.28148, 1, 1.5, 0.5, 0.5,
0, -4.016722, -6.28148, 0, 1.5, 0.5, 0.5,
1, -4.016722, -6.28148, 0, -0.5, 0.5, 0.5,
1, -4.016722, -6.28148, 1, -0.5, 0.5, 0.5,
1, -4.016722, -6.28148, 1, 1.5, 0.5, 0.5,
1, -4.016722, -6.28148, 0, 1.5, 0.5, 0.5,
2, -4.016722, -6.28148, 0, -0.5, 0.5, 0.5,
2, -4.016722, -6.28148, 1, -0.5, 0.5, 0.5,
2, -4.016722, -6.28148, 1, 1.5, 0.5, 0.5,
2, -4.016722, -6.28148, 0, 1.5, 0.5, 0.5,
3, -4.016722, -6.28148, 0, -0.5, 0.5, 0.5,
3, -4.016722, -6.28148, 1, -0.5, 0.5, 0.5,
3, -4.016722, -6.28148, 1, 1.5, 0.5, 0.5,
3, -4.016722, -6.28148, 0, 1.5, 0.5, 0.5
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
-3.156672, -3, -5.467128,
-3.156672, 2, -5.467128,
-3.156672, -3, -5.467128,
-3.323949, -3, -5.738578,
-3.156672, -2, -5.467128,
-3.323949, -2, -5.738578,
-3.156672, -1, -5.467128,
-3.323949, -1, -5.738578,
-3.156672, 0, -5.467128,
-3.323949, 0, -5.738578,
-3.156672, 1, -5.467128,
-3.323949, 1, -5.738578,
-3.156672, 2, -5.467128,
-3.323949, 2, -5.738578
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
-3.658504, -3, -6.28148, 0, -0.5, 0.5, 0.5,
-3.658504, -3, -6.28148, 1, -0.5, 0.5, 0.5,
-3.658504, -3, -6.28148, 1, 1.5, 0.5, 0.5,
-3.658504, -3, -6.28148, 0, 1.5, 0.5, 0.5,
-3.658504, -2, -6.28148, 0, -0.5, 0.5, 0.5,
-3.658504, -2, -6.28148, 1, -0.5, 0.5, 0.5,
-3.658504, -2, -6.28148, 1, 1.5, 0.5, 0.5,
-3.658504, -2, -6.28148, 0, 1.5, 0.5, 0.5,
-3.658504, -1, -6.28148, 0, -0.5, 0.5, 0.5,
-3.658504, -1, -6.28148, 1, -0.5, 0.5, 0.5,
-3.658504, -1, -6.28148, 1, 1.5, 0.5, 0.5,
-3.658504, -1, -6.28148, 0, 1.5, 0.5, 0.5,
-3.658504, 0, -6.28148, 0, -0.5, 0.5, 0.5,
-3.658504, 0, -6.28148, 1, -0.5, 0.5, 0.5,
-3.658504, 0, -6.28148, 1, 1.5, 0.5, 0.5,
-3.658504, 0, -6.28148, 0, 1.5, 0.5, 0.5,
-3.658504, 1, -6.28148, 0, -0.5, 0.5, 0.5,
-3.658504, 1, -6.28148, 1, -0.5, 0.5, 0.5,
-3.658504, 1, -6.28148, 1, 1.5, 0.5, 0.5,
-3.658504, 1, -6.28148, 0, 1.5, 0.5, 0.5,
-3.658504, 2, -6.28148, 0, -0.5, 0.5, 0.5,
-3.658504, 2, -6.28148, 1, -0.5, 0.5, 0.5,
-3.658504, 2, -6.28148, 1, 1.5, 0.5, 0.5,
-3.658504, 2, -6.28148, 0, 1.5, 0.5, 0.5
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
-3.156672, -3.525046, -4,
-3.156672, -3.525046, 4,
-3.156672, -3.525046, -4,
-3.323949, -3.688938, -4,
-3.156672, -3.525046, -2,
-3.323949, -3.688938, -2,
-3.156672, -3.525046, 0,
-3.323949, -3.688938, 0,
-3.156672, -3.525046, 2,
-3.323949, -3.688938, 2,
-3.156672, -3.525046, 4,
-3.323949, -3.688938, 4
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
-3.658504, -4.016722, -4, 0, -0.5, 0.5, 0.5,
-3.658504, -4.016722, -4, 1, -0.5, 0.5, 0.5,
-3.658504, -4.016722, -4, 1, 1.5, 0.5, 0.5,
-3.658504, -4.016722, -4, 0, 1.5, 0.5, 0.5,
-3.658504, -4.016722, -2, 0, -0.5, 0.5, 0.5,
-3.658504, -4.016722, -2, 1, -0.5, 0.5, 0.5,
-3.658504, -4.016722, -2, 1, 1.5, 0.5, 0.5,
-3.658504, -4.016722, -2, 0, 1.5, 0.5, 0.5,
-3.658504, -4.016722, 0, 0, -0.5, 0.5, 0.5,
-3.658504, -4.016722, 0, 1, -0.5, 0.5, 0.5,
-3.658504, -4.016722, 0, 1, 1.5, 0.5, 0.5,
-3.658504, -4.016722, 0, 0, 1.5, 0.5, 0.5,
-3.658504, -4.016722, 2, 0, -0.5, 0.5, 0.5,
-3.658504, -4.016722, 2, 1, -0.5, 0.5, 0.5,
-3.658504, -4.016722, 2, 1, 1.5, 0.5, 0.5,
-3.658504, -4.016722, 2, 0, 1.5, 0.5, 0.5,
-3.658504, -4.016722, 4, 0, -0.5, 0.5, 0.5,
-3.658504, -4.016722, 4, 1, -0.5, 0.5, 0.5,
-3.658504, -4.016722, 4, 1, 1.5, 0.5, 0.5,
-3.658504, -4.016722, 4, 0, 1.5, 0.5, 0.5
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
-3.156672, -3.525046, -5.467128,
-3.156672, 3.030639, -5.467128,
-3.156672, -3.525046, 5.390906,
-3.156672, 3.030639, 5.390906,
-3.156672, -3.525046, -5.467128,
-3.156672, -3.525046, 5.390906,
-3.156672, 3.030639, -5.467128,
-3.156672, 3.030639, 5.390906,
-3.156672, -3.525046, -5.467128,
3.534433, -3.525046, -5.467128,
-3.156672, -3.525046, 5.390906,
3.534433, -3.525046, 5.390906,
-3.156672, 3.030639, -5.467128,
3.534433, 3.030639, -5.467128,
-3.156672, 3.030639, 5.390906,
3.534433, 3.030639, 5.390906,
3.534433, -3.525046, -5.467128,
3.534433, 3.030639, -5.467128,
3.534433, -3.525046, 5.390906,
3.534433, 3.030639, 5.390906,
3.534433, -3.525046, -5.467128,
3.534433, -3.525046, 5.390906,
3.534433, 3.030639, -5.467128,
3.534433, 3.030639, 5.390906
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
var radius = 7.657452;
var distance = 34.06887;
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
mvMatrix.translate( -0.1888807, 0.2472036, 0.03811073 );
mvMatrix.scale( 1.237372, 1.262933, 0.7625126 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06887);
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
Methoxychlor_olefin<-read.table("Methoxychlor_olefin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methoxychlor_olefin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methoxychlor_olefin' not found
```

```r
y<-Methoxychlor_olefin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methoxychlor_olefin' not found
```

```r
z<-Methoxychlor_olefin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methoxychlor_olefin' not found
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
-3.059228, -0.8136525, -1.989833, 0, 0, 1, 1, 1,
-2.64521, -0.7817751, -0.9274574, 1, 0, 0, 1, 1,
-2.51441, 0.4095428, -1.012088, 1, 0, 0, 1, 1,
-2.472471, -0.008076151, 0.2897578, 1, 0, 0, 1, 1,
-2.428941, 0.8324389, -2.271515, 1, 0, 0, 1, 1,
-2.40272, -0.8671629, -1.666853, 1, 0, 0, 1, 1,
-2.38993, 0.6643942, -1.137298, 0, 0, 0, 1, 1,
-2.380017, 0.7261326, 0.3822177, 0, 0, 0, 1, 1,
-2.301062, -0.964034, -0.5718698, 0, 0, 0, 1, 1,
-2.284167, 0.57945, -0.9785799, 0, 0, 0, 1, 1,
-2.265392, -0.3929414, -2.578415, 0, 0, 0, 1, 1,
-2.250202, -1.155323, -3.544575, 0, 0, 0, 1, 1,
-2.244292, -0.5989853, -1.670792, 0, 0, 0, 1, 1,
-2.172323, 1.784912, 0.2622954, 1, 1, 1, 1, 1,
-2.148129, 0.3943099, 0.4174149, 1, 1, 1, 1, 1,
-2.125789, 0.7984167, -0.4480787, 1, 1, 1, 1, 1,
-2.091368, -1.619361, -1.975703, 1, 1, 1, 1, 1,
-2.086897, 0.9509342, -2.128798, 1, 1, 1, 1, 1,
-2.086337, -0.4859212, -2.851112, 1, 1, 1, 1, 1,
-2.077822, 1.330615, -1.871925, 1, 1, 1, 1, 1,
-2.05732, 0.5782657, -0.275868, 1, 1, 1, 1, 1,
-2.039486, 0.3605852, -2.021907, 1, 1, 1, 1, 1,
-2.03047, -1.030184, -1.880639, 1, 1, 1, 1, 1,
-1.975558, -0.0156822, -1.517606, 1, 1, 1, 1, 1,
-1.9298, -1.003482, -1.368705, 1, 1, 1, 1, 1,
-1.927826, 1.961098e-05, -0.6957191, 1, 1, 1, 1, 1,
-1.886201, -0.5116361, -1.90366, 1, 1, 1, 1, 1,
-1.886047, -0.3300192, -2.814173, 1, 1, 1, 1, 1,
-1.873283, -0.5755998, -1.812832, 0, 0, 1, 1, 1,
-1.827656, 0.9598142, -1.050126, 1, 0, 0, 1, 1,
-1.825502, -1.211063, -3.104702, 1, 0, 0, 1, 1,
-1.823479, -0.3478526, -2.887612, 1, 0, 0, 1, 1,
-1.819693, 0.206964, -3.716708, 1, 0, 0, 1, 1,
-1.803871, -0.4149132, -1.905447, 1, 0, 0, 1, 1,
-1.793675, 0.270025, -1.926935, 0, 0, 0, 1, 1,
-1.792995, -0.169643, 0.01258908, 0, 0, 0, 1, 1,
-1.777816, 0.007176784, -0.5664083, 0, 0, 0, 1, 1,
-1.769965, -1.426665, -2.220665, 0, 0, 0, 1, 1,
-1.767421, -0.6404808, -3.368729, 0, 0, 0, 1, 1,
-1.732419, 0.1053232, -4.079317, 0, 0, 0, 1, 1,
-1.732118, -1.038352, -1.480217, 0, 0, 0, 1, 1,
-1.711836, -1.618473, -2.912367, 1, 1, 1, 1, 1,
-1.709676, 0.4122536, -2.180918, 1, 1, 1, 1, 1,
-1.702351, 0.4796336, -1.836608, 1, 1, 1, 1, 1,
-1.688874, 0.8571042, -1.408039, 1, 1, 1, 1, 1,
-1.678927, -0.3528085, -2.464952, 1, 1, 1, 1, 1,
-1.669185, -1.804733, -1.539359, 1, 1, 1, 1, 1,
-1.658953, 1.36812, 0.5885773, 1, 1, 1, 1, 1,
-1.649161, 0.6818238, 1.908934, 1, 1, 1, 1, 1,
-1.638604, 0.005893869, -1.526342, 1, 1, 1, 1, 1,
-1.629248, -0.236108, -2.386512, 1, 1, 1, 1, 1,
-1.628129, 1.347932, -0.9501097, 1, 1, 1, 1, 1,
-1.626071, -0.06808038, -2.330479, 1, 1, 1, 1, 1,
-1.623683, -2.005744, -1.230656, 1, 1, 1, 1, 1,
-1.617767, -0.8248468, -1.782135, 1, 1, 1, 1, 1,
-1.611694, -0.1819454, -1.531055, 1, 1, 1, 1, 1,
-1.611262, -0.4165324, -1.185116, 0, 0, 1, 1, 1,
-1.605643, -1.262413, -2.120792, 1, 0, 0, 1, 1,
-1.591324, 1.512738, 0.3155656, 1, 0, 0, 1, 1,
-1.586812, 0.8935229, -4.479709, 1, 0, 0, 1, 1,
-1.566782, -0.633087, -1.428346, 1, 0, 0, 1, 1,
-1.548178, -0.4867319, -2.799882, 1, 0, 0, 1, 1,
-1.534581, 0.6227445, -0.6525196, 0, 0, 0, 1, 1,
-1.529613, 0.2004533, -1.475216, 0, 0, 0, 1, 1,
-1.516458, 0.7797189, -0.4124927, 0, 0, 0, 1, 1,
-1.512536, 1.604572, -0.9483238, 0, 0, 0, 1, 1,
-1.511714, -0.9191583, -4.033654, 0, 0, 0, 1, 1,
-1.505032, 0.3845774, -0.6724524, 0, 0, 0, 1, 1,
-1.504421, -1.104038, -1.987802, 0, 0, 0, 1, 1,
-1.502254, -0.9070091, -2.337142, 1, 1, 1, 1, 1,
-1.491049, 0.327791, -1.849256, 1, 1, 1, 1, 1,
-1.489932, -0.4646737, -1.609662, 1, 1, 1, 1, 1,
-1.486605, 2.446045, -1.403953, 1, 1, 1, 1, 1,
-1.47585, 0.1641777, -2.585475, 1, 1, 1, 1, 1,
-1.472433, 1.324879, -0.1338484, 1, 1, 1, 1, 1,
-1.452828, -1.523097, -2.045928, 1, 1, 1, 1, 1,
-1.448583, -0.6941558, 0.4629442, 1, 1, 1, 1, 1,
-1.433402, -0.4688937, -2.492324, 1, 1, 1, 1, 1,
-1.430573, 1.22615, 0.6531121, 1, 1, 1, 1, 1,
-1.430543, 0.9532018, -0.399596, 1, 1, 1, 1, 1,
-1.414504, 0.4003017, -3.477328, 1, 1, 1, 1, 1,
-1.412455, 0.0869939, -1.680462, 1, 1, 1, 1, 1,
-1.411852, 1.311057, -2.796353, 1, 1, 1, 1, 1,
-1.411428, 1.373943, -0.06483276, 1, 1, 1, 1, 1,
-1.409904, 0.6232316, -0.5503413, 0, 0, 1, 1, 1,
-1.4029, -0.008996973, -0.5566087, 1, 0, 0, 1, 1,
-1.40194, -0.2764045, -2.486662, 1, 0, 0, 1, 1,
-1.398029, 0.9544287, -2.251607, 1, 0, 0, 1, 1,
-1.394388, 0.3727587, -0.02990554, 1, 0, 0, 1, 1,
-1.393186, 0.5876021, -1.563711, 1, 0, 0, 1, 1,
-1.382842, 0.07834781, -0.9188263, 0, 0, 0, 1, 1,
-1.378036, -1.550158, -1.254113, 0, 0, 0, 1, 1,
-1.377425, -0.03496275, -2.878931, 0, 0, 0, 1, 1,
-1.351888, -1.411606, 0.05452386, 0, 0, 0, 1, 1,
-1.351616, -0.4130328, -0.7390263, 0, 0, 0, 1, 1,
-1.34664, -0.7479305, -1.475814, 0, 0, 0, 1, 1,
-1.346328, 1.900473, -2.70855, 0, 0, 0, 1, 1,
-1.344814, -1.481292, -2.271939, 1, 1, 1, 1, 1,
-1.340958, -0.5526127, -2.072838, 1, 1, 1, 1, 1,
-1.338084, 1.087529, -1.214481, 1, 1, 1, 1, 1,
-1.331199, -0.7031522, -2.780325, 1, 1, 1, 1, 1,
-1.330465, 1.527764, 1.608355, 1, 1, 1, 1, 1,
-1.327525, 0.002098948, -0.8607187, 1, 1, 1, 1, 1,
-1.319165, 1.00611, -1.443203, 1, 1, 1, 1, 1,
-1.313337, 1.117512, -1.75431, 1, 1, 1, 1, 1,
-1.309384, -0.6665699, -1.621088, 1, 1, 1, 1, 1,
-1.307182, -0.08653005, -1.594411, 1, 1, 1, 1, 1,
-1.306661, 2.754712, -1.183407, 1, 1, 1, 1, 1,
-1.306651, -0.1572576, -2.294612, 1, 1, 1, 1, 1,
-1.30434, -0.4080772, -2.771124, 1, 1, 1, 1, 1,
-1.2998, -0.4352814, -3.915485, 1, 1, 1, 1, 1,
-1.296371, -0.7447451, -2.544137, 1, 1, 1, 1, 1,
-1.292052, 0.9731113, -1.222601, 0, 0, 1, 1, 1,
-1.289818, -1.938534, -0.5973676, 1, 0, 0, 1, 1,
-1.287838, 1.403947, -0.2004591, 1, 0, 0, 1, 1,
-1.278089, -0.1387926, -2.542834, 1, 0, 0, 1, 1,
-1.275945, -0.04571576, -2.813264, 1, 0, 0, 1, 1,
-1.273339, 1.114881, -1.392718, 1, 0, 0, 1, 1,
-1.272571, 1.540035, -1.31034, 0, 0, 0, 1, 1,
-1.270073, -1.45914, -4.633724, 0, 0, 0, 1, 1,
-1.265847, 1.437981, 0.4828188, 0, 0, 0, 1, 1,
-1.248544, -0.1650316, -2.353104, 0, 0, 0, 1, 1,
-1.235353, -0.31265, -0.4945762, 0, 0, 0, 1, 1,
-1.231906, -0.5052232, -1.099055, 0, 0, 0, 1, 1,
-1.231642, 0.4196903, -0.2354359, 0, 0, 0, 1, 1,
-1.231024, 2.538418, -0.3066208, 1, 1, 1, 1, 1,
-1.230563, -0.3732247, -0.8584267, 1, 1, 1, 1, 1,
-1.227695, 0.1015824, -1.221801, 1, 1, 1, 1, 1,
-1.227653, 0.9617741, -1.079586, 1, 1, 1, 1, 1,
-1.227398, -0.415504, -2.064733, 1, 1, 1, 1, 1,
-1.221918, -0.2653646, -1.822671, 1, 1, 1, 1, 1,
-1.221847, 0.6084314, -1.685607, 1, 1, 1, 1, 1,
-1.216698, 0.5253251, -0.8078519, 1, 1, 1, 1, 1,
-1.204683, 0.2119253, -3.010844, 1, 1, 1, 1, 1,
-1.204019, -0.2302803, -0.03582133, 1, 1, 1, 1, 1,
-1.20258, 0.7155042, -1.106681, 1, 1, 1, 1, 1,
-1.200369, 2.552707, 0.8231548, 1, 1, 1, 1, 1,
-1.194379, 2.10438, 0.1191522, 1, 1, 1, 1, 1,
-1.19273, -0.8982182, -2.942666, 1, 1, 1, 1, 1,
-1.186673, 0.9389465, -0.8117535, 1, 1, 1, 1, 1,
-1.17978, 0.4396067, 0.001122964, 0, 0, 1, 1, 1,
-1.179193, 0.1404607, -1.743712, 1, 0, 0, 1, 1,
-1.174752, -2.484676, -4.498983, 1, 0, 0, 1, 1,
-1.173143, -0.4930336, -1.660479, 1, 0, 0, 1, 1,
-1.171419, 0.6210546, -1.326789, 1, 0, 0, 1, 1,
-1.167269, 0.1220959, -1.01014, 1, 0, 0, 1, 1,
-1.165058, 0.2571474, -2.14871, 0, 0, 0, 1, 1,
-1.162382, -0.8576249, -2.594117, 0, 0, 0, 1, 1,
-1.146144, 1.86842, 0.9993209, 0, 0, 0, 1, 1,
-1.14446, 0.2196843, 0.08511893, 0, 0, 0, 1, 1,
-1.144408, 0.4995228, -2.071569, 0, 0, 0, 1, 1,
-1.141455, -0.8367679, -0.389484, 0, 0, 0, 1, 1,
-1.137999, -1.231098, -2.504888, 0, 0, 0, 1, 1,
-1.136163, -0.3181942, -2.182136, 1, 1, 1, 1, 1,
-1.134474, -0.06887019, -1.715498, 1, 1, 1, 1, 1,
-1.129973, 1.0696, -1.57398, 1, 1, 1, 1, 1,
-1.126728, 0.4069209, -1.02274, 1, 1, 1, 1, 1,
-1.124654, -1.093858, -3.798661, 1, 1, 1, 1, 1,
-1.124429, -0.4667035, -3.193842, 1, 1, 1, 1, 1,
-1.121161, -0.5383542, 0.02868727, 1, 1, 1, 1, 1,
-1.117042, -0.8837951, -3.739959, 1, 1, 1, 1, 1,
-1.117038, 0.3729939, -0.4622228, 1, 1, 1, 1, 1,
-1.10918, 0.02099883, -1.679868, 1, 1, 1, 1, 1,
-1.107774, 0.6462461, -0.6313677, 1, 1, 1, 1, 1,
-1.107772, 0.1395019, -1.716138, 1, 1, 1, 1, 1,
-1.105505, 0.203503, -0.2019724, 1, 1, 1, 1, 1,
-1.10232, -2.542022, -2.452541, 1, 1, 1, 1, 1,
-1.100986, 2.307187, -0.9269301, 1, 1, 1, 1, 1,
-1.096909, 1.169923, -0.4666881, 0, 0, 1, 1, 1,
-1.094626, 0.4495545, -3.032349, 1, 0, 0, 1, 1,
-1.092805, -0.6939835, -2.963064, 1, 0, 0, 1, 1,
-1.092503, -1.472156, -3.119745, 1, 0, 0, 1, 1,
-1.088926, 1.033204, -0.4900634, 1, 0, 0, 1, 1,
-1.085845, 0.4266481, -0.09433521, 1, 0, 0, 1, 1,
-1.085605, -1.561272, -2.748938, 0, 0, 0, 1, 1,
-1.08324, -1.905145, -2.602335, 0, 0, 0, 1, 1,
-1.078549, -0.8019484, -2.479859, 0, 0, 0, 1, 1,
-1.067329, 0.9870167, 0.3779315, 0, 0, 0, 1, 1,
-1.065865, -0.1041807, -1.394692, 0, 0, 0, 1, 1,
-1.06484, 1.475567, -1.742453, 0, 0, 0, 1, 1,
-1.064377, 0.3967556, -0.4724771, 0, 0, 0, 1, 1,
-1.062795, 0.0949902, -1.604932, 1, 1, 1, 1, 1,
-1.062778, -0.04272406, -1.020213, 1, 1, 1, 1, 1,
-1.061206, 0.4428709, 0.3391544, 1, 1, 1, 1, 1,
-1.05734, -1.123222, -2.463308, 1, 1, 1, 1, 1,
-1.056773, -0.1031866, -2.809553, 1, 1, 1, 1, 1,
-1.056542, 0.4106281, -0.6028034, 1, 1, 1, 1, 1,
-1.054377, -0.900661, -2.02323, 1, 1, 1, 1, 1,
-1.053303, 2.03881, -0.5987617, 1, 1, 1, 1, 1,
-1.052989, -3.400223, -2.233146, 1, 1, 1, 1, 1,
-1.048915, -0.6874254, -3.861299, 1, 1, 1, 1, 1,
-1.043485, -0.6533132, -0.7803527, 1, 1, 1, 1, 1,
-1.043204, 0.2453565, -0.1949447, 1, 1, 1, 1, 1,
-1.039299, -0.377459, -1.443178, 1, 1, 1, 1, 1,
-1.038193, 0.7711837, -2.225424, 1, 1, 1, 1, 1,
-1.024192, -0.5452487, -1.80757, 1, 1, 1, 1, 1,
-1.021508, 0.8132264, -0.04506035, 0, 0, 1, 1, 1,
-1.013002, -0.5915732, -2.864809, 1, 0, 0, 1, 1,
-1.008538, 0.8858627, -0.9667873, 1, 0, 0, 1, 1,
-1.007074, -0.9343821, -2.010919, 1, 0, 0, 1, 1,
-0.9963745, -0.4406145, -1.983459, 1, 0, 0, 1, 1,
-0.9958956, -0.06836558, -1.22116, 1, 0, 0, 1, 1,
-0.9940919, -0.8743774, -4.053116, 0, 0, 0, 1, 1,
-0.9928699, 1.474925, -0.8614776, 0, 0, 0, 1, 1,
-0.9871415, 0.8450691, -0.4272535, 0, 0, 0, 1, 1,
-0.9860783, -0.7515953, -2.538254, 0, 0, 0, 1, 1,
-0.9787942, -0.02918365, 0.1401274, 0, 0, 0, 1, 1,
-0.9781696, 2.653664, 0.2162511, 0, 0, 0, 1, 1,
-0.9761692, 2.515409, 0.01229249, 0, 0, 0, 1, 1,
-0.97588, -0.2218057, -3.91512, 1, 1, 1, 1, 1,
-0.9741138, -0.4119714, -1.93405, 1, 1, 1, 1, 1,
-0.9732178, -0.2682489, -0.145512, 1, 1, 1, 1, 1,
-0.9701859, 0.8297155, -0.1203352, 1, 1, 1, 1, 1,
-0.966081, 0.4229667, -2.53099, 1, 1, 1, 1, 1,
-0.9648947, 0.3729847, -2.810819, 1, 1, 1, 1, 1,
-0.9629568, 2.176135, -0.1804015, 1, 1, 1, 1, 1,
-0.9614365, -1.576174, -3.646875, 1, 1, 1, 1, 1,
-0.9579175, 0.3779784, -2.413391, 1, 1, 1, 1, 1,
-0.9575325, -0.04455424, -1.788604, 1, 1, 1, 1, 1,
-0.953575, 0.5174133, 0.04505295, 1, 1, 1, 1, 1,
-0.9523868, -1.949191, -2.594299, 1, 1, 1, 1, 1,
-0.9505104, 0.08336733, -2.86157, 1, 1, 1, 1, 1,
-0.9485969, -1.564498, -1.075487, 1, 1, 1, 1, 1,
-0.9436087, 0.7642148, -1.316952, 1, 1, 1, 1, 1,
-0.9419031, 0.05618602, -2.954287, 0, 0, 1, 1, 1,
-0.9382205, 0.3920844, -0.5838913, 1, 0, 0, 1, 1,
-0.9367008, 0.8113483, 1.002484, 1, 0, 0, 1, 1,
-0.9306974, 0.5306737, -1.608406, 1, 0, 0, 1, 1,
-0.9305265, 0.2783327, -0.779466, 1, 0, 0, 1, 1,
-0.9302973, 0.009913259, -1.872887, 1, 0, 0, 1, 1,
-0.9257423, -1.339522, -2.553646, 0, 0, 0, 1, 1,
-0.9256395, -1.196799, -1.99162, 0, 0, 0, 1, 1,
-0.9228135, -1.179265, -3.36685, 0, 0, 0, 1, 1,
-0.9193562, 0.9595834, -1.164799, 0, 0, 0, 1, 1,
-0.9172437, -0.3209736, -2.933049, 0, 0, 0, 1, 1,
-0.9161995, 0.6752395, -1.980219, 0, 0, 0, 1, 1,
-0.9126961, 0.6996318, -0.2183399, 0, 0, 0, 1, 1,
-0.9036186, -1.991562, -2.105739, 1, 1, 1, 1, 1,
-0.9018362, 1.068732, -2.310102, 1, 1, 1, 1, 1,
-0.8996139, 0.24571, -2.075909, 1, 1, 1, 1, 1,
-0.89617, 1.333389, -1.580643, 1, 1, 1, 1, 1,
-0.8940691, 0.2322366, -1.14046, 1, 1, 1, 1, 1,
-0.8917201, -1.089257, -2.75246, 1, 1, 1, 1, 1,
-0.8899848, 0.97629, -0.5549535, 1, 1, 1, 1, 1,
-0.8893176, 0.1806325, -1.925302, 1, 1, 1, 1, 1,
-0.8808838, 1.006485, -0.5952433, 1, 1, 1, 1, 1,
-0.8710902, 0.2394268, -1.877501, 1, 1, 1, 1, 1,
-0.8674844, 2.392776, -1.200158, 1, 1, 1, 1, 1,
-0.8665053, 0.7142822, -1.152492, 1, 1, 1, 1, 1,
-0.8651716, 0.4910381, -0.107077, 1, 1, 1, 1, 1,
-0.8589404, -0.1198743, -1.133707, 1, 1, 1, 1, 1,
-0.8573268, 0.08659022, -2.684634, 1, 1, 1, 1, 1,
-0.8544161, -1.111439, -3.616812, 0, 0, 1, 1, 1,
-0.8522818, 0.3534507, -2.267488, 1, 0, 0, 1, 1,
-0.8522097, 1.567116, 0.7680366, 1, 0, 0, 1, 1,
-0.8492625, -0.1836457, -0.9667751, 1, 0, 0, 1, 1,
-0.8392323, 0.3316807, -0.5171821, 1, 0, 0, 1, 1,
-0.8384886, -0.01491042, -3.531861, 1, 0, 0, 1, 1,
-0.8380186, -0.5922607, -1.409225, 0, 0, 0, 1, 1,
-0.8315312, -0.1746463, -1.860007, 0, 0, 0, 1, 1,
-0.8275898, 0.3202521, 0.6312491, 0, 0, 0, 1, 1,
-0.8230557, 0.07983343, 0.2521583, 0, 0, 0, 1, 1,
-0.8204286, -0.5678484, -2.605731, 0, 0, 0, 1, 1,
-0.8199406, 1.5759, -0.1951282, 0, 0, 0, 1, 1,
-0.8184222, 0.4164319, -0.8105223, 0, 0, 0, 1, 1,
-0.8177713, 1.987329, 0.1926177, 1, 1, 1, 1, 1,
-0.8169665, 0.5537229, -1.398268, 1, 1, 1, 1, 1,
-0.8156006, -1.167097, -2.694307, 1, 1, 1, 1, 1,
-0.8123473, -0.8495663, -3.973977, 1, 1, 1, 1, 1,
-0.8102459, 0.4074694, -0.3175213, 1, 1, 1, 1, 1,
-0.808611, -1.69121, -1.048478, 1, 1, 1, 1, 1,
-0.8076221, 0.04365145, -0.791174, 1, 1, 1, 1, 1,
-0.8064874, 0.697975, -1.073119, 1, 1, 1, 1, 1,
-0.7953403, -2.003598, -2.638311, 1, 1, 1, 1, 1,
-0.7891374, -0.8877242, -1.59883, 1, 1, 1, 1, 1,
-0.7863739, -2.742771, -2.618814, 1, 1, 1, 1, 1,
-0.786033, -0.5134361, -2.55558, 1, 1, 1, 1, 1,
-0.7825972, -0.1035982, -2.081452, 1, 1, 1, 1, 1,
-0.7816057, 0.6828151, -2.904748, 1, 1, 1, 1, 1,
-0.7803518, 1.528296, -1.04466, 1, 1, 1, 1, 1,
-0.7763869, -0.4918024, -0.7013913, 0, 0, 1, 1, 1,
-0.7723814, -0.8549957, -2.765513, 1, 0, 0, 1, 1,
-0.7695608, 0.00818077, -2.869987, 1, 0, 0, 1, 1,
-0.7622979, 0.8346073, -0.7142227, 1, 0, 0, 1, 1,
-0.7590432, -1.703806, -2.587934, 1, 0, 0, 1, 1,
-0.7424915, -0.8007741, -0.3371398, 1, 0, 0, 1, 1,
-0.7338632, -1.621474, -2.244709, 0, 0, 0, 1, 1,
-0.7320244, -0.8491271, -3.330713, 0, 0, 0, 1, 1,
-0.7295627, 0.9847707, -0.8720862, 0, 0, 0, 1, 1,
-0.728669, -0.4609112, -1.921863, 0, 0, 0, 1, 1,
-0.7262802, 2.231813, -1.182649, 0, 0, 0, 1, 1,
-0.7174291, 1.593423, -0.6322758, 0, 0, 0, 1, 1,
-0.7118166, -0.7130988, -2.735962, 0, 0, 0, 1, 1,
-0.7042717, -1.490683, -3.116802, 1, 1, 1, 1, 1,
-0.7028649, 1.16843, -1.594924, 1, 1, 1, 1, 1,
-0.6855502, -1.352528, -2.229762, 1, 1, 1, 1, 1,
-0.6848541, 1.102015, -0.3110878, 1, 1, 1, 1, 1,
-0.6840217, 0.7186865, 0.02339561, 1, 1, 1, 1, 1,
-0.683157, -1.250969, -4.188332, 1, 1, 1, 1, 1,
-0.6806038, 0.4327033, -1.463345, 1, 1, 1, 1, 1,
-0.6745672, -0.1657696, -0.06359587, 1, 1, 1, 1, 1,
-0.6712227, 1.415394, -0.8655465, 1, 1, 1, 1, 1,
-0.6703326, -0.8224655, -2.124647, 1, 1, 1, 1, 1,
-0.6681352, -0.517497, -1.612719, 1, 1, 1, 1, 1,
-0.6678696, -1.455382, -2.542124, 1, 1, 1, 1, 1,
-0.6551218, 0.3320753, -0.2725576, 1, 1, 1, 1, 1,
-0.6540187, 0.2185814, -2.149894, 1, 1, 1, 1, 1,
-0.6474714, 0.5215837, -0.1330123, 1, 1, 1, 1, 1,
-0.643564, 1.757158, -0.2444804, 0, 0, 1, 1, 1,
-0.6350814, 1.197311, -2.068826, 1, 0, 0, 1, 1,
-0.6342051, 0.6389213, -0.572086, 1, 0, 0, 1, 1,
-0.6318572, 2.537804, -0.08682995, 1, 0, 0, 1, 1,
-0.6308733, -0.08585635, -0.2045394, 1, 0, 0, 1, 1,
-0.6280512, -1.12068, -1.22596, 1, 0, 0, 1, 1,
-0.6269647, -0.5356522, -3.044285, 0, 0, 0, 1, 1,
-0.6244782, -0.1354644, -3.395013, 0, 0, 0, 1, 1,
-0.6220844, 0.3601431, -1.165107, 0, 0, 0, 1, 1,
-0.6216482, 0.717553, -0.20575, 0, 0, 0, 1, 1,
-0.6208383, -0.1692257, -1.379276, 0, 0, 0, 1, 1,
-0.6176274, 1.789114, -1.157483, 0, 0, 0, 1, 1,
-0.6114246, -1.312699, -3.019051, 0, 0, 0, 1, 1,
-0.6090729, 0.8494485, -1.807017, 1, 1, 1, 1, 1,
-0.6018956, 1.030354, -0.7857621, 1, 1, 1, 1, 1,
-0.5990664, -0.7991071, -2.356, 1, 1, 1, 1, 1,
-0.593409, 1.304625, -0.06242149, 1, 1, 1, 1, 1,
-0.5922565, -0.3834054, -1.439295, 1, 1, 1, 1, 1,
-0.5915564, -0.07737506, -3.530547, 1, 1, 1, 1, 1,
-0.585595, -0.2578258, -2.113838, 1, 1, 1, 1, 1,
-0.5799257, 1.092415, 0.7432884, 1, 1, 1, 1, 1,
-0.5713483, 0.3291733, -0.8803011, 1, 1, 1, 1, 1,
-0.5698556, 0.08129144, -3.627952, 1, 1, 1, 1, 1,
-0.5684153, 0.6846843, -3.208889, 1, 1, 1, 1, 1,
-0.5665658, -0.9298832, -1.360086, 1, 1, 1, 1, 1,
-0.5659212, 0.02060418, -3.412777, 1, 1, 1, 1, 1,
-0.5653885, -0.4549716, -2.0141, 1, 1, 1, 1, 1,
-0.5608702, 0.5514228, 0.1651716, 1, 1, 1, 1, 1,
-0.5596218, -1.699187, -2.593309, 0, 0, 1, 1, 1,
-0.5587967, -1.052901, -3.765264, 1, 0, 0, 1, 1,
-0.5574672, -0.3915767, -1.833151, 1, 0, 0, 1, 1,
-0.5559512, -1.285763, -3.379941, 1, 0, 0, 1, 1,
-0.5543883, 1.506059, -1.218418, 1, 0, 0, 1, 1,
-0.5450811, 0.07601094, -1.778657, 1, 0, 0, 1, 1,
-0.5437952, 0.7676548, 0.002024698, 0, 0, 0, 1, 1,
-0.5415336, 0.1724281, -0.03310111, 0, 0, 0, 1, 1,
-0.5411381, 1.178867, -1.210037, 0, 0, 0, 1, 1,
-0.5220522, 0.2622273, -1.325176, 0, 0, 0, 1, 1,
-0.5217488, -0.8263888, -2.525375, 0, 0, 0, 1, 1,
-0.5199603, -0.09750491, -1.26429, 0, 0, 0, 1, 1,
-0.5176161, -0.06784956, -1.416149, 0, 0, 0, 1, 1,
-0.5155518, 0.9841278, -1.346064, 1, 1, 1, 1, 1,
-0.5152581, 0.6671553, -1.2259, 1, 1, 1, 1, 1,
-0.5063741, -0.4389344, -2.216861, 1, 1, 1, 1, 1,
-0.5061668, 0.7191173, 0.04712351, 1, 1, 1, 1, 1,
-0.4990001, -1.281096, -2.07057, 1, 1, 1, 1, 1,
-0.4989693, -0.6492648, -4.07017, 1, 1, 1, 1, 1,
-0.4970348, 0.552123, -1.258636, 1, 1, 1, 1, 1,
-0.4796876, -0.1947811, -1.291831, 1, 1, 1, 1, 1,
-0.4761817, 1.661041, 0.5794418, 1, 1, 1, 1, 1,
-0.4759912, 0.2017454, -2.134394, 1, 1, 1, 1, 1,
-0.4723673, 0.6237857, 0.5031347, 1, 1, 1, 1, 1,
-0.4692529, 0.6114843, -0.1040429, 1, 1, 1, 1, 1,
-0.4660137, -0.3043829, -1.720785, 1, 1, 1, 1, 1,
-0.4649453, 0.06908044, -1.878506, 1, 1, 1, 1, 1,
-0.4630405, -0.981718, -0.3093748, 1, 1, 1, 1, 1,
-0.4609933, 1.435623, 0.02159448, 0, 0, 1, 1, 1,
-0.4608195, -0.2643515, -1.625553, 1, 0, 0, 1, 1,
-0.4605654, 0.3366019, -0.9887357, 1, 0, 0, 1, 1,
-0.4596398, -2.006818, -5.277576, 1, 0, 0, 1, 1,
-0.4596338, -0.9218774, -1.232554, 1, 0, 0, 1, 1,
-0.4570309, 0.816917, -1.490226, 1, 0, 0, 1, 1,
-0.4550758, -1.328626, -1.984223, 0, 0, 0, 1, 1,
-0.4513654, 1.544279, -1.523972, 0, 0, 0, 1, 1,
-0.4498036, 1.292813, -0.8660872, 0, 0, 0, 1, 1,
-0.4494841, -1.87789, -3.417225, 0, 0, 0, 1, 1,
-0.4488944, -0.6223399, -3.591378, 0, 0, 0, 1, 1,
-0.4407915, 0.1034486, -0.8305004, 0, 0, 0, 1, 1,
-0.4385885, -1.08132, -2.948973, 0, 0, 0, 1, 1,
-0.434511, -0.936803, -2.515211, 1, 1, 1, 1, 1,
-0.4333124, 0.4043376, -1.75774, 1, 1, 1, 1, 1,
-0.4320565, -1.008274, -3.707418, 1, 1, 1, 1, 1,
-0.4281844, -0.05978196, -3.224393, 1, 1, 1, 1, 1,
-0.4271005, -0.6697032, -2.540041, 1, 1, 1, 1, 1,
-0.4194351, 0.4118525, -0.1894466, 1, 1, 1, 1, 1,
-0.4182984, -1.23183, -1.968524, 1, 1, 1, 1, 1,
-0.407695, -0.1198097, -0.04140614, 1, 1, 1, 1, 1,
-0.4070172, -0.5359241, -2.669683, 1, 1, 1, 1, 1,
-0.4063098, 2.413333, 1.277161, 1, 1, 1, 1, 1,
-0.4059488, -0.04219358, -0.538448, 1, 1, 1, 1, 1,
-0.4032417, 0.006877025, -1.582286, 1, 1, 1, 1, 1,
-0.3999343, -1.157615, -2.385255, 1, 1, 1, 1, 1,
-0.3847957, 2.405279, -0.03270035, 1, 1, 1, 1, 1,
-0.3817022, 0.2225704, -0.8900734, 1, 1, 1, 1, 1,
-0.3743792, 0.8518254, -0.7702586, 0, 0, 1, 1, 1,
-0.3735169, 0.3986946, 0.1723051, 1, 0, 0, 1, 1,
-0.3702791, 0.3160262, -0.4971492, 1, 0, 0, 1, 1,
-0.3689628, -0.8392023, -1.912289, 1, 0, 0, 1, 1,
-0.3681546, 0.9170591, -0.9588554, 1, 0, 0, 1, 1,
-0.3664255, -0.02938207, -1.103041, 1, 0, 0, 1, 1,
-0.3643014, -0.1695492, -0.8823072, 0, 0, 0, 1, 1,
-0.3638722, 0.6399553, -0.1314607, 0, 0, 0, 1, 1,
-0.3637469, 1.183607, -1.421625, 0, 0, 0, 1, 1,
-0.3599448, 0.01725896, -2.864674, 0, 0, 0, 1, 1,
-0.3568231, -0.1274466, -1.687655, 0, 0, 0, 1, 1,
-0.3557978, 1.415445, 0.1562228, 0, 0, 0, 1, 1,
-0.3545929, 0.0997845, -0.06885802, 0, 0, 0, 1, 1,
-0.3526596, 0.5132861, -1.57905, 1, 1, 1, 1, 1,
-0.352343, -0.9534194, -3.662698, 1, 1, 1, 1, 1,
-0.3511686, 0.3586915, 0.4880913, 1, 1, 1, 1, 1,
-0.350777, -0.08478101, -1.625404, 1, 1, 1, 1, 1,
-0.3493496, -0.4981039, -4.647048, 1, 1, 1, 1, 1,
-0.3420676, 0.3164163, -0.5763876, 1, 1, 1, 1, 1,
-0.339921, -0.1422036, -2.287421, 1, 1, 1, 1, 1,
-0.338583, -1.150972, -4.276271, 1, 1, 1, 1, 1,
-0.3321555, 1.221969, -0.158326, 1, 1, 1, 1, 1,
-0.3302519, -0.7523195, -2.386564, 1, 1, 1, 1, 1,
-0.3286101, -2.474684, -2.164577, 1, 1, 1, 1, 1,
-0.3282212, 1.388022, -0.533991, 1, 1, 1, 1, 1,
-0.3233649, -1.023454, -4.601344, 1, 1, 1, 1, 1,
-0.3209195, 0.2772399, -1.086058, 1, 1, 1, 1, 1,
-0.3130411, -0.02040293, -1.795451, 1, 1, 1, 1, 1,
-0.311806, 0.4290733, 0.6238567, 0, 0, 1, 1, 1,
-0.3049658, 1.328557, 0.6543505, 1, 0, 0, 1, 1,
-0.3035208, 0.8022035, -1.367014, 1, 0, 0, 1, 1,
-0.2941523, 0.9304724, -0.4233095, 1, 0, 0, 1, 1,
-0.2920973, 0.2984922, -0.8325655, 1, 0, 0, 1, 1,
-0.291708, 0.7411877, 1.723376, 1, 0, 0, 1, 1,
-0.2894846, 1.403158, 0.4456418, 0, 0, 0, 1, 1,
-0.2872363, -0.3917466, -1.779651, 0, 0, 0, 1, 1,
-0.2847818, -0.5422642, -2.513126, 0, 0, 0, 1, 1,
-0.2845564, 0.4261766, 1.226532, 0, 0, 0, 1, 1,
-0.283963, 0.128934, -2.08623, 0, 0, 0, 1, 1,
-0.2820148, 0.5169033, -1.479171, 0, 0, 0, 1, 1,
-0.2796778, 2.067189, 1.107502, 0, 0, 0, 1, 1,
-0.2782943, 0.3938618, 0.6708544, 1, 1, 1, 1, 1,
-0.2693401, 0.5558848, 0.3654327, 1, 1, 1, 1, 1,
-0.2689384, -0.1563855, -1.053557, 1, 1, 1, 1, 1,
-0.2664746, 1.083435, 0.8584492, 1, 1, 1, 1, 1,
-0.2641605, 0.1619011, 0.5814996, 1, 1, 1, 1, 1,
-0.2563273, 0.2403153, -0.7356477, 1, 1, 1, 1, 1,
-0.2535437, 0.7884517, -0.840948, 1, 1, 1, 1, 1,
-0.2529864, 1.171216, -1.22003, 1, 1, 1, 1, 1,
-0.2522802, -0.3980266, -3.752995, 1, 1, 1, 1, 1,
-0.2488212, -1.811469, -3.248266, 1, 1, 1, 1, 1,
-0.247318, -0.7730001, -2.60443, 1, 1, 1, 1, 1,
-0.247245, -2.039037, -1.810853, 1, 1, 1, 1, 1,
-0.2445484, -1.503103, -4.120456, 1, 1, 1, 1, 1,
-0.2400163, -0.589947, -4.105101, 1, 1, 1, 1, 1,
-0.2379919, -0.4116913, -4.837605, 1, 1, 1, 1, 1,
-0.23414, -0.895512, -2.45964, 0, 0, 1, 1, 1,
-0.2273599, 0.5106232, -0.7024322, 1, 0, 0, 1, 1,
-0.2262839, -0.9212289, -3.588102, 1, 0, 0, 1, 1,
-0.2169335, 0.2455373, 1.424186, 1, 0, 0, 1, 1,
-0.2154838, -0.598102, -2.191258, 1, 0, 0, 1, 1,
-0.2145004, -0.3735881, -2.788125, 1, 0, 0, 1, 1,
-0.2117897, -0.62675, -3.985639, 0, 0, 0, 1, 1,
-0.2109718, -1.316242, -5.309001, 0, 0, 0, 1, 1,
-0.2098433, -0.4833791, -2.09278, 0, 0, 0, 1, 1,
-0.2092338, 1.366197, -0.3673477, 0, 0, 0, 1, 1,
-0.2092333, -0.005300933, -0.7037529, 0, 0, 0, 1, 1,
-0.2085019, -0.4601124, -3.524361, 0, 0, 0, 1, 1,
-0.2084908, -0.6282887, -2.182952, 0, 0, 0, 1, 1,
-0.2043169, 0.3184804, -0.7458065, 1, 1, 1, 1, 1,
-0.2032437, 0.6077054, -0.8708317, 1, 1, 1, 1, 1,
-0.1966017, -0.8375645, -4.062046, 1, 1, 1, 1, 1,
-0.1941481, -1.127987, -1.589441, 1, 1, 1, 1, 1,
-0.1882763, 0.9827753, -0.8400438, 1, 1, 1, 1, 1,
-0.1876443, 0.4245227, -0.1357291, 1, 1, 1, 1, 1,
-0.1862539, 0.2127298, -1.460164, 1, 1, 1, 1, 1,
-0.1848236, -1.832936, -4.765075, 1, 1, 1, 1, 1,
-0.184469, 0.3124669, -0.3541291, 1, 1, 1, 1, 1,
-0.1841279, -0.4331283, -2.582438, 1, 1, 1, 1, 1,
-0.1828823, 0.6084087, -0.1680785, 1, 1, 1, 1, 1,
-0.1822797, 0.9658055, 1.36069, 1, 1, 1, 1, 1,
-0.1814344, 0.8967552, -0.2286, 1, 1, 1, 1, 1,
-0.1809188, 0.9317185, 0.6415211, 1, 1, 1, 1, 1,
-0.1735883, -0.01456815, -0.6360217, 1, 1, 1, 1, 1,
-0.1654003, 1.432606, -1.02262, 0, 0, 1, 1, 1,
-0.1627697, 0.3399236, -3.416965, 1, 0, 0, 1, 1,
-0.1593232, -0.9503369, -2.38556, 1, 0, 0, 1, 1,
-0.1583471, -0.6500697, -1.806937, 1, 0, 0, 1, 1,
-0.1575468, 1.017807, 2.196243, 1, 0, 0, 1, 1,
-0.154281, -0.5822766, -2.355208, 1, 0, 0, 1, 1,
-0.1510919, 0.1057593, -0.8875992, 0, 0, 0, 1, 1,
-0.1500041, -0.5520437, -2.343021, 0, 0, 0, 1, 1,
-0.1403296, -0.6332027, -1.990256, 0, 0, 0, 1, 1,
-0.1401854, -0.2137858, -3.797422, 0, 0, 0, 1, 1,
-0.1305955, 1.529446, -0.197171, 0, 0, 0, 1, 1,
-0.124404, 1.427969, -0.3668062, 0, 0, 0, 1, 1,
-0.1231496, 0.7654349, 0.8991188, 0, 0, 0, 1, 1,
-0.1217372, -1.451942, -4.398562, 1, 1, 1, 1, 1,
-0.1200845, 0.6515416, 0.516561, 1, 1, 1, 1, 1,
-0.1157755, -1.061752, -3.704297, 1, 1, 1, 1, 1,
-0.1139665, -0.07407208, -2.044107, 1, 1, 1, 1, 1,
-0.1104289, -0.1025641, -1.983572, 1, 1, 1, 1, 1,
-0.1097893, -0.2311348, -1.833694, 1, 1, 1, 1, 1,
-0.1065473, -0.4523682, -4.807807, 1, 1, 1, 1, 1,
-0.09113702, 0.1790076, -2.116125, 1, 1, 1, 1, 1,
-0.09019475, 0.9000851, -0.4887625, 1, 1, 1, 1, 1,
-0.08839167, -0.8381494, -4.026183, 1, 1, 1, 1, 1,
-0.08568792, 0.1703298, -1.176002, 1, 1, 1, 1, 1,
-0.08535586, -0.01085829, -3.206019, 1, 1, 1, 1, 1,
-0.08510763, 0.2501087, -0.7528144, 1, 1, 1, 1, 1,
-0.07576232, 0.9000843, -0.6095079, 1, 1, 1, 1, 1,
-0.07254834, -1.070957, -4.022671, 1, 1, 1, 1, 1,
-0.06896433, 0.3118666, 0.5622312, 0, 0, 1, 1, 1,
-0.0686217, -0.1639339, -3.366591, 1, 0, 0, 1, 1,
-0.06557046, 1.757217, -0.4894601, 1, 0, 0, 1, 1,
-0.06232996, 1.693177, 0.7844974, 1, 0, 0, 1, 1,
-0.05469661, 0.5980846, -0.2314758, 1, 0, 0, 1, 1,
-0.05339138, 0.4735774, -0.5364124, 1, 0, 0, 1, 1,
-0.05336869, 0.7807354, -1.092131, 0, 0, 0, 1, 1,
-0.04066585, 0.7092643, 0.814198, 0, 0, 0, 1, 1,
-0.04030208, 0.5515131, 0.6002943, 0, 0, 0, 1, 1,
-0.03910628, -1.861077, -1.475283, 0, 0, 0, 1, 1,
-0.03861866, -0.869575, -3.026321, 0, 0, 0, 1, 1,
-0.03711939, -1.608351, -4.316057, 0, 0, 0, 1, 1,
-0.03640028, 0.04717182, 0.5971775, 0, 0, 0, 1, 1,
-0.03356572, 0.2059264, 0.1239646, 1, 1, 1, 1, 1,
-0.03301482, 0.2445267, -0.8881916, 1, 1, 1, 1, 1,
-0.032824, -1.733418, -2.970662, 1, 1, 1, 1, 1,
-0.03108039, 0.4345167, -0.5272564, 1, 1, 1, 1, 1,
-0.02858323, 1.621657, 0.06010989, 1, 1, 1, 1, 1,
-0.0279596, 2.513482, 0.9223862, 1, 1, 1, 1, 1,
-0.01850809, 0.8033878, -0.1749891, 1, 1, 1, 1, 1,
-0.01660303, 0.2148004, 1.039517, 1, 1, 1, 1, 1,
-0.01446265, -0.4340116, -4.097571, 1, 1, 1, 1, 1,
-0.0130967, -1.680478, -2.192206, 1, 1, 1, 1, 1,
-0.009883801, 0.5540897, 1.259536, 1, 1, 1, 1, 1,
-0.00128932, -0.4278602, -4.657466, 1, 1, 1, 1, 1,
0.001275498, -0.7881078, 3.164066, 1, 1, 1, 1, 1,
0.002220595, 0.2023586, 0.4432772, 1, 1, 1, 1, 1,
0.004240212, 0.03113647, -1.368137, 1, 1, 1, 1, 1,
0.007387703, -0.1623455, 2.143461, 0, 0, 1, 1, 1,
0.009685122, -1.788961, 2.143099, 1, 0, 0, 1, 1,
0.01135564, 0.8451308, 0.7177715, 1, 0, 0, 1, 1,
0.01216636, -0.3474016, 2.823483, 1, 0, 0, 1, 1,
0.01547741, -1.381533, 2.471052, 1, 0, 0, 1, 1,
0.01647545, 0.4750531, 1.381693, 1, 0, 0, 1, 1,
0.01696445, -0.6111971, 5.147322, 0, 0, 0, 1, 1,
0.02032397, -0.5413794, 1.666265, 0, 0, 0, 1, 1,
0.02802708, -0.7318194, 0.6639342, 0, 0, 0, 1, 1,
0.03295914, 1.437278, -0.6112587, 0, 0, 0, 1, 1,
0.03551573, 0.1495714, 0.6955587, 0, 0, 0, 1, 1,
0.03577384, 0.9729682, -0.736491, 0, 0, 0, 1, 1,
0.04909012, -0.6050639, 1.650768, 0, 0, 0, 1, 1,
0.05222315, 0.8847983, 0.5048689, 1, 1, 1, 1, 1,
0.0534179, 0.8514205, -0.5726293, 1, 1, 1, 1, 1,
0.05359483, 0.001145898, 2.284757, 1, 1, 1, 1, 1,
0.0540502, -1.87007, 5.23278, 1, 1, 1, 1, 1,
0.05757987, -1.035718, 3.71443, 1, 1, 1, 1, 1,
0.05960671, 0.3631205, 1.293925, 1, 1, 1, 1, 1,
0.06306981, -0.1615321, 1.685293, 1, 1, 1, 1, 1,
0.06510168, -1.701339, 2.487491, 1, 1, 1, 1, 1,
0.06575904, -1.374223, 3.288192, 1, 1, 1, 1, 1,
0.06592377, 1.094047, 0.8289696, 1, 1, 1, 1, 1,
0.06648684, -1.143786, 3.674197, 1, 1, 1, 1, 1,
0.06809932, 0.2466054, -0.5821792, 1, 1, 1, 1, 1,
0.06966362, 1.881186, 1.855496, 1, 1, 1, 1, 1,
0.08533991, 0.02687167, 0.8176606, 1, 1, 1, 1, 1,
0.086159, -0.7857823, 2.124844, 1, 1, 1, 1, 1,
0.09099562, -0.3931772, 2.55783, 0, 0, 1, 1, 1,
0.09492065, -0.6167314, 4.24442, 1, 0, 0, 1, 1,
0.09828192, -0.8541772, 4.170449, 1, 0, 0, 1, 1,
0.1043276, 0.5964618, 0.2483563, 1, 0, 0, 1, 1,
0.1053691, 0.4142199, -1.001271, 1, 0, 0, 1, 1,
0.1055954, -1.788362, 2.893191, 1, 0, 0, 1, 1,
0.1068135, -0.2206228, 2.954943, 0, 0, 0, 1, 1,
0.1141573, -0.4815877, 1.440547, 0, 0, 0, 1, 1,
0.1144371, 1.18497, -0.1666109, 0, 0, 0, 1, 1,
0.1159936, -0.230594, 1.883436, 0, 0, 0, 1, 1,
0.1211632, -0.5331426, 4.212327, 0, 0, 0, 1, 1,
0.1235088, -1.702513, 4.429659, 0, 0, 0, 1, 1,
0.1289591, -0.2652931, 5.113019, 0, 0, 0, 1, 1,
0.1373737, -0.693396, 2.056255, 1, 1, 1, 1, 1,
0.1380288, 0.6596913, 0.01266209, 1, 1, 1, 1, 1,
0.1383741, -0.03938774, 2.210962, 1, 1, 1, 1, 1,
0.1400247, 1.877631, 1.421828, 1, 1, 1, 1, 1,
0.1412702, -1.62618, 4.028748, 1, 1, 1, 1, 1,
0.1425825, 0.02756636, 2.202443, 1, 1, 1, 1, 1,
0.1436039, 0.625053, 0.731609, 1, 1, 1, 1, 1,
0.1492673, -0.7634451, 2.021517, 1, 1, 1, 1, 1,
0.1523515, 0.4456762, -0.2250666, 1, 1, 1, 1, 1,
0.1608194, 0.9002613, 0.6564892, 1, 1, 1, 1, 1,
0.1628133, -0.2786692, 0.571768, 1, 1, 1, 1, 1,
0.1635152, -0.9097388, 2.438613, 1, 1, 1, 1, 1,
0.1646412, -0.6501883, 2.981584, 1, 1, 1, 1, 1,
0.1654308, -0.3596147, 1.906183, 1, 1, 1, 1, 1,
0.1673705, 0.3164846, 1.844961, 1, 1, 1, 1, 1,
0.1681685, 0.3230604, 2.106131, 0, 0, 1, 1, 1,
0.1729302, -0.8418145, 2.44117, 1, 0, 0, 1, 1,
0.1752695, -1.010716, 2.826549, 1, 0, 0, 1, 1,
0.1801441, 0.7554291, 0.604636, 1, 0, 0, 1, 1,
0.1848583, 0.5171232, 0.7081686, 1, 0, 0, 1, 1,
0.1869123, -0.2975204, 2.035402, 1, 0, 0, 1, 1,
0.1990815, -1.257452, 3.630646, 0, 0, 0, 1, 1,
0.2009972, -1.64367, 1.42508, 0, 0, 0, 1, 1,
0.203156, -0.7479048, 1.495479, 0, 0, 0, 1, 1,
0.2045787, 1.959549, 1.096916, 0, 0, 0, 1, 1,
0.2054921, -0.7259105, 3.069172, 0, 0, 0, 1, 1,
0.2082401, -0.7148728, 3.27441, 0, 0, 0, 1, 1,
0.208606, -0.007814541, 2.039227, 0, 0, 0, 1, 1,
0.2092594, -1.375519, 4.955679, 1, 1, 1, 1, 1,
0.2098306, 0.8919247, -0.2347233, 1, 1, 1, 1, 1,
0.2104413, -2.041468, 2.01116, 1, 1, 1, 1, 1,
0.2116355, -0.1139788, 3.228673, 1, 1, 1, 1, 1,
0.2211323, -0.5438157, 2.777264, 1, 1, 1, 1, 1,
0.2215191, -0.0379515, 0.6433321, 1, 1, 1, 1, 1,
0.2218683, -1.438928, 2.938198, 1, 1, 1, 1, 1,
0.2233261, 0.5558342, 0.9225336, 1, 1, 1, 1, 1,
0.2235494, 1.267554, 0.2965853, 1, 1, 1, 1, 1,
0.2280917, 2.117889, -0.3395244, 1, 1, 1, 1, 1,
0.2291464, -1.392222, 2.179339, 1, 1, 1, 1, 1,
0.2305204, -0.2075242, 2.807562, 1, 1, 1, 1, 1,
0.2328247, 0.7381313, 2.267128, 1, 1, 1, 1, 1,
0.237697, -1.929876, 4.895803, 1, 1, 1, 1, 1,
0.2440888, 0.117736, 0.6872512, 1, 1, 1, 1, 1,
0.2457039, -0.1736056, -0.08991149, 0, 0, 1, 1, 1,
0.2469412, -0.01663394, 0.657782, 1, 0, 0, 1, 1,
0.2509162, 0.7205599, -0.5811478, 1, 0, 0, 1, 1,
0.2547003, -0.1507958, 2.293508, 1, 0, 0, 1, 1,
0.2547022, 0.8596573, 1.467124, 1, 0, 0, 1, 1,
0.2550829, -0.3117559, 2.274728, 1, 0, 0, 1, 1,
0.2593038, 0.7623931, -1.198663, 0, 0, 0, 1, 1,
0.2606876, -0.6702933, 2.949383, 0, 0, 0, 1, 1,
0.2607736, 0.3401901, 1.181001, 0, 0, 0, 1, 1,
0.2614606, 0.3949552, 1.066833, 0, 0, 0, 1, 1,
0.2648748, 0.4168297, 1.644492, 0, 0, 0, 1, 1,
0.2659121, 0.3100556, 1.846342, 0, 0, 0, 1, 1,
0.266752, 1.999919, 1.659131, 0, 0, 0, 1, 1,
0.2675218, 1.308906, 0.1841003, 1, 1, 1, 1, 1,
0.2758661, 1.864048, 1.14342, 1, 1, 1, 1, 1,
0.2779892, 0.4844759, 0.3932091, 1, 1, 1, 1, 1,
0.278464, 1.096935, 1.851779, 1, 1, 1, 1, 1,
0.2790304, 0.5980297, -0.001660606, 1, 1, 1, 1, 1,
0.2805646, -1.064596, 3.547534, 1, 1, 1, 1, 1,
0.2830619, -0.0681923, 0.7145213, 1, 1, 1, 1, 1,
0.2862555, -0.8401015, 3.829058, 1, 1, 1, 1, 1,
0.2862632, 2.877087, 0.2589476, 1, 1, 1, 1, 1,
0.2884783, 0.6450825, -0.98362, 1, 1, 1, 1, 1,
0.291128, 0.602121, -0.8759881, 1, 1, 1, 1, 1,
0.2919583, -0.9677155, 4.016659, 1, 1, 1, 1, 1,
0.293193, -0.6809332, 1.37813, 1, 1, 1, 1, 1,
0.2948138, 1.312408, 1.534461, 1, 1, 1, 1, 1,
0.3003238, -0.6090153, 1.490921, 1, 1, 1, 1, 1,
0.3016737, -1.080763, 2.79109, 0, 0, 1, 1, 1,
0.3080304, -0.4161682, 2.359712, 1, 0, 0, 1, 1,
0.310075, 0.3962303, 1.676438, 1, 0, 0, 1, 1,
0.3113351, 1.264749, 0.8689519, 1, 0, 0, 1, 1,
0.3182278, 1.831154, 1.822339, 1, 0, 0, 1, 1,
0.3226553, 1.738166, -2.223029, 1, 0, 0, 1, 1,
0.3229601, 0.495692, 1.305208, 0, 0, 0, 1, 1,
0.3243423, -0.4618915, 1.645908, 0, 0, 0, 1, 1,
0.325854, 1.406966, 2.265828, 0, 0, 0, 1, 1,
0.3261, 0.1113771, 2.137938, 0, 0, 0, 1, 1,
0.3278941, 1.642717, 0.8697035, 0, 0, 0, 1, 1,
0.3285698, 1.265338, 0.2168984, 0, 0, 0, 1, 1,
0.3295041, 1.215146, 2.162148, 0, 0, 0, 1, 1,
0.3328153, 0.07088763, 0.5307068, 1, 1, 1, 1, 1,
0.3378181, -0.3548662, 1.896782, 1, 1, 1, 1, 1,
0.3435259, 0.148861, 0.7350951, 1, 1, 1, 1, 1,
0.3439816, 1.289281, 0.4994498, 1, 1, 1, 1, 1,
0.3474705, -0.4174869, 1.548826, 1, 1, 1, 1, 1,
0.3495672, -0.3087921, 2.282425, 1, 1, 1, 1, 1,
0.3630793, -0.1795601, 1.002864, 1, 1, 1, 1, 1,
0.3669325, -3.31017, 3.649585, 1, 1, 1, 1, 1,
0.376038, 0.3864777, -0.05248861, 1, 1, 1, 1, 1,
0.3792292, 0.149292, 3.411454, 1, 1, 1, 1, 1,
0.3821538, 1.190691, 0.4316615, 1, 1, 1, 1, 1,
0.3851815, 0.07688306, 2.619503, 1, 1, 1, 1, 1,
0.3877691, 1.114426, 0.8431764, 1, 1, 1, 1, 1,
0.3880547, -0.2962082, 2.523749, 1, 1, 1, 1, 1,
0.3896313, -0.3894673, 3.333548, 1, 1, 1, 1, 1,
0.3899973, -0.02792887, 0.01805462, 0, 0, 1, 1, 1,
0.3910798, -1.313277, 2.466926, 1, 0, 0, 1, 1,
0.3936118, -0.633215, 2.337593, 1, 0, 0, 1, 1,
0.4002591, 0.8115475, 1.854379, 1, 0, 0, 1, 1,
0.4114996, 1.191592, 0.3343992, 1, 0, 0, 1, 1,
0.4162351, -1.672845, 2.989304, 1, 0, 0, 1, 1,
0.4176477, 1.646254, 1.29734, 0, 0, 0, 1, 1,
0.4186243, 1.848903, 0.376151, 0, 0, 0, 1, 1,
0.4195372, -0.5608822, 2.504327, 0, 0, 0, 1, 1,
0.4266496, -0.9336623, 4.005953, 0, 0, 0, 1, 1,
0.4275415, -1.273288, 4.405593, 0, 0, 0, 1, 1,
0.4291051, 0.4899876, 0.4864202, 0, 0, 0, 1, 1,
0.43156, 0.9941743, 1.562649, 0, 0, 0, 1, 1,
0.4315991, -0.5163078, 1.939902, 1, 1, 1, 1, 1,
0.4420833, 0.5288789, 1.13059, 1, 1, 1, 1, 1,
0.44394, 1.581526, 1.050818, 1, 1, 1, 1, 1,
0.4492265, 0.6476125, 0.3534411, 1, 1, 1, 1, 1,
0.4507541, 1.66911, 1.641859, 1, 1, 1, 1, 1,
0.4538022, -0.4220062, 1.896124, 1, 1, 1, 1, 1,
0.4558446, -0.6036738, 1.336319, 1, 1, 1, 1, 1,
0.4616261, -0.0660354, 3.000633, 1, 1, 1, 1, 1,
0.4649653, 0.4996133, 1.334865, 1, 1, 1, 1, 1,
0.4707824, 1.129974, -1.996846, 1, 1, 1, 1, 1,
0.4735286, -0.1308196, 3.148324, 1, 1, 1, 1, 1,
0.4739949, -0.9446363, 2.357406, 1, 1, 1, 1, 1,
0.4822073, -0.5213432, 1.007241, 1, 1, 1, 1, 1,
0.4846864, 0.9934791, 1.78974, 1, 1, 1, 1, 1,
0.4861914, 0.6776384, 0.3835221, 1, 1, 1, 1, 1,
0.4867062, 0.9819886, -0.09283674, 0, 0, 1, 1, 1,
0.4873398, -2.302823, 2.210453, 1, 0, 0, 1, 1,
0.4879774, 0.09704003, 2.476099, 1, 0, 0, 1, 1,
0.4917532, -0.103964, 1.108368, 1, 0, 0, 1, 1,
0.4943813, -1.880805, 3.748787, 1, 0, 0, 1, 1,
0.503772, 0.1711919, 0.6014771, 1, 0, 0, 1, 1,
0.5056426, 0.5091407, 0.5128615, 0, 0, 0, 1, 1,
0.5060225, -0.7398407, 2.109886, 0, 0, 0, 1, 1,
0.5189629, -0.01386746, 0.8213184, 0, 0, 0, 1, 1,
0.5200295, -0.8142798, 1.661018, 0, 0, 0, 1, 1,
0.5223621, 0.1533122, 1.726782, 0, 0, 0, 1, 1,
0.5267494, 0.7615083, 0.9920514, 0, 0, 0, 1, 1,
0.5334919, -0.719244, 1.936908, 0, 0, 0, 1, 1,
0.5379621, 0.00382216, 1.543564, 1, 1, 1, 1, 1,
0.5388946, -0.2792792, 2.415116, 1, 1, 1, 1, 1,
0.5398526, 0.4978099, 2.557667, 1, 1, 1, 1, 1,
0.5399802, -1.1405, 3.12477, 1, 1, 1, 1, 1,
0.5412828, -0.6331764, 1.746253, 1, 1, 1, 1, 1,
0.5465317, -0.31745, 1.628211, 1, 1, 1, 1, 1,
0.5483978, -1.14634, 2.150819, 1, 1, 1, 1, 1,
0.5528757, 0.7575266, 2.724766, 1, 1, 1, 1, 1,
0.5563808, -0.3785903, 1.988028, 1, 1, 1, 1, 1,
0.5570078, -1.159291, 2.71974, 1, 1, 1, 1, 1,
0.5613869, -0.01181752, 1.429458, 1, 1, 1, 1, 1,
0.5686883, 0.8089071, 1.975407, 1, 1, 1, 1, 1,
0.5715451, -1.351302, 3.059249, 1, 1, 1, 1, 1,
0.572506, 0.4109429, 2.737369, 1, 1, 1, 1, 1,
0.5751166, -0.1513059, 0.9976143, 1, 1, 1, 1, 1,
0.5765607, 0.2974464, 1.045797, 0, 0, 1, 1, 1,
0.581076, 0.88594, -0.4202231, 1, 0, 0, 1, 1,
0.5827519, -1.684389, 2.390221, 1, 0, 0, 1, 1,
0.5851661, -0.9156753, 4.467093, 1, 0, 0, 1, 1,
0.5888239, -0.3668254, 1.841127, 1, 0, 0, 1, 1,
0.5894464, -0.3294066, 2.441636, 1, 0, 0, 1, 1,
0.5927365, -0.9577694, 2.170859, 0, 0, 0, 1, 1,
0.5974555, 0.1043578, 1.426596, 0, 0, 0, 1, 1,
0.609082, 0.1685245, 0.4789926, 0, 0, 0, 1, 1,
0.6100668, -0.7165231, 2.294715, 0, 0, 0, 1, 1,
0.610217, 0.2692349, 2.293691, 0, 0, 0, 1, 1,
0.6159548, -0.6872958, 1.649762, 0, 0, 0, 1, 1,
0.6172197, -1.41532, 2.943407, 0, 0, 0, 1, 1,
0.6180266, 0.1602058, 0.4542448, 1, 1, 1, 1, 1,
0.6205801, -0.3122719, 1.548304, 1, 1, 1, 1, 1,
0.6290933, 1.265177, 0.6932366, 1, 1, 1, 1, 1,
0.6324007, 1.939293, -2.363752, 1, 1, 1, 1, 1,
0.6348586, -1.115534, 2.294084, 1, 1, 1, 1, 1,
0.6354979, 0.2414108, 1.775752, 1, 1, 1, 1, 1,
0.6389642, 0.5721905, 1.73859, 1, 1, 1, 1, 1,
0.6426331, -0.9001895, 4.955596, 1, 1, 1, 1, 1,
0.6438759, 0.5620248, 1.433595, 1, 1, 1, 1, 1,
0.6467645, 0.2368387, 2.674376, 1, 1, 1, 1, 1,
0.6483003, -1.013434, 3.187182, 1, 1, 1, 1, 1,
0.6512117, 0.3812231, 2.770589, 1, 1, 1, 1, 1,
0.6674125, -0.1064204, 1.691075, 1, 1, 1, 1, 1,
0.6734447, 0.7845294, 0.2937245, 1, 1, 1, 1, 1,
0.6741543, -0.1210844, 0.9273134, 1, 1, 1, 1, 1,
0.6754945, 0.5116639, 2.990344, 0, 0, 1, 1, 1,
0.675674, 1.302298, 1.465757, 1, 0, 0, 1, 1,
0.6780671, -0.1739522, 1.313221, 1, 0, 0, 1, 1,
0.6815315, -0.01444014, 1.976751, 1, 0, 0, 1, 1,
0.685497, -0.2570867, 1.27554, 1, 0, 0, 1, 1,
0.6862481, 0.2737255, -0.5683927, 1, 0, 0, 1, 1,
0.6863486, 1.787158, 0.1363028, 0, 0, 0, 1, 1,
0.6867508, -0.6769335, 2.506032, 0, 0, 0, 1, 1,
0.6873028, 1.556848, 2.752329, 0, 0, 0, 1, 1,
0.6910536, -0.4095623, 1.880764, 0, 0, 0, 1, 1,
0.6913437, 0.9273547, 0.3695727, 0, 0, 0, 1, 1,
0.6950553, -0.3411262, -1.109223, 0, 0, 0, 1, 1,
0.6985078, 0.3095316, 1.845614, 0, 0, 0, 1, 1,
0.6993693, 1.911734, -0.80612, 1, 1, 1, 1, 1,
0.7031885, -0.1498842, 2.453319, 1, 1, 1, 1, 1,
0.7033347, 0.7855477, 0.5245463, 1, 1, 1, 1, 1,
0.7105573, 0.4072106, 0.1132301, 1, 1, 1, 1, 1,
0.7106442, 0.4134696, 1.705538, 1, 1, 1, 1, 1,
0.7115876, 0.1896653, 0.7056036, 1, 1, 1, 1, 1,
0.7116966, 0.09364942, 2.224052, 1, 1, 1, 1, 1,
0.7134851, -1.267493, 2.787699, 1, 1, 1, 1, 1,
0.7135962, 0.2032886, -0.1987845, 1, 1, 1, 1, 1,
0.7139412, 0.3904418, 1.711868, 1, 1, 1, 1, 1,
0.7238945, -1.397721, 2.627457, 1, 1, 1, 1, 1,
0.7299047, 0.4388518, 1.239026, 1, 1, 1, 1, 1,
0.7300977, -1.333095, 3.563058, 1, 1, 1, 1, 1,
0.7315477, -0.8575353, 2.650801, 1, 1, 1, 1, 1,
0.738166, -0.7959509, 4.003336, 1, 1, 1, 1, 1,
0.7402945, -0.2587062, 2.008393, 0, 0, 1, 1, 1,
0.7439731, -0.07045756, 2.72234, 1, 0, 0, 1, 1,
0.7443003, -1.111204, 1.564458, 1, 0, 0, 1, 1,
0.7466993, -0.009097366, 1.840513, 1, 0, 0, 1, 1,
0.7484074, -0.8023976, 2.276087, 1, 0, 0, 1, 1,
0.7488264, 0.3812866, 0.2622083, 1, 0, 0, 1, 1,
0.7516446, -1.460585, 2.819578, 0, 0, 0, 1, 1,
0.7530274, -0.6756878, 3.395729, 0, 0, 0, 1, 1,
0.759409, -0.4943533, 3.615903, 0, 0, 0, 1, 1,
0.7647914, -1.187427, 4.563467, 0, 0, 0, 1, 1,
0.7651926, -1.571119, 2.969824, 0, 0, 0, 1, 1,
0.766302, -2.611671, 2.893216, 0, 0, 0, 1, 1,
0.766929, 0.4572803, 3.620032, 0, 0, 0, 1, 1,
0.7673652, 0.1083999, 3.367014, 1, 1, 1, 1, 1,
0.7697839, 1.830885, 1.410548, 1, 1, 1, 1, 1,
0.7754311, 0.01978781, 1.318129, 1, 1, 1, 1, 1,
0.7798558, -1.475875, 3.374981, 1, 1, 1, 1, 1,
0.785891, 0.1136141, 0.477786, 1, 1, 1, 1, 1,
0.7904385, -1.159228, 2.895163, 1, 1, 1, 1, 1,
0.801057, 0.5595362, 0.9079497, 1, 1, 1, 1, 1,
0.8037802, -0.1957729, 2.380578, 1, 1, 1, 1, 1,
0.805172, -1.844177, 1.537698, 1, 1, 1, 1, 1,
0.8082133, 1.092746, 0.5969025, 1, 1, 1, 1, 1,
0.809782, -0.7712431, 1.763516, 1, 1, 1, 1, 1,
0.8100967, 0.4261024, 1.20631, 1, 1, 1, 1, 1,
0.8102923, 0.2489617, 0.07541899, 1, 1, 1, 1, 1,
0.8121917, -0.2253494, 0.004074403, 1, 1, 1, 1, 1,
0.8142239, -0.6142814, 2.231748, 1, 1, 1, 1, 1,
0.8182968, 0.5805963, 0.670424, 0, 0, 1, 1, 1,
0.8240262, -0.09554882, 2.435283, 1, 0, 0, 1, 1,
0.8250887, 0.0254632, 3.486366, 1, 0, 0, 1, 1,
0.8339981, -0.8031604, 2.514363, 1, 0, 0, 1, 1,
0.839183, 1.325681, 0.8937491, 1, 0, 0, 1, 1,
0.8418983, 0.3048339, 0.4876997, 1, 0, 0, 1, 1,
0.8507338, -0.6541354, 1.421047, 0, 0, 0, 1, 1,
0.8516504, 0.7749174, -1.312286, 0, 0, 0, 1, 1,
0.8567518, -1.661628, 2.62205, 0, 0, 0, 1, 1,
0.8686087, -0.05915346, 0.9279587, 0, 0, 0, 1, 1,
0.8693989, 1.066992, 0.325078, 0, 0, 0, 1, 1,
0.8746989, 1.186514, 0.1820976, 0, 0, 0, 1, 1,
0.8749034, -0.4728959, 2.241246, 0, 0, 0, 1, 1,
0.8783574, -0.6123961, 3.532794, 1, 1, 1, 1, 1,
0.882324, -0.4010894, 0.728336, 1, 1, 1, 1, 1,
0.8849097, 1.384213, -0.9431167, 1, 1, 1, 1, 1,
0.8860757, -0.05215025, 2.755767, 1, 1, 1, 1, 1,
0.8860804, 0.2051497, 0.4927005, 1, 1, 1, 1, 1,
0.8916314, -0.1816791, 2.010765, 1, 1, 1, 1, 1,
0.8951099, 0.3902733, 1.185853, 1, 1, 1, 1, 1,
0.8974256, -0.9194183, 2.239091, 1, 1, 1, 1, 1,
0.8989265, 0.4203817, 2.263927, 1, 1, 1, 1, 1,
0.9002925, -0.5577337, 2.323276, 1, 1, 1, 1, 1,
0.9025983, 0.5669812, 1.378061, 1, 1, 1, 1, 1,
0.9038713, 1.078518, -0.6353461, 1, 1, 1, 1, 1,
0.9055197, 0.01952951, 4.114913, 1, 1, 1, 1, 1,
0.9069209, 0.582029, -0.05322449, 1, 1, 1, 1, 1,
0.9097038, 0.977909, 0.8583311, 1, 1, 1, 1, 1,
0.9103709, -0.4596849, 2.587465, 0, 0, 1, 1, 1,
0.9126636, 2.294466, -0.1154073, 1, 0, 0, 1, 1,
0.9150845, -1.862134, 2.059112, 1, 0, 0, 1, 1,
0.9216512, 1.902355, 0.5848227, 1, 0, 0, 1, 1,
0.9258042, -0.2033226, 0.7441607, 1, 0, 0, 1, 1,
0.9283234, -0.4670167, 3.836158, 1, 0, 0, 1, 1,
0.9302656, -0.5990989, 1.594404, 0, 0, 0, 1, 1,
0.9375381, 0.5960608, 2.556973, 0, 0, 0, 1, 1,
0.9400606, -1.221899, 2.652862, 0, 0, 0, 1, 1,
0.9451061, 1.079242, 0.7164545, 0, 0, 0, 1, 1,
0.9546174, -0.9842145, 2.728007, 0, 0, 0, 1, 1,
0.9549458, -0.4809416, 1.341792, 0, 0, 0, 1, 1,
0.9566421, 1.235322, 1.755281, 0, 0, 0, 1, 1,
0.960869, 0.7341385, 3.334041, 1, 1, 1, 1, 1,
0.9628518, -0.7531272, 2.831786, 1, 1, 1, 1, 1,
0.9702979, -0.280776, 3.431997, 1, 1, 1, 1, 1,
0.9735231, -0.2701921, 2.524211, 1, 1, 1, 1, 1,
0.9779655, -1.654945, 1.734862, 1, 1, 1, 1, 1,
0.9791107, -0.5404969, 1.514665, 1, 1, 1, 1, 1,
0.9822192, -0.01867486, 2.041525, 1, 1, 1, 1, 1,
0.987738, 0.7556608, 1.424337, 1, 1, 1, 1, 1,
0.9883353, -0.286869, 0.5156549, 1, 1, 1, 1, 1,
0.9972525, -1.131657, 1.551256, 1, 1, 1, 1, 1,
0.9987779, 0.01293254, 1.782151, 1, 1, 1, 1, 1,
0.9990749, 1.249345, 0.865152, 1, 1, 1, 1, 1,
1.004085, 1.04822, -0.603226, 1, 1, 1, 1, 1,
1.005041, -0.0248238, 2.102899, 1, 1, 1, 1, 1,
1.005549, 0.1316528, 1.493557, 1, 1, 1, 1, 1,
1.018326, -1.006811, 4.430239, 0, 0, 1, 1, 1,
1.022934, -0.2379454, 1.286496, 1, 0, 0, 1, 1,
1.037462, 0.1051063, 1.490505, 1, 0, 0, 1, 1,
1.042453, 0.4700556, 0.665922, 1, 0, 0, 1, 1,
1.059704, -0.2584279, 2.266906, 1, 0, 0, 1, 1,
1.066441, 1.376726, 0.2801322, 1, 0, 0, 1, 1,
1.071292, 0.4570828, 0.4979221, 0, 0, 0, 1, 1,
1.072427, -1.405644, 2.586574, 0, 0, 0, 1, 1,
1.081829, 0.7656103, -1.081272, 0, 0, 0, 1, 1,
1.083784, -1.504156, 3.343262, 0, 0, 0, 1, 1,
1.084125, 0.1554673, 1.319585, 0, 0, 0, 1, 1,
1.084999, 1.523703, 0.53858, 0, 0, 0, 1, 1,
1.086544, -0.3575181, 2.150561, 0, 0, 0, 1, 1,
1.088845, 0.3657106, 1.076675, 1, 1, 1, 1, 1,
1.091304, -1.348556, 3.517199, 1, 1, 1, 1, 1,
1.091636, -0.269058, 2.766768, 1, 1, 1, 1, 1,
1.109077, -0.5341644, 2.121911, 1, 1, 1, 1, 1,
1.110594, -1.260793, 1.55793, 1, 1, 1, 1, 1,
1.125642, -1.030293, 3.426278, 1, 1, 1, 1, 1,
1.131182, -0.4943614, 2.810243, 1, 1, 1, 1, 1,
1.133775, -0.7280362, 3.114768, 1, 1, 1, 1, 1,
1.137108, -1.571096, 1.068705, 1, 1, 1, 1, 1,
1.146194, 1.376369, 0.9028118, 1, 1, 1, 1, 1,
1.147868, -0.2796532, 1.597063, 1, 1, 1, 1, 1,
1.153743, 0.6172257, 2.551016, 1, 1, 1, 1, 1,
1.162726, -0.8078877, 1.694193, 1, 1, 1, 1, 1,
1.164463, -2.664862, 3.243429, 1, 1, 1, 1, 1,
1.172395, -0.007247384, 2.58197, 1, 1, 1, 1, 1,
1.178132, -2.752356, 3.686513, 0, 0, 1, 1, 1,
1.181583, 0.6975093, 0.9706762, 1, 0, 0, 1, 1,
1.186132, 0.1626188, -0.05530903, 1, 0, 0, 1, 1,
1.189079, 0.4374133, 2.349407, 1, 0, 0, 1, 1,
1.192443, -0.9350603, 3.50423, 1, 0, 0, 1, 1,
1.195937, 0.05693338, 1.702376, 1, 0, 0, 1, 1,
1.197818, -0.06310119, 1.382314, 0, 0, 0, 1, 1,
1.198512, -0.1023735, 0.6699641, 0, 0, 0, 1, 1,
1.199708, 0.2984526, 0.3925842, 0, 0, 0, 1, 1,
1.206609, -1.209106, 2.800972, 0, 0, 0, 1, 1,
1.214449, -0.0709471, 0.6803862, 0, 0, 0, 1, 1,
1.239075, 0.1101457, 3.588565, 0, 0, 0, 1, 1,
1.239284, -0.5459754, 2.756765, 0, 0, 0, 1, 1,
1.245527, 1.153001, 0.5838249, 1, 1, 1, 1, 1,
1.246398, 0.8024834, 1.012629, 1, 1, 1, 1, 1,
1.251478, -0.2726052, 3.804152, 1, 1, 1, 1, 1,
1.25619, -0.6867285, 1.114041, 1, 1, 1, 1, 1,
1.293666, -1.096462, 1.595863, 1, 1, 1, 1, 1,
1.29686, -0.3640623, 2.563051, 1, 1, 1, 1, 1,
1.298264, 1.038625, 0.506538, 1, 1, 1, 1, 1,
1.298373, -0.4879379, 2.666423, 1, 1, 1, 1, 1,
1.303899, 1.336205, 1.053173, 1, 1, 1, 1, 1,
1.309445, 0.06423657, 2.584991, 1, 1, 1, 1, 1,
1.324635, -1.899703, 2.700045, 1, 1, 1, 1, 1,
1.325027, -0.08372437, 0.7604135, 1, 1, 1, 1, 1,
1.337003, 0.4673111, -0.01390002, 1, 1, 1, 1, 1,
1.360712, -0.7580792, 0.6635072, 1, 1, 1, 1, 1,
1.36102, -0.02454123, 1.284981, 1, 1, 1, 1, 1,
1.375199, -0.2019567, 3.276519, 0, 0, 1, 1, 1,
1.382372, -0.1588899, 1.703973, 1, 0, 0, 1, 1,
1.383114, 0.833285, 1.684613, 1, 0, 0, 1, 1,
1.401486, -0.6636443, 2.362267, 1, 0, 0, 1, 1,
1.425141, -2.092514, 4.687156, 1, 0, 0, 1, 1,
1.444113, -0.9615867, 1.921283, 1, 0, 0, 1, 1,
1.455143, -1.037719, 3.588269, 0, 0, 0, 1, 1,
1.461476, -1.327094, 1.773479, 0, 0, 0, 1, 1,
1.468328, -0.2985416, 1.018637, 0, 0, 0, 1, 1,
1.471197, -0.9725901, 4.101695, 0, 0, 0, 1, 1,
1.486583, -0.7600903, 2.592091, 0, 0, 0, 1, 1,
1.496259, 0.5079075, 0.3431066, 0, 0, 0, 1, 1,
1.50342, -0.9521635, 0.2154281, 0, 0, 0, 1, 1,
1.505615, 0.6179481, 2.12469, 1, 1, 1, 1, 1,
1.514172, -2.616274, 2.61986, 1, 1, 1, 1, 1,
1.521022, -0.8337197, 2.601047, 1, 1, 1, 1, 1,
1.541287, -0.6448507, 2.266512, 1, 1, 1, 1, 1,
1.544632, 0.157031, 1.375112, 1, 1, 1, 1, 1,
1.551547, 2.935168, 1.223938, 1, 1, 1, 1, 1,
1.597604, -0.01845608, 0.01929979, 1, 1, 1, 1, 1,
1.615782, -0.05762922, 1.22723, 1, 1, 1, 1, 1,
1.635142, 1.442359, 1.095198, 1, 1, 1, 1, 1,
1.636947, 1.750564, -0.8948025, 1, 1, 1, 1, 1,
1.6386, -1.863418, 2.328349, 1, 1, 1, 1, 1,
1.645554, 1.304149, 0.4894981, 1, 1, 1, 1, 1,
1.660187, 1.943259, 0.1365172, 1, 1, 1, 1, 1,
1.673147, -0.6020563, 0.9088601, 1, 1, 1, 1, 1,
1.673241, -0.6372132, 2.582359, 1, 1, 1, 1, 1,
1.679497, 1.013558, 1.826756, 0, 0, 1, 1, 1,
1.700969, -0.3539329, -0.0441502, 1, 0, 0, 1, 1,
1.720705, 1.340164, 1.00655, 1, 0, 0, 1, 1,
1.729764, -0.6065404, 0.1460804, 1, 0, 0, 1, 1,
1.753409, 0.2410495, -0.1865865, 1, 0, 0, 1, 1,
1.769397, 1.772373, -0.12228, 1, 0, 0, 1, 1,
1.781388, 0.4407186, 1.938591, 0, 0, 0, 1, 1,
1.787235, 0.7720798, 2.012976, 0, 0, 0, 1, 1,
1.791464, 0.6940746, -0.6354734, 0, 0, 0, 1, 1,
1.812416, -0.3086008, 1.561254, 0, 0, 0, 1, 1,
1.818809, -3.429575, 3.411417, 0, 0, 0, 1, 1,
1.834804, 0.1157645, 2.475755, 0, 0, 0, 1, 1,
1.850532, 1.078046, 1.594646, 0, 0, 0, 1, 1,
1.85115, 0.4538615, -0.4421361, 1, 1, 1, 1, 1,
1.875135, -0.6081185, 2.501273, 1, 1, 1, 1, 1,
1.877535, -1.172531, 2.064817, 1, 1, 1, 1, 1,
1.890593, 0.178682, 1.14736, 1, 1, 1, 1, 1,
1.89101, -0.5185664, 2.359872, 1, 1, 1, 1, 1,
1.901502, 1.102085, 0.06561399, 1, 1, 1, 1, 1,
1.919191, 0.24717, 0.3357073, 1, 1, 1, 1, 1,
1.932725, 0.06367898, 1.261621, 1, 1, 1, 1, 1,
1.949622, 0.6809438, -0.6152372, 1, 1, 1, 1, 1,
1.96459, 0.826746, -0.8980263, 1, 1, 1, 1, 1,
1.966099, -0.1519758, 1.014243, 1, 1, 1, 1, 1,
1.966703, -0.5722288, 1.271953, 1, 1, 1, 1, 1,
1.967519, 0.3413768, -0.2634652, 1, 1, 1, 1, 1,
2.029219, 1.23122, 0.1292612, 1, 1, 1, 1, 1,
2.059894, -0.2193505, 2.399181, 1, 1, 1, 1, 1,
2.109133, -1.989826, 2.672756, 0, 0, 1, 1, 1,
2.114291, -0.4423868, 2.811639, 1, 0, 0, 1, 1,
2.153174, -0.1733489, 3.212724, 1, 0, 0, 1, 1,
2.168581, -0.4883266, 0.9344944, 1, 0, 0, 1, 1,
2.205454, -1.047144, 3.360862, 1, 0, 0, 1, 1,
2.218238, -0.2991928, 3.195133, 1, 0, 0, 1, 1,
2.242026, -0.775561, 2.123514, 0, 0, 0, 1, 1,
2.247208, 0.3206476, 0.2603491, 0, 0, 0, 1, 1,
2.268617, 1.234596, 0.6223444, 0, 0, 0, 1, 1,
2.273239, -0.8549796, 2.346041, 0, 0, 0, 1, 1,
2.2961, -1.639879, 2.345804, 0, 0, 0, 1, 1,
2.314749, -2.200262, 2.041852, 0, 0, 0, 1, 1,
2.330263, 0.8043599, -0.6928447, 0, 0, 0, 1, 1,
2.357325, 1.326935, -0.4678027, 1, 1, 1, 1, 1,
2.431365, 1.075673, 1.853549, 1, 1, 1, 1, 1,
2.438451, -1.275277, 3.504051, 1, 1, 1, 1, 1,
2.495178, -0.4662448, 4.344829, 1, 1, 1, 1, 1,
2.591872, -0.4924956, 4.116406, 1, 1, 1, 1, 1,
2.734362, -1.426027, 1.426046, 1, 1, 1, 1, 1,
3.43699, 0.06122195, 1.444208, 1, 1, 1, 1, 1
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
var radius = 9.517557;
var distance = 33.43002;
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
mvMatrix.translate( -0.1888809, 0.2472037, 0.03811073 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.43002);
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